package net.hb.blog;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.blog.BoardDTO;

@Component
@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void dbInsert(BoardDTO dto) {
		temp.insert("board.add", dto);
		System.out.println("dbInsert메소드(dto)hobby테이블 저장성공");
	}//end
	
	public List<BoardDTO> dbSelectAll() {
		 List<BoardDTO> list = temp.selectList("board.selectAll");
		return list;
	}//end

} //class END
