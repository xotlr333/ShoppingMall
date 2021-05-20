package net.hb.shopping.login;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.hb.shopping.QnA.QnADTO;
import net.hb.shopping.user.UserDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	
	public String loginconfirm111(ClientdbDTO cdto) {
	      return temp.selectOne("shopping.loginconfirm111",cdto);
	      
	}
	public String loginconfirm1(String userid) {
	      return temp.selectOne("shopping.loginconfirm1",userid);
	      
	}	
	
    public void signup(ClientdbDTO cdto) {
        temp.insert("shopping.add", cdto);
    }
    
    public int getID(String userid) {
        return temp.selectOne("shopping.getID", userid);
    }
    
    public List<ClientdbDTO> getUserAll(int start, int end, String skey, String sval) {
    	UserDTO udto = new UserDTO();
		udto.setStart(start);
		udto.setEnd(end);
		udto.setSkey(skey);
		udto.setSval(sval);
        return temp.selectList("shopping.getUserAll",udto);
    }
    
    public int dbCountAll() {
		return temp.selectOne("shopping.userTotalAll");
	}//end
    
    public int dbCount(String skey, String sval) {
		UserDTO udto = new UserDTO();
		udto.setSkey(skey);
		udto.setSval(sval);
		return temp.selectOne("shopping.userTotal", udto);
	}//end
    
	public void dbDelete(int code) {
		 temp.delete("shopping.userDelete",code);
	}//end
    
    public ClientdbDTO getUser(int code) {
        return temp.selectOne("shopping.getUser", code);
    }
    
    public void userEdit(ClientdbDTO cdto) {
        temp.update("shopping.userEdit", cdto);
    }
	

}
