package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginAuthenticator;

@WebServlet(name = "LoginChecker", urlPatterns = {"/LoginChecker"})
public class LoginChecker extends HttpServlet 
{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String loginAs=request.getParameter("loginas");
        //String remember=request.getParameter("rememberMe");
        boolean login=false;
        LoginAuthenticator authenticator=new LoginAuthenticator();
        
        try
        {
        login=authenticator.isLogin(username, password, loginAs);
        }
        catch(SQLException e)
        {
            out.println("<script>");
            out.println("alert('Login Failed ! Try again');");
            out.println("location='index.html';");
            out.println("</script>");
            
        }
        if(login)
        {
            HttpSession session=request.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("loginAs", loginAs);
            if(loginAs.contains("Volunteer")){
            response.sendRedirect("/minorProject/Volunteer/dashboard.jsp");
            }
            else if(loginAs.contains("Member")){
            response.sendRedirect("/minorProject/Member/dashboard.jsp");
            }
            else{
            response.sendRedirect("/minorProject/Admin/dashboard.jsp");
            }
            
        }
        else
        {
            out.println("<script>");
            out.println("alert('Login Failed ! Try again');");
            out.println("location='index.html';");
            out.println("</script>");
        }

    }
}
