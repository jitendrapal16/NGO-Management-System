
package controller;

import com.oreilly.servlet.MultipartRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.imgGalleryAuthenticator;

@WebServlet(name = "imgGalleryChecker", urlPatterns = {"/imgGalleryChecker"})
public class imgGalleryChecker extends HttpServlet {

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
                response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
      // out.println("file uploaded Successfully ");
        
       String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/imgGallery";
       int maxDataSize=10*1024*1024;// 10 MB size of data can be upload
       MultipartRequest mr=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       Enumeration files=mr.getFileNames();
       String name1=(String)files.nextElement();
       String filename=mr.getFilesystemName(name1);
        imgGalleryAuthenticator ig=new imgGalleryAuthenticator();
        boolean upload=false;      
        //String root=getServletContext().getRealPath("/passport");
        String imagePath=imgGalleryAuthenticator.getSet(root,filename);
        String eName=mr.getParameter("eName");
        
        
            try
            {
            upload=ig.isUpload(imagePath, eName);
            }
            catch(SQLException e)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Upload Failed !')");
                out.println("location='/minorProject/Admin/media.jsp';");
                out.println("</script>");
                //response.sendRedirect("ourCampaign/ourCampaign.jsp");
            }
        
        
        
        
        if(upload)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Upload Completed...')");
            out.println("location='/minorProject/Admin/media.jsp';");
            out.println("</script>");
            //response.sendRedirect("index.html");
        }
        else
        {
            //response.sendRedirect("donate.html");
        }
    }
    
}
