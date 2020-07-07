package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginAuthenticator;
import model.RegAuthenticator;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "RegChecker", urlPatterns = {"/RegChecker"})
public class RegChecker extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
        
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        //HttpSession sesion=request.getSession(true);
        //String FirstName=sesion.getAttribute("fname").toString();
        //String LastName=sesion.getAttribute("lname").toString();
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String dob=request.getParameter("dob");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String profession=request.getParameter("profession");
        String nationality=request.getParameter("nationality");
        String gender=request.getParameter("gender");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        //sesion.setAttribute("username", request.getParameter("username"));
        //sesion.setAttribute("password", request.getParameter("password"));
        PrintWriter out=response.getWriter();
        boolean register=false;
        RegAuthenticator rauthenticator=new RegAuthenticator();
        try
        {
        register=rauthenticator.isRegister(fname, lname, dob, email, phone, address, profession, nationality, gender, username, password);
        }
        catch(SQLException | ParseException e)
        {
            out.println("<script>");
            out.println("alert('Registration Failed..');");
            out.println("location='login.html';");
            out.println("</script>");
        }
        if(register)
        {
            out.println("<script>");
            out.println("alert('Registered');");
            out.println("location='index.html';");
            out.println("</script>");
            //response.sendRedirect("index.html");
        }
        else
        {
            //response.sendRedirect("index.html");
            out.println("Registration Failed..");
        }

    }


}
