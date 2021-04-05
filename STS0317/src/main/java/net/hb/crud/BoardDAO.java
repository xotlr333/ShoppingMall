package net.hb.crud;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbInsert(BoardDTO dto) {
		temp.insert("board.add", dto);
		System.out.println("dbInsert메소드(dto)hobby테이블 저장성공");
	}//end
	
	public List<BoardDTO> dbList( ){ //전체데이터 출력
		return temp.selectList("board.selectAll");
	}//end
	
	public List<BoardDTO> dbList(int start, int end ){ //페이징
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		return temp.selectList("board.selectAll789",dto);
	}//end
	
	public List<BoardDTO> dbList(int start, int end, String skey, String sval ){//페이징 + 검색
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setSkey(skey);
		dto.setSval(sval);
		return temp.selectList("board.selectAll789",dto);
	}//end
	
	public int dbCount( ){
		return temp.selectOne("board.countAll");
	}//end
	
	public int dbSearchCount(String skey, String sval ){ //검색페이지수
		BoardDTO dto = new BoardDTO();
		dto.setSkey(skey);
		dto.setSval(sval);
		return temp.selectOne("board.countAllsearch",dto);
	}//end
	
	public BoardDTO dbDetail(int data) {
		BoardDTO dto = temp.selectOne("board.detail",data);
		return dto;
	}//end
	
	public void dbDelete(int data) {
		temp.delete("board.delete",data);
	}//end
	
	public void dbEdit(BoardDTO dto) {
		temp.update("board.edit",dto);
		
	}//end
	
}//class END


