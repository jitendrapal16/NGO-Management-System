/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "UpdateNewsCategory", urlPatterns = {"/UpdateNewsCategory"})
public class UpdateNewsCategory extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("media.news.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        String newsCat=request.getParameter("newsCat");
        request.setAttribute("newsCat", newsCat);
        RequestDispatcher rDispatcher = request.getRequestDispatcher("media.news.jsp");
        rDispatcher.forward(request, response);

        //NewsUpdation n=new NewsUpdation(newsCat);
        //response.sendRedirect("media.news.jsp");
    }
}
