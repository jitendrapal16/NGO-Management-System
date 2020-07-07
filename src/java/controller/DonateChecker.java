
package controller;


import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DonateAuthenticator;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "DonateChecker", urlPatterns = {"/DonateChecker"})
public class DonateChecker extends HttpServlet {
            
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("donate.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
       HttpSession sesion=request.getSession(true);
        String type=sesion.getAttribute("type").toString();
        String amount=sesion.getAttribute("amount").toString();
        //String donorFrom=sesion.getAttribute("donorFrom").toString();
        String donorFrom=request.getParameter("IM");
        PrintWriter out = response.getWriter();
        out.println(donorFrom);
        
       
       
        DonateAuthenticator da=new DonateAuthenticator();
        boolean donate=false;
        
        String fullName=request.getParameter("fname");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String dob=request.getParameter("dob");
        String address=request.getParameter("adr");
        String city=request.getParameter("city");
        String postalCode=request.getParameter("pc");
        String panNum=request.getParameter("pcnum");
        String country=request.getParameter("country");
        String state=request.getParameter("state");
        
            try
            {
            donate=da.isDonateIndian(fullName, email, phone, dob, address, city, postalCode, panNum, country, state, type, amount, donorFrom);
            }
            catch(SQLException | ParseException e)
            {
                //out.println("alert('Donation Failed !')");
                response.sendRedirect("donate.html");
            }
        
        if(donate)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            response.sendRedirect("index.html");
            out.println("alert(Donation Completed...)");
        }
        else
        {
            //response.sendRedirect("donate.html");
        }
    }
}
