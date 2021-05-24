package net.hb.shopping.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Component
@Repository
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public void order_insert(OrderDTO odto) {
		temp.insert("shopping.orderInsert",odto);
	}
	
	public List<OrderDTO> order_list(int code) {
		return temp.selectList("shopping.orderList",code);
	}
	
	public void dbDelete(int code) {
		 temp.delete("shopping.orderDelete",code);
	}//end


}//class end
