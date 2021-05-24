package net.hb.shopping;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.hb.shopping.product.ProductDAO;
import net.hb.shopping.product.ProductDTO;



@Controller
public class MainController {
	
	@Autowired
	ProductDAO pdao;
	
	@RequestMapping("/home.do")
	public String hometop(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<ProductDTO> pdto = pdao.dbHomeList();
		model.addAttribute("pdto",pdto);
		String userid =(String)session.getAttribute("userid");
		
		if(userid !=null || userid !=""){
		   if(userid=="admin"){
			 model.addAttribute("userid", "admin");
		   }else{model.addAttribute("userid", userid);}
		
		}
		
		return "shopping_home";
		
	}
	
	@RequestMapping("/pre.do")
	public String hometop() {
		return "shopping_pre";
	}


	
	
}
