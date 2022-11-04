package board_ex44.service;
  
import java.text.DecimalFormat; 

import board_ex44.model.*;

public class WriteArticleService {
	
	private static WriteArticleService instance;
	public static WriteArticleService getInstance()  throws BoardException{
		if( instance == null )
		{ 
			instance = new WriteArticleService();
		}
		return instance;
	}
	
	public int write( BoardVO rec ) throws BoardException{
		
		BoardDao dao = BoardDao.getInstance();
	
		return dao.insert(rec);
		
	}
}
