package net.hb.shopping.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.shopping.product.ProductDTO;


@Component
@Repository
public class ProductDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	
	public List<ProductDTO> dbList(int start, int end, String categ, String pcategroy ){
		ProductDTO pdto = new ProductDTO();
		pdto.setStart(start);
		pdto.setEnd(end);
		pdto.setCateg(categ);
		pdto.setPcategory(pcategroy);
		return temp.selectList("shopping.productSelectAll",pdto);
	}//end
	
	public List<ProductDTO> dbHomeList(){
		return temp.selectList("shopping.productHomeSelectAll");
	}//end
	
	public ProductDTO dbDetail(int code) {
		return temp.selectOne("shopping.productSelectOne",code);
	}//end
	
	public int dbCountAll(String pcategory) {
		ProductDTO pdto = new ProductDTO();
		pdto.setPcategory(pcategory);
		return temp.selectOne("shopping.productTotalAll",pdto);
	}//end
	
	public void dbInsert(ProductDTO pdto) {
		 temp.insert("shopping.productInsert",pdto);
	}//end
	
	public void dbDelete(int code) {
		 temp.delete("shopping.productDelete",code);
	}//end
	
	public void dbEdit(ProductDTO pdto) {
		 temp.update("shopping.productEdit",pdto);
	}//end
	
	public List<ProductDTO> slist(ProductDTO lsdto){
		List<ProductDTO> ldto= temp.selectList("shopping.slist", lsdto);
	    return ldto;
	}
	


}//class end
