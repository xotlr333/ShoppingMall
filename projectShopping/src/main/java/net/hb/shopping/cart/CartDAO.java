package net.hb.shopping.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.shopping.login.LoginDTO;


@Component
@Repository
public class CartDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void cart_insert(CartDTO cdto) {
	      temp.insert("shopping.cartInsert",cdto);
	}
	
	public List<CartDTO> cart_list(int code) {
		
	    return temp.selectList("shopping.cartList",code);
	}
	
	public void cart_delete(int c_code) {
	      temp.delete("shopping.cartDelete",c_code);
	}


}//class end
