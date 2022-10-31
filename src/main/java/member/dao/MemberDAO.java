package member.dao;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
 
    private MemberDAO() throws  Exception {
    	// 1. 드라이버 로딩 -> ojbc6.jar > zip 같음
    	 Class.forName("oracle.jdbc.driver.OracleDriver");
	      System.out.println("드라이버로딩 성공");   
    }
    
    //** DB 입력시 객체는 한 번만 올리도록 셋팅,,,,,!!!**
    
    static MemberDAO memberDAO= null; //static ,returntype=EmpDAO 
    
    public static MemberDAO getInstance() throws  Exception { //static (클래스명 접근을 위해)
    	if( memberDAO == null) memberDAO = new MemberDAO(); //memberDAO 가 처음 생성될때 객체를 생성하고!
    	return memberDAO;                                   
    }
    
	 
	public void insert(MemberVO vo) throws Exception {
		// 변수 선언
		 PreparedStatement stmt=null;
		 Connection con = null;
		 
		
		 try {
		      String name = vo.getName();
		      String ename = vo.getEname();
		      String email = vo.getEmail();
		      int age  = vo.getAge();
	     
		// 2. 연결객체 얻어오기
		  String url="jdbc:oracle:thin:@localhost:1521:xe";  // > DB는 팀원 하나꺼로!
	      String user="scott";
	      String pass="tiger";

	      con = DriverManager.getConnection(url,user,pass);
	      System.out.println("DB 연결 성공");
	      

		// 3. sql 문장 만들기
	      String sql = " Insert into bad(name, ename, email, age)  "
	                + " values(?,?,?,?)   ";
	      
	         
	    // 4. 전송 객체 얻어오기
	      
	      stmt = con.prepareStatement(sql);
          stmt.setString(1,name);
          stmt.setString(2,ename);
          stmt.setString(3,email);
          stmt.setInt(4,age);
          
		 } finally {
	    // 5. 전송
	         /*    - ResultSet exeucuteQuery() : SELECT 
	          *    - Int executeUpdate() : INSERT/DELETE/UPDATE
	          */
	     
         stmt.executeUpdate();
	   
		 }
	         //6. 닫기
	        
	        stmt.close();
			con.close();
	         
	      }
}
