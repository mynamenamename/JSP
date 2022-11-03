package board_ex.service;

import java.util.List;
import board_ex.model.*;
import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;



   public class ListArticleService {
   private static ListArticleService instance;
   private int totalRecCount;      // 전체 레코드 수   
   private int pageTotalCount;      // 전체 페이지 수
   private int countPerPage = 3;   // 한페이지당 레코드 수
   
   
   public static ListArticleService getInstance()  throws BoardException{
      if( instance == null )
      {
         instance = new ListArticleService();
      } 
      return instance;
   }
   
   //전체 레코드 수로 페이지 수를 구하는 메소드   
   public int getTotalPage() throws MessageException, BoardException{
      //전체 레코드수
      totalRecCount =BoardDao.getInstance().getTotalCount();
      /*
       * 전체 레코드 수       페이지 수
       *       9            3
       *       10            4
       *       11            4
       *       13            5
       * 
       * totalRecCount  /  pageTotalCount 
       */
      pageTotalCount=totalRecCount/countPerPage;
      if((totalRecCount%countPerPage)>0) {pageTotalCount++;}
      
      //전체 레코드수에 따른 페이지수 리턴
      return pageTotalCount;
   }
   
   //페이지에 따라서 설정한 countPerPage 값만큼 게시글이 보이게 해주는 메소드
   public List <BoardVO> getMessageList(String pNum) throws MessageException, BoardException
   {
      int pageNum =1;
      if(pNum != null) pageNum=Integer.parseInt(pNum);
      
      /* 페이지 번호         시작 레코드 번호      끝 레코드 번호
       *      1            1               3
       *      2            4               6
       *      3            7               9 
       */
      int startRow= countPerPage*pageNum-(countPerPage-1); 
      int endRow   = pageNum*countPerPage;
         
      List <BoardVO> mList = BoardDao.getInstance().selectList(startRow, endRow);      
      return mList;
   }
   
   
}