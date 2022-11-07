package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

   
   // DB 연결시  관한 변수 

   private static final String    dbDriver   =   "oracle.jdbc.driver.OracleDriver";
   private static final String      dbUrl      =   "jdbc:oracle:thin:@192.168.0.56:1521:xe";
   private static final String      dbUser      =   "scott";
   private static final String      dbPass      =   "tiger";

      
   private static MemberDao memberDao;
   
   public static MemberDao getInstance() throws MemberException
   {
      if( memberDao == null )
      {
         memberDao =  new MemberDao();
      }
      return memberDao;
   }
   

   private MemberDao() throws MemberException
   {
         
      try{
         //1. driver loading (보낼 때마다가 아닌 드라이버 로딩 1번만 할거임)
         Class.forName("oracle.jdbc.driver.OracleDriver");
         System.out.println("드라이버로딩 성공");   
      
      }catch( Exception ex ){
         throw new MemberException("DB 연결시 오류  : " + ex.toString() );   
      }
   }
   
   /*******************************************
    * * 회원관리테이블 MEMBERTEST 에  회원정보를 입력하는 함수
    * @param rec
    * @throws MemberException
    */
   public void insertMember( Member rec ) throws MemberException
   {
      try {
         // 0. 연결 객체 얻어오기
         String url="jdbc:oracle:thin:@192.168.0.56:1521:xe";
         String user="scott";
         String pass="tiger";

         Connection con=null;                                 //전송 객체 선언 해주기
         PreparedStatement ps=null;
         
         con = DriverManager.getConnection(url,user,pass);
         System.out.println("DB 연결 성공"); 
         
          // 1. sql 문장 만들기 ( insert문 )
         String sql = "INSERT INTO memberTest (id, password, name, tel, addr ) VALUES (?,?,?,?,?) ";
          
         // 2. sql 전송 객체 만들기
         ps=con.prepareStatement(sql);
         ps.setString(1,rec.getId());
         ps.setString(2,rec.getPassword());;
         ps.setString(3,rec.getName());;
         ps.setString(4,rec.getTel());
         ps.setString(5,rec.getAddr());
         
         // 3. sql 전송
         ps.executeUpdate();
         
         // 4. 객체 닫기
         ps.close();
         con.close();
         
      } catch ( Exception ex ){
         throw new MemberException("멤버 입력시 오류  : " + ex.toString() );         
      }         
   }
   
   /**********************************************************
    * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
    */
   public boolean isDuplicatedId( String id ) throws MemberException{
      Connection con = null; // 값 초기화
      PreparedStatement ps = null; // 값 초기화
      boolean flag = false;
      ResultSet rs = null;
      
      try{
         // 0. 연결 객체 얻어오기   
         String url = "jdbc:oracle:thin:@192.168.0.56:1521:xe";
         String user = "scott";
         String pass = "tiger";
         
         con = DriverManager.getConnection(url, user, pass);
         System.out.println("연결성공");
         
         // 1. sql 문장 만들기(select 문장)
         String sql = "SELECT * FROM MEMBERTEST WHERE id=?";
         
         // 2. sql 전송 객체 만들기
          ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
         
         // 3. sql 전송
         if(rs.next()) {
            flag = true;
         }
         
         // 4. 객체 닫기
         rs.close();
         ps.close();
         con.close();
         
      }catch( Exception ex ){
         throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );         
      }
         
      return flag;
   }
   
   
   
   public boolean checkLogin(String id, String pass)
   throws Exception { 
	     boolean result= false; 
	   
	   
	      Connection con = null; // 값 초기화
	      PreparedStatement ps = null; // 값 초기화
	      ResultSet rs = null;
	      
	      try{
	         // 0. 연결 객체 얻어오기   
	         String url = "jdbc:oracle:thin:@192.168.0.56:1521:xe";
	         String user = "scott";
	         String pass1 = "tiger";
	         
	         con = DriverManager.getConnection(url, user, pass1);
	         System.out.println("연결성공");
	         
	         // 1. sql 문장 만들기(select 문장)
	         String sql = "SELECT * FROM MEMBERTEST WHERE id=? AND password=?";
	         
	         // 2. sql 전송 객체 만들기
	          ps = con.prepareStatement(sql);
	          ps.setString(1, id);
	          ps.setString(2, pass);
	            
	            rs = ps.executeQuery();
	         
	         // 3. sql 전송
	         if(rs.next()) {
	            result = true;   //이렇게 넣기.....
	         }
	         
	         // 4. 객체 닫기
	         rs.close();
	         ps.close();
	         con.close();
	         
	      }catch( Exception ex ){
	         throw new MemberException("아이디 패스워드 검사시 오류  : " + ex.toString() );         
	      }
	         
	   
	   
	   
	   return result;
	   
	   
	   
   }
   
   
   
   
   
   
}