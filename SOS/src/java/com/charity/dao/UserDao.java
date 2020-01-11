
package com.charity.dao;
import com.charity.bean.User;
import com.charity.bean.Login;
import static com.charity.dao.UserDao.con;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.sql.Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    
     static Connection con=null;
    static PreparedStatement pst=null;
    static PreparedStatement pst1=null;
    static ResultSet rs;
    //////////////////////////Connecting//////////////////////////////////////////////////////////////////////////
     public static Connection dbConnection()throws SQLException{
     
		try{
                        DBDAO.connect();
                        con=DBDAO.getDbCon();
		   
                }
		catch(ClassNotFoundException  e){
			 System.out.println("class not found e:"+e.getMessage()) ; 
		}
		catch(SQLException e){
			System.out.println(e.getMessage());
		}
		return con;
   }
    ////////////////////////////////End of connection code/////////////////////////////////////////////////
     
   ////////////////////////////////////Registering in to sos////////////////////////////////////////////////////////
     public static boolean Register(User user) throws SQLException{
        con=dbConnection();            
        boolean flag=false;
        try{
            int login_id=0;
            //inserting into Login table
            pst1=con.prepareStatement("insert into CHARITY_LOGIN(login_id,username,password,role) values(seq1.NEXTVAL,?,?,'user')");         
            pst1.setString(1,user.getUsername());
            pst1.setString(2,user.getPassword());
            rs=pst1.executeQuery(); 
            
            //Selecting newly created login id
            PreparedStatement pst2=con.prepareStatement("select login_id from CHARITY_LOGIN where username=? and password=?");
            pst2.setString(1,user.getUsername());
            pst2.setString(2,user.getPassword());  
            rs=pst2.executeQuery();           
            while(rs.next()){
              login_id =rs.getInt("login_id");
            }
            
            //inserting into registraion table
            
            pst=con.prepareStatement("insert into CHARITY_REG(firstname,lastname,profession,qualification,phonenumber,sex,country,email,ID,status,role,login_id) values(?,?,?,?,?,?,?,?,seq1.NEXTVAL,1,'user',?)");       
            pst.setString(1,user.getFirstname());
            pst.setString(2,user.getLastname());
            pst.setString(3,user.getProfession());
            pst.setString(4,user.getQualification());
            pst.setString(5,user.getPhonenumber());
            pst.setString(6,user.getSex());
            pst.setString(7,user.getCountry());
            pst.setString(8,user.getEmail());
            pst.setInt(9,login_id);
            pst.executeUpdate();     
            flag=true;  
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        catch(NumberFormatException e){
            e.printStackTrace();
        }
        return flag;
    }
     
    /////////////////////////////////////End of Registeration////////////////////////////////////////////////////
     
    ////////////////////////////////////Login Page//////////////////////////////////////////////////////////////// 
     
       public static User Login(Login log ) throws SQLException{
             con=dbConnection(); 
             String role = null;
             String fname = null;
             int login_id = 0;
             User user = new User();
        try{
            int id=0;
            PreparedStatement pst2=con.prepareStatement("select * from CHARITY_LOGIN where username=? and password=?");
            pst2.setString(1,log.getUsername());
            pst2.setString(2,log.getPassword());  
            rs=pst2.executeQuery();           
            while(rs.next()){
                role = rs.getString("role");
                login_id = rs.getInt("login_id");
               } 
            PreparedStatement pst3=con.prepareStatement("select * from CHARITY_REG where login_id=?");
            pst3.setInt(1, login_id);
            rs=pst3.executeQuery();           
            while(rs.next()){
                    fname = rs.getString("firstname");
                    id=rs.getInt("id");
               }  
            user.setFirstname(fname);
            user.setRole(role);
            user.setId(id);
            
        }
        catch(SQLException e){
            e.printStackTrace();
        }
      return user;  
 }
     
 ////////////////////////////////END OF LOGIN PAGE//////////////////////////////////////////////////
 ///////////////////////////////Veiw user list/////////////////////////////////////////////////////
       public static List<User> getRecords() throws SQLException{
           System.out.println("com.charity.dao.UserDao.getRecords()");
           List<User> list=new ArrayList<User>();  
            con = dbConnection();
           User u=null;  
	    try{  
	         
	        PreparedStatement ps=con.prepareStatement("select * from CHARITY_REG where ROLE='user'");  
	        rs=ps.executeQuery();  
	        while(rs.next()){ 
                    System.out.println("............inside while dont dare..............");
	            u=new User();  
                    u.setId(rs.getInt("ID"));
	            u.setFirstname(rs.getString("FIRSTNAME"));
	            u.setLastname(rs.getString("LASTNAME")); 
                    u.setProfession(rs.getString("PROFESSION"));
                    u.setQualification(rs.getString("QUALIFICATION"));
                    u.setPhonenumber(rs.getString("PHONENUMBER"));
	            u.setSex(rs.getString("SEX"));  
	            u.setCountry(rs.getString("COUNTRY"));
                    u.setEmail(rs.getString("EMAIL")); 
                    list.add(u);
	        }
                System.out.println("list length "+list.size());
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  

 /////////////////////////////////////////////Delete user//////////////////////////////////
       public static void delete(String id) throws SQLException{
           con = dbConnection();
           try{
               PreparedStatement pst = con.prepareStatement("delete from CHARITY_REG WHERE id=?");
               int ids = Integer.parseInt(id,10);
               pst.setInt(1, ids);
               rs = pst.executeQuery();
               }
           catch(Exception e){System.out.println(e);}
       }
       
  //////////////////////////////////////////////edit user///////////////////////////////////
       public static boolean edit(User user)throws SQLException{
           
        
           boolean flag=false;
           con = dbConnection();
           try{
             
            
             PreparedStatement ps=con.prepareStatement("update CHARITY_REG set firstname=?,lastname=?,profession=?,qualification=?,phonenumber=?,sex=?,country=?,email=? where id=?");  
            ps.setString(1,user.getFirstname());
            ps.setString(2,user.getLastname());
            ps.setString(3,user.getProfession());
            ps.setString(4,user.getQualification());
            ps.setString(5,user.getPhonenumber());
            ps.setString(6,user.getSex());
            ps.setString(7,user.getCountry());
            ps.setString(8,user.getEmail());
            ps.setInt(9,user.getId());
            ps.executeUpdate();
            flag=true;  
               
           }catch(Exception e){System.err.println(e);}
           return flag;
       }

}
     
     
    
