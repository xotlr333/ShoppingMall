package com.myspring.springBBS.Account;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class AccountDAO {
	@Autowired
	SqlSessionTemplate temp;
	
	public String dbCheck(String id) {
		int ck=(Integer)temp.selectOne("acct.idCheck",id);
		return ck>0 ? "t":"f"; // t 중복 아이디 / f 사용 가능 
	}//end
	
	
	public void dbInsert(AccountDTO dto) {
		temp.insert("acct.insert", dto);
		System.out.println("Sacct테이블 dbInsert success");
		temp.insert("login.insert", dto);
		System.out.println("login테이블 dbInsert success");
	}//end
	
}//class EDN
