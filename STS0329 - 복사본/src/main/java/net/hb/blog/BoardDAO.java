package net.hb.blog;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbinsert(BoardDTO dto) {
		temp.insert("Board.add",dto);
	}//end
	
}//class end
