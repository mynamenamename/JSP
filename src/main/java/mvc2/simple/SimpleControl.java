package mvc2.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SimpleControl extends HttpServlet {

	// **************** 절대 경로위치 확인!
	private String jspDir = "/05_mvc_class/1_mvcSimple";
	

	 //get방식 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	//post방식 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
   
	 //get이나 post나 관계없이 작동하도록
    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                   String value ="안녕하세요";
                  request.setAttribute("param", value);
                  
                   //foward    <jsp:forward> 자바 코드로 변환시킴
                  RequestDispatcher disptatcher  =  request.getRequestDispatcher(jspDir + "/simpleView.jsp" );
                  
                  disptatcher.forward(request, response);
    }
    	
    	
}
