/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.DBConnector;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "DeleteCampaign", urlPatterns = {"/DeleteCampaign"})
public class DeleteCampaign extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        PrintWriter out = response.getWriter();
      // out.println("file uploaded Successfully");
            String row=request.getParameter("row");
            boolean deleted=false;
            try
            {
                Connection con=DBConnector.getConnection();
                Statement st=DBConnector.getStatement();
                //Statement st1=DBConnector.getStatement();
                String query1="SELECT * FROM campaigns where imgName='"+row+"'";
                PreparedStatement ps=con.prepareStatement("Insert INTO decampaigns values(?,?,?,?,?,?,?,?,?)");
                ResultSet rs=st.executeQuery(query1);
                while(rs.next()){
                    ps.setString(1, rs.getString("name"));
                    ps.setString(2, rs.getString("description"));
                    ps.setString(3, rs.getString("type"));
                    ps.setInt(4, rs.getInt("goalAmt"));
                    ps.setInt(5, rs.getInt("raisedAmt"));
                    ps.setInt(6, rs.getInt("donors"));
                    ps.setString(7,rs.getString("imgLocalPath"));
                    ps.setDate(8,rs.getDate("raisedOn"));
                    ps.setString(9,rs.getString("imgName"));
                }
                ps.executeUpdate();
                String query="DELETE from campaigns where imgName='"+row+"'";
                int n=st.executeUpdate(query);
                if(n>0){
                    deleted=true;
                }
            }
            catch(SQLException e)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('NOT DELETED, TRY AGAIN!')");
                out.println("location='/minorProject/Admin/campaign.jsp';");
                out.println("</script>");
                //response.sendRedirect("/minorProject/Admin/campaign.jsp");
            } 
            if(deleted){
                //response.sendRedirect("/minorProject/Admin/campaign.jsp");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('DELETED');");
                out.println("location='/minorProject/Admin/campaign.jsp';");
                out.println("</script>");
            }
    }

 
    
}
