/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DonateCampAuthenticator;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "DonateCampChecker", urlPatterns = {"/DonateCampChecker"})
public class DonateCampChecker extends HttpServlet {
                 
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
                response.sendRedirect("ourCampaign/ourCampaign.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
       HttpSession sesion=request.getSession(true);
        String name=sesion.getAttribute("name").toString();
        String donateField=sesion.getAttribute("type").toString();
        //String donorFrom=sesion.getAttribute("donorFrom").toString();
        String donorFrom=request.getParameter("IM");
        PrintWriter out = response.getWriter();
        out.println(donorFrom);
        
       
       
        DonateCampAuthenticator da=new DonateCampAuthenticator();
        boolean donate=false;
        String amount=request.getParameter("amt");
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
            donate=da.isDonateIndian(fullName, email, phone, dob, address, city, postalCode, panNum, country, state, donateField, amount, donorFrom,name);
            }
            catch(SQLException | ParseException e)
            {
                //out.println("alert('Donation Failed !')");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Donation Failed !')");
                //out.println("location='ourCampaign/ourCampaign.jsp';");
                out.println("</script>");
                response.sendRedirect("ourCampaign/ourCampaign.jsp");
            }
        
       
        if(donate)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Donation Completed...')");
            //out.println("location='index.html';");
            out.println("</script>");
            response.sendRedirect("index.html");
            //out.println("alert(Donation Completed...)");
        }
        else
        {
            //response.sendRedirect("donate.html");
        }
    }
}
