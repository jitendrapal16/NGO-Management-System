package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import model.UploadTimelineAuthenticator;
@WebServlet(name = "UploadTimeline", urlPatterns = {"/UploadTimeline"})
public class UploadTimeline extends HttpServlet
{
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
        String root="C:/Users/LENOVO/Documents/NetBeansProjects/minorProject/web/timeline";
        MultipartRequest multipartRequest = new MultipartRequest(request,root,20*1024*1024);
        Enumeration files=multipartRequest.getFileNames();
       String name=(String)files.nextElement();
       String name1=(String)files.nextElement();
       String videoName=multipartRequest.getFilesystemName(name);
       String imgName=multipartRequest.getFilesystemName(name1);
        
        UploadTimelineAuthenticator ut=new UploadTimelineAuthenticator();
        boolean upload=false;
        String description=multipartRequest.getParameter("description");
        String imgPath=null;        
        if(imgName!=null){
            imgPath=UploadTimelineAuthenticator.getSetImg(root,imgName);
        }
        String videoPath=null;
        if(videoName!=null){
            videoPath=UploadTimelineAuthenticator.getSetVideo(root,videoName);
        }
        HttpSession session=request.getSession();
        String username=(String)session.getAttribute("username");
        String loginAs=(String)session.getAttribute("loginAs");
            try
            {
            upload=ut.isUpload(description, imgPath, videoPath,username);
            }
            catch(SQLException e)
            {
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try with content less than 20MB')");
                    out.println("location='/minorProject/Volunteer/dashboard.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("/minorProject/Admin/dashboard.jsp");
                    break;
                case "Member":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try with content less than 20MB')");
                    out.println("location='/minorProject/Member/dashboard.jsp';");
                    out.println("</script>");
                    //response.sendRedirect("/minorProject/Admin/dashboard.jsp");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try with content less than 20MB')");
                    out.println("location='/minorProject/Admin/dashboard.jsp';");
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
                    out.println("location='/minorProject/Volunteer/dashboard.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Successful...')");
                    out.println("location='/minorProject/Member/dashboard.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Successful...')");
                    out.println("location='/minorProject/Admin/dashboard.jsp';");
                    out.println("</script>");
                    break;
            }
        }
        else{
            switch (loginAs) {
                case "Volunteer":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try Again')");
                    out.println("location='/minorProject/Volunteer/dashboard.jsp';");
                    out.println("</script>");
                    break;
                case "Member":
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try Again')");
                    out.println("location='/minorProject/Member/dashboard.jsp';");
                    out.println("</script>");
                    break;
                default:
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Upload Failed ! Try Again')");
                    out.println("location='/minorProject/Admin/dashboard.jsp';");
                    out.println("</script>");
                    break;
            }
        }
    }


}