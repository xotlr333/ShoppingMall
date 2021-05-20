package net.hb.shopping.order;


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

import net.hb.shopping.cart.CartDAO;
import net.hb.shopping.cart.CartDTO;
import net.hb.shopping.login.ClientdbDTO;
import net.hb.shopping.login.LoginDAO;


@Controller
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	OrderDAO odao;
	
	@Autowired
	CartDAO cdao;
	
	@Autowired
	LoginDAO ldao;
	
	@RequestMapping("/order.do")
	public String order(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		int code = ldao.getID(idch);
		
		ClientdbDTO udto = ldao.getUser(code);
		
		List<CartDTO> cdto = cdao.cart_list(code);
		
		//상품 금액 합계
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
		model.addAttribute("udto",udto);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("totalDelivery",totalDelivery);
		model.addAttribute("total",total);
		
		return "shopping_order";
	}//end
	
	@RequestMapping("/orderDirect.do")
	public String order_direct(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		int code = ldao.getID(idch);
		
		ClientdbDTO udto = ldao.getUser(code);
		
		String img = request.getParameter("img");
		String brand = request.getParameter("brand");
		String title = request.getParameter("title");
		int price = Integer.parseInt(request.getParameter("price"));
		int delivery = Integer.parseInt(request.getParameter("delivery"));
		String color = request.getParameter("color");
		String psize = request.getParameter("psize");
		
		
		model.addAttribute("udto",udto);
		model.addAttribute("img",img);
		model.addAttribute("brand",brand);
		model.addAttribute("title",title);
		model.addAttribute("price",price);
		model.addAttribute("delivery",delivery);
		model.addAttribute("color",color);
		model.addAttribute("psize",psize);
		
		return "shopping_order_direct";
	}//end
	
	@RequestMapping("/orderInsert.do")
	public String order_insert(Model model,HttpServletRequest request,OrderDTO odto) {
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		int code = ldao.getID(idch);
		
		odto.setU_code(code);
		odao.order_insert(odto);
		
		//장바구니 목록 삭제
		if(odto.getC_code()!="0") {
			String[] r_c_code = odto.getC_code().split(",");
			for(int i=0;i<r_c_code.length; i++) {
				cdao.cart_delete(Integer.parseInt(r_c_code[i]));
			}//for end
		}//if end
		
		return "redirect:/home.do";
	}//end
	
	@RequestMapping("/orderDelete.do")
	public String order_delete(@RequestParam("code") int code) {
		odao.dbDelete(code);
		return "redirect:/mypage.do";
	}//end


	
}//class end
