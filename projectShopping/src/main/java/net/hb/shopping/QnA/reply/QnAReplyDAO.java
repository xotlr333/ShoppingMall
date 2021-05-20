package net.hb.shopping.QnA.reply;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;



@Component
@Repository
public class QnAReplyDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<QnAReplyDTO> dbSelect(int code) {
		List<QnAReplyDTO> list = temp.selectList("shopping.QnAReplySelect",code);
		return list;
	}//end
	
	public void dbInsert(QnAReplyDTO qrdto) {
		temp.insert("shopping.QnAReplyInsert",qrdto);
	}//end
	
	public void dbDelete(int r_code) {
		temp.delete("shopping.QnAReplyDelete",r_code);
	}//end
	
	public void dbEdit(QnAReplyDTO qrdto) {
		temp.update("shopping.QnAReplyEdit",qrdto);
	}//end
	

}//class end
