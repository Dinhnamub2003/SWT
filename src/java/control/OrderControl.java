package control;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dal.DAO;
import dal.ProductDAO;

import entity.Account;
import entity.Email;
import entity.EmailUtils;
import entity.Cart;
import entity.Product;
import entity.SoLuongDaBan;
import entity.TongChiTieuBanHang;
import java.io.PrintWriter;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();
        DAO dal = new DAO();
        ProductDAO d = new ProductDAO();
        List<Cart> list = dal.getCartByAccountID(accountID);
        List<Product> list2 = d.getAllProduct();
        double totalMoney = 0;
        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    totalMoney = totalMoney + (p.getPrice() * c.getAmount());
                }
            }
        }
        double totalMoneyVAT = totalMoney + totalMoney * 0.1;

        double tongTienBanHangThem = 0;
        int sell_ID;
        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    tongTienBanHangThem = 0;
                    sell_ID = d.getSellIDByProductID(p.getId());
                    tongTienBanHangThem = tongTienBanHangThem + (p.getPrice() * c.getAmount());
                    TongChiTieuBanHang t2 = dal.checkTongChiTieuBanHangExist(sell_ID);
                    if (t2 == null) {
                        dal.insertTongChiTieuBanHang(sell_ID, 0, tongTienBanHangThem);
                    } else {
                        dal.editTongBanHang(sell_ID, tongTienBanHangThem);
                    }
                }
            }
        }

        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    SoLuongDaBan s = dal.checkSoLuongDaBanExist(p.getId());
                    if (s == null) {
                        dal.insertSoLuongDaBan(p.getId(), c.getAmount());
                    } else {
                        dal.editSoLuongDaBan(p.getId(), c.getAmount());
                    }
                }
            }
        }

        dal.insertInvoice(accountID, totalMoneyVAT);
        TongChiTieuBanHang t = dal.checkTongChiTieuBanHangExist(accountID);
        if (t == null) {
            dal.insertTongChiTieuBanHang(accountID, totalMoneyVAT, 0);
        } else {
            dal.editTongChiTieu(accountID, totalMoneyVAT);
        }

        request.getRequestDispatcher("DatHang.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
          response.setContentType("text/html;charset=UTF-8");
        try {
            String emailAddress = request.getParameter("email");
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String deliveryAddress = request.getParameter("deliveryAddress");

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            if (a == null) {
                response.sendRedirect("login");
                return;
            }
            int accountID = a.getId();
            DAO dal = new DAO();
            ProductDAO d = new ProductDAO();
            List<Cart> list = dal.getCartByAccountID(accountID);
            List<Product> list2 = d.getAllProduct();

            double totalMoney = 0;
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        totalMoney = totalMoney + (p.getPrice() * c.getAmount());
                    }
                }
            }
            double totalMoneyVAT = totalMoney + totalMoney * 0.1;

            //old code
            Email email = new Email();
            email.setFrom("quyendinhnam.ub2003@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
            email.setFromPassword("oxni ckxx mota ysea"); //mat khau email tren
            email.setTo(emailAddress);
            email.setSubject("Dat Hang Thanh Cong Tu Oc Che Ngon Shop");
            StringBuilder sb = new StringBuilder();
            sb.append("Dear ").append(name).append("<br>");
            sb.append("Bạn vừa đặt hàng thành công từ  Ốc Chè Ngon Shop. <br> ");
            sb.append("Địa chỉ nhận của bạn là: <b>").append(deliveryAddress).append(" </b> <br>");
            sb.append("Số điện thoại của bạn khi nhận là: <b>").append(phoneNumber).append(" </b> <br>");
            sb.append("Tên sản phẩm đã đặt: <br>");
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append("<br>");
                    }
                }
            }
            sb.append("Tổng Tiền: ").append(String.format("%.02f", totalMoneyVAT)).append("$").append("<br>");
            sb.append("Cảm ơn bạn đã tin tưởng Ốc Chè Ngon Shop<br>");
            sb.append("Chủ cửa hàng");

            email.setContent(sb.toString());
            EmailUtils.send(email);
            request.setAttribute("mess", "Đặt hàng thành công!");

            dal.deleteCartByAccountID(accountID);

            //new code
//				request.setAttribute("email", emailAddress);
//				request.getRequestDispatcher("ThongTinDatHang.jsp").forward(request, response);
        } catch (Exception e) {
            // Log the exception
            e.printStackTrace();
            request.setAttribute("error", "Đặt hàng thất bại: " + e.getMessage());
        }

        request.getRequestDispatcher("DatHang.jsp").forward(request, response);
    }

}
