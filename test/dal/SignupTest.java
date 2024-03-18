/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package dal;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import entity.Account;

/**
 *
 * @author Admin
 */
public class SignupTest {

    DAO dao = new DAO();

    public SignupTest() {
    }

    @BeforeClass
    public static void setUpClass() {

    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // Sucess
    @Test
    public void testSignupValid() {
        boolean expected = true;
        boolean actual = dao.signup("UserNam", "Password123@", "nam@gmail.com");
        assertEquals(expected, actual);

    }

    @Test(expected = RuntimeException.class)
    public void testUsernameEmptyUTC1() {
        dao.signup(null, "Password123", "nam@gmail.com");
    }
     @Test(expected = RuntimeException.class)
    public void testPasswordEmptyUTC2() {
        dao.signup("Dinhnam", null, "nam@gmail.com");
    }
     @Test(expected = RuntimeException.class)
    public void testEmailEmptyUTC3() {
        dao.signup("Dinhnam", "Password123", null);
    }
      @Test(expected = RuntimeException.class)
    public void testEmptyUTC6() {
        dao.signup(null, null, null);
    }
 
 

    @Test
    public void signUpSucess() {
        boolean expected = true;
        boolean actual = dao.signup("Username","Password123", "nam@gmail.com");
        System.out.println("UTC05: " + dao.signup("Username","Password123", "nam@gmail.com"));
        assertEquals(expected, actual);
    }

  

}
