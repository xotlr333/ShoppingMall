package net.hb.crud.guest;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component
@Repository
public class guestDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	

	
}//class END


