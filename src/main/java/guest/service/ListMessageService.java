package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{    
		int pageNum = 1; //값이 안들어 오면 무조건 1페이지
		if(pNum != null) pageNum = Integer.parseInt(pNum);
		//null이 아닐때는 형 변환해서 pNum 으로 지정!
		
		/*    페이지번호              시작레코드번호     끝레코드번호
		  *       1                                 1                       3
		  *       2                                 4                        6
		  *       3                                 7                        9
		 */
	  
  	  //  int startRow  = countPerPage*pageNum-2;
  	    int startRow      =   countPerPage*pageNum-(countPerPage-1);
		int endRow   = pageNum * countPerPage ;
		
		
		List <Message> mList = MessageDao.getInstance().selectList(startRow,endRow);			
		return mList;
	}
	
	
	public int getTotalPage() throws MessageException
	{
		//전체레코드 수
       totalRecCount = MessageDao.getInstance().getTotalCount();

       /*  한 페이지당  3개씪 
        *전체 레코드 수      페이지 수
        *     9                         3
        *    10                        4
        *    11                        4
        *    12                        4
        *    13                        5
        * 
        */
      // pageTotalCount = (int)Math.ceil(totalRecCount/3.0);
     
       pageTotalCount = totalRecCount / countPerPage;
       if(totalRecCount % countPerPage > 0) pageTotalCount++;
       
       
		return pageTotalCount;    //페이지 수 리턴
	}
	
	
	
	
}
