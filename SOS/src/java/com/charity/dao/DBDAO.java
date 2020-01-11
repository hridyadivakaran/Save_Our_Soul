package com.charity.dao;
import static com.charity.dao.DBDAO.setDbCon;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO implements Serializable{
    private  static Connection dbCon;  
    private  static String dbURL;
    private  static  String dbDriver; 
    private  static String userName;
    private  static  String password; 
    
    public DBDAO(){  	    
		 super();   	       
        }
    
    private static void dbInit(){
        try{
            dbDriver="oracle.jdbc.driver.OracleDriver";	  
            dbURL="jdbc:oracle:thin:@localhost:1521:xe";
            userName="system";	 
            password="system";
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public  static void connect() throws ClassNotFoundException,SQLException { 
	          dbInit();
	          Class.forName(dbDriver); 
	          dbCon = DriverManager.getConnection(dbURL,userName,password); 
	          setDbCon(dbCon);	    
        }
    public static Connection getDbCon(){
		return dbCon;
	}
	
	public static void setDbCon(Connection con){
		dbCon=con;
	}
	public static void close() throws SQLException{ 
	        dbCon.close(); 
	}
}
