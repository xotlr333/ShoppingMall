package net.hb.shopping.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.shopping.notice.NoticeDTO;

@Component
@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<NoticeDTO> dbSelectAll() {
		 List<NoticeDTO> list = temp.selectList("shopping.noticeSelectAll");
		return list;
	}//end
	
	public NoticeDTO dbDetail(int code) {
		return temp.selectOne("shopping.noticeSelectOne",code);
	}//end

}//class end
