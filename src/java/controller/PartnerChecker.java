
package controller;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.partnerAuthenticator;

@WebServlet(name = "PartnerChecker", urlPatterns = {"/PartnerChecker"})
@MultipartConfig(fileSizeThreshold = 2*1024*1024,
        maxFileSize = 10*1024*1024
        )
public class PartnerChecker extends HttpServlet {

    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
                response.sendRedirect("index.html");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
         
       String root="C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\minorProject\\web\\partners";
       //int maxDataSize=10*1024*1024;// 10 MB size of data can be upload
       //MultipartRequest mrq=new MultipartRequest(request, root,maxDataSize);
          //it gives the path of the root directory
       //Enumeration files=mrq.getFileNames();
       //String name1=(String)files.nextElement();
       //String filename=mrq.getFilesystemName(name1);
       
       Part part=request.getPart("imgPartner");
       String filename=extractFileName(part);
       String savePath="C:\\Users\\LENOVO\\Documents\\NetBeansProjects\\minorProject\\web\\partners"+File.separator+filename;
       File fileSaveDir=new File("savePath");
       part.write(savePath+File.separator);
       partnerAuthenticator pa=new partnerAuthenticator();
       boolean partner=false;
       //root is send as the path, where the file has to be saved and the method rename it by timestamp for uniqueness

        String imagePath=partnerAuthenticator.getSet(root,filename);
        String partnerName=request.getParameter("partner");
        
            try
            {
            partner=pa.isPartner(partnerName, imagePath);
            }
            catch(SQLException e)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Partner Joining Failed !')");
                out.println("location='/minorProject/Admin/partners.jsp';");
                out.println("</script>");
                //response.sendRedirect("ourCampaign/ourCampaign.jsp");
            }
            
        if(partner)
        {
            //HttpSession session=request.getSession(true);
            //session.setAttribute("FirstName", FirstName);
            //session.setAttribute("LastName", LastName);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Partner Joined...')");
            out.println("location='/minorProject/Admin/partners.jsp';");
            out.println("</script>");
            //response.sendRedirect("index.html");
        }
        else
        {
            response.sendRedirect("/minorProject/Admin/partners.jsp");
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
