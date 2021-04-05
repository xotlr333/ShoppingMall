package net.hb.crud;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class LoginDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<LoginDTO> dbSelect(){
		List<LoginDTO> list = null;
		return list;
	}//end
	
	public String dbDetail(LoginDTO dto) {
		return temp.selectOne("login.detail",dto);
	}//end

	
}//class END


