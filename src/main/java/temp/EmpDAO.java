package temp;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmpDAO {

    private EmpDAO() throws  Exception {
    	// 1. 드라이버 로딩 -> ojbc6.jar > zip 같음
    	 Class.forName("oracle.jdbc.driver.OracleDriver");
	      System.out.println("드라이버로딩 성공");   
    }
    
    //** DB 입력시 객체는 한 번만 올리도록 셋팅,,,,,!!!**
    static EmpDAO empDAO= null; //static ,returntype=EmpDAO 
    public static EmpDAO getInstance() throws  Exception { //static (클래스명 접근을 위해)
    	if( empDAO == null) empDAO = new EmpDAO();
    	return empDAO;
    }
    
	 
	public void insert(EmpVO vo) throws Exception {
		// 변수 선언
		 PreparedStatement stmt=null;
		 Connection con = null;
		
		 try {
			 
		 int empno = vo.getEmpno();
	     String ename = vo.getEname();
	     int deptno = vo.getDeptno();
	     String job = vo.getJob();
	     int sal = vo.getSal();
	     
	     
		// 2. 연결객체 얻어오기
		  String url="jdbc:oracle:thin:@localhost:1521:xe";
	      String user="scott";
	      String pass="tiger";

	      con = DriverManager.getConnection(url,user,pass);
	      System.out.println("DB 연결 성공");
	      

		// 3. sql 문장 만들기
	      String sql = "Insert into emp(empno, ename, deptno, job, sal)  "
	                + " values( ?,?,?,?,?) ";
	      
	         
	    // 4. 전송 객체 얻어오기
	      
	      stmt = con.prepareStatement(sql);
          stmt.setInt(1,empno);
          stmt.setString(2,ename);
          stmt.setInt(3,deptno);
          stmt.setString(4,job);
          stmt.setInt(5,sal);
          
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
