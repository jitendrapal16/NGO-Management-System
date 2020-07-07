
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
import javax.servlet.http.HttpSession;
import model.ProfileUploadAuthenticator;

@WebServlet(name = "ProfileUpload", urlPatterns = {"/ProfileUpload"})
public class ProfileUpload extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.sendRedirect("index.html");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/profile";
        MultipartRequest multipartRequest = new MultipartRequest(request,root,20*1024*1024);
        Enumeration files=multipartRequest.getFileNames();
       String profileImg=(String)files.nextElement();
       String backImg=(String)files.nextElement();
       String backImgName=multipartRequest.getFilesystemName(backImg);
       String profileImgName=multipartRequest.getFilesystemName(profileImg);
        
        ProfileUploadAuthenticator pt=new ProfileUploadAuthenticator();
        boolean upload=false;
        String backImgPath=null;        
        if(backImgName!=null){
            backImgPath=ProfileUploadAuthenticator.getSetImg1(root,backImgName);
        }
        String profileImgPath=null;        
        if(profileImgName!=null){
            profileImgPath=ProfileUploadAuthenticator.getSetImg2(root,profileImgName);
        }
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        String loginAs=(String)session.getAttribute("loginAs");
            try
            {
            upload=pt.isUpload(username);
            }
            catch(SQLException e)
            {
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try with content less than 10MB')");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("/minorProject/Admin/dashboard.jsp");
                    break;
                case "Member":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try with content less than 10MB')");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("/minorProject/Admin/dashboard.jsp");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try with content less than 10MB')");
                    out.println("location='/minorProject/Admin/user.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("/minorProject/Admin/dashboard.jsp");   
                    break;
            }
            }
         
        if(upload){
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Successful...')");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Successful...')");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Successful...')");
                    out.println("location='/minorProject/Admin/user.jsp';");
                    out.println("</script>");
                    break;
            }
        }
        else{
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try Again')");
                    out.println("location='/minorProject/Volunteer/user.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try Again')");
                    out.println("location='/minorProject/Member/user.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try Again')");
                    out.println("location='/minorProject/Admin/user.jsp';");
                    out.println("</script>");
                    break;
            }
        }
    }
    
}
