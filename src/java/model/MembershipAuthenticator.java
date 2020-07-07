
package model;

import db.DBConnector;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class MembershipAuthenticator {
    public static boolean getStatus(String username) throws SQLException{
                                //String dateAfterString = "";
                                String dateAfterString=null;
                                Statement st=DBConnector.getStatement();
                                ResultSet rs=st.executeQuery("SELECT expiryDate from membership where username='"+username+"'");
                                if(rs.next()){
                                    dateAfterString = rs.getString(1);
                                }
                                
                                dateAfterString = dateAfterString.substring(0, 10);
                                //PrintWriter out=response.getWriter();
                                //out.print(dateAfterString);
                                String pattern = "yyyy-MM-dd";
                                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

                                String dateBeforeString = simpleDateFormat.format(new Date());
                                //Parsing the date
                                LocalDate dateBefore = LocalDate.parse(dateBeforeString);
                                LocalDate dateAfter = LocalDate.parse(dateAfterString);

                                //calculating number of days in between
                                int noOfDaysBetween = (int)ChronoUnit.DAYS.between(dateBefore, dateAfter);
                                if(noOfDaysBetween<0){
                                    return false;
                                }
        return true;
    }
}
