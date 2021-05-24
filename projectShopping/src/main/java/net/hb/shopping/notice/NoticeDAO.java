package net.hb.shopping.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.shopping.QnA.QnADTO;
import net.hb.shopping.notice.NoticeDTO;

@Component
@Repository
public class NoticeDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<NoticeDTO> dbSelectAll(int start, int end, String skey, String sval) {
		NoticeDTO ndto = new NoticeDTO();
		ndto.setStart(start);
		ndto.setEnd(end);
		ndto.setSkey(skey);
		ndto.setSval(sval);
		
		 List<NoticeDTO> list = temp.selectList("shopping.noticeSelectAll",ndto);
		return list;
	}//end
	
	public NoticeDTO dbDetail(int code) {
		return temp.selectOne("shopping.noticeSelectOne",code);
	}//end
	
	public void dbInsert(NoticeDTO ndto) {
		temp.insert("shopping.noticeInsert",ndto);
	}//end
	
	public int dbCountAll() {
		return temp.selectOne("shopping.noticeTotalAll");
	}//end
	
	public int dbCount(String skey, String sval) {
		NoticeDTO ndto = new NoticeDTO();
		ndto.setSkey(skey);
		ndto.setSval(sval);
		return temp.selectOne("shopping.QnATotal", ndto);
	}//end
	
	public void dbDelete(int code) {
		temp.delete("shopping.noticeDelete",code);
	}//end
	
	public void dbEdit(NoticeDTO ndto) {
		temp.update("shopping.noticeEdit",ndto);
	}//end


}//class end
