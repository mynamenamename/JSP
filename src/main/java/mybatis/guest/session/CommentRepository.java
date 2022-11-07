package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		//마이바티스 파일 설정하는 코딩이다~~정도만 생각하게끔
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	  
	public List<Comment> selectComment(){
		 //*** 연결객체 Connection >>> SqlSession
		SqlSession session = getSqlSessionFactory().openSession();
		try {              //여러개일때 selectlist
			return session.selectList("CommentMapper.selectComment");
		}finally {
			session.close(); //연결객체 반환
		}
	}
	
	
	public Comment selectCommentByPK(int commentNo) {
		SqlSession session = getSqlSessionFactory().openSession();
		 try {  //객체에 담은다음에 넘기기   ////한개일때 selectone
			     //조건비교할 때 여러개 비교하려고 hashmap , 요기의 hashmap을 밑에  넘겨줘야됨
			 HashMap map = new HashMap();  
			 map.put("commentNo", commentNo);
			 Comment c = session.selectOne("CommentMapper.selectCommentByPK", map);
			 return c;
		 }finally {
			session.close(); //연결객체 반환
		 }
		 
		 
	}
	
	public void insertComment(Comment c) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement= "CommentMapper.insertComment";
			int result= session.insert(statement,c ); //사용자 입력값 넘겨주기
			//***mybatis는 자동 커밋이 안되기 때문에 설정해줘야함
			if(result>0) session.commit();   
			else session.rollback();
		}finally {
			session.close(); //연결객체 반환
		}
	}

	
	public void deleteComment(int cId) {
		SqlSession session = getSqlSessionFactory().openSession();
		try {
			String statement="CommentMapper.deleteComment";
			int result = session.insert(statement,cId);
			if(result>0) session.commit();
			else session.rollback();
			// 마이바이즈 = 오토커밋 아님.
		}finally {
			session.close(); // 연결객체 반환
		}
	}
	
	
	
	
}
