package net.hb.shopping.cart;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.hb.shopping.login.ClientdbDTO;
import net.hb.shopping.login.LoginDAO;
import net.hb.shopping.product.ProductDTO;


@Controller
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	LoginDAO ldao;
	
	@RequestMapping("/cart.do")
	public String cart(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		int code = ldao.getID(idch);
		
		List<CartDTO> cdto = cdao.cart_list(code);
		int totalPrice=0;
		int totalDelivery=0;
		for(int i=0; i<cdto.size(); i++) {
			totalPrice+=cdto.get(i).getPrice();
		}//for end
		for(int i=0; i<cdto.size(); i++) {
			totalDelivery+=cdto.get(i).getDelivery();
		}//for end
		
		int total = totalPrice + totalDelivery;
		
		model.addAttribute("cdto",cdto);
		model.addAttribute("total",total);
		
		return "shopping_cart";
	}//end
	
	@RequestMapping("/cartInsert.do")
	public String cart_insert(CartDTO cdto,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		int code = ldao.getID(idch);
		
		cdto.setCode(code);
		cdao.cart_insert(cdto);
		return "redirect:/productDetail.do?code=" +cdto.getP_code();
	}//end
	
	@RequestMapping("/cartDelete.do")
	public String cart_delete(@RequestParam("c_code") int c_code) {
		cdao.cart_delete(c_code);
		return "redirect:/cart.do";
	}//end

	
}//class end
