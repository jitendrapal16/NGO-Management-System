package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.HappenAuthenticator;


@WebServlet(name = "HappenChecker", urlPatterns = {"/HappenChecker"})
@MultipartConfig(fileSizeThreshold = 2*1024*1024,
        maxFileSize = 10*1024*1024
        )
public class HappenChecker extends HttpServlet {
    
    
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
        
       String root="C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\minorProject\\web\\HappeningImg";
       //int maxDataSize=10*1024*1024;// 10 MB size of data can be upload
       //MultipartRequest mrq=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       //Enumeration files=mrq.getFileNames();
       //String name1=(String)files.nextElement();
       //String filename=mrq.getFilesystemName(name1);
       
       Part part=request.getPart("imgCause");
       String filename=extractFileName(part);
       String savePath="C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\minorProject\\web\\HappeningImg"+File.separator+filename;
       File fileSaveDir=new File("savePath");
       part.write(savePath+File.separator);
       HappenAuthenticator ha=new HappenAuthenticator();
       boolean happen=false;
       //root is send as the path, where the file has to be saved and the method rename it by timestamp for uniqueness
            String imgPath=HappenAuthenticator.getSet(root,filename);
            String causeTitle=request.getParameter("causeTitle");
            try
            {
            happen=ha.isHappen(causeTitle, imgPath);
            }
            catch(SQLException e)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Happening Cause Failed !')");
                out.println("location='/minorProject/Admin/happen.jsp';");
                out.println("</script>");
               //response.sendRedirect("/minorProject/Admin/happen.jsp");
            } 
            
        if(happen)
        {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Happening Cause Added..')");
                out.println("location='/minorProject/Admin/happen.jsp';");
                out.println("</script>");
               //response.sendRedirect("/minorProject/Admin/happen.jsp");
        }
        else
        {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Happening Cause Failed !')");
                out.println("location='/minorProject/Admin/happen.jsp';");
                out.println("</script>");
               //response.sendRedirect("/minorProject/Admin/happen.jsp");
        }
    }
     private String extractFileName(Part part){
         String contentDisp=part.getHeader("content-disposition");
         String[] items=contentDisp.split(";");
         for(String s:items){
             if(s.trim().startsWith("filename")){
                 return s.substring(s.indexOf("=")+2,s.length()-1);
             }
         }
         return "";
     }

}
