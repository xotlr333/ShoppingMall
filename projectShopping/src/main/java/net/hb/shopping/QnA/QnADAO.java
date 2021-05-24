package net.hb.shopping.QnA;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;



@Component
@Repository
public class QnADAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<QnADTO> dbSelectAll(int start, int end, String skey, String sval) {
		
		QnADTO qdto = new QnADTO();
		qdto.setStart(start);
		qdto.setEnd(end);
		qdto.setSkey(skey);
		qdto.setSval(sval);
		List<QnADTO> list = temp.selectList("shopping.QnASelectAll", qdto);
		return list;
	}//end
	
	public int dbCountAll() {
		return temp.selectOne("shopping.QnATotalAll");
	}//end
	
	public int dbCount(String skey, String sval) {
		QnADTO qdto = new QnADTO();
		qdto.setSkey(skey);
		qdto.setSval(sval);
		return temp.selectOne("shopping.QnATotal", qdto);
	}//end
	
	public QnADTO dbDetail(int code) {
		 QnADTO list = temp.selectOne("shopping.QnASelectOne",code);
		return list;
	}//end
	
	public void dbInsert(QnADTO qdto) {
		 temp.insert("shopping.QnAInsert",qdto);
	}//end
	
	public void dbDelete(int code) {
		 temp.delete("shopping.QnADelete",code);
	}//end
	
	public void dbEdit(QnADTO qdto) {
		 temp.update("shopping.QnAEdit",qdto);
	}//end
	


}//class end
