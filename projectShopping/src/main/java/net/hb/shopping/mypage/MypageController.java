package net.hb.shopping.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.hb.shopping.login.ClientdbDTO;
import net.hb.shopping.login.LoginDAO;
import net.hb.shopping.order.OrderDAO;
import net.hb.shopping.order.OrderDTO;



@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageDAO mdao;
	
	@Autowired
	LoginDAO ldao;
	
	@Autowired
	OrderDAO odao;
	
	
	@RequestMapping("/mypage.do")
	public String mypage(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		int code = ldao.getID(idch);
		//고객정보 가져오기
		ClientdbDTO udto = ldao.getUser(code);
		
		//주문내역 가져오기
		List<OrderDTO> odto = odao.order_list(code);
		model.addAttribute("o_count",odto.size());
		for(int i=0; i<odto.size();i++) {
			String[] r_p_brand = odto.get(i).getP_brand().split(",");
			String[] r_p_title = odto.get(i).getP_title().split(",");
			String[] r_p_color = odto.get(i).getP_color().split(",");
			String[] r_p_psize = odto.get(i).getP_psize().split(",");
			String[] r_p_img_name = odto.get(i).getP_img_name().split(",");
			System.out.println(odto.get(i).getCode());
			
			int totalprice=0;
			String[] r_p_price_1 = odto.get(i).getP_price().split(",");
			int[] r_p_price = new int[r_p_price_1.length+1];
			for(int x=0;x<r_p_price_1.length;x++) { r_p_price[x] =Integer.parseInt(r_p_price_1[x]); totalprice+=r_p_price[x];}
			String[] r_p_delivery_1 = odto.get(i).getP_delivery().split(",");
			int[] r_p_delivery = new int[r_p_delivery_1.length+1];
			for(int x=0;x<r_p_delivery_1.length;x++) { r_p_delivery[x] =Integer.parseInt(r_p_delivery_1[x]);totalprice+=r_p_delivery[x];}
			
			model.addAttribute("p_length"+i,r_p_psize.length);
			model.addAttribute("r_p_brand"+i,r_p_brand);
			model.addAttribute("r_p_title"+i,r_p_title);
			model.addAttribute("r_p_color"+i,r_p_color);
			model.addAttribute("r_p_psize"+i,r_p_psize);
			model.addAttribute("r_p_img_name"+i,r_p_img_name);
			model.addAttribute("r_p_price"+i,r_p_price);
			model.addAttribute("r_p_delivery"+i,r_p_delivery);
			model.addAttribute("totalprice"+i,totalprice);
			model.addAttribute("wdate"+i,odto.get(i).getWdate());
			model.addAttribute("o_code"+i,odto.get(i).getCode());
		}
		
		
		model.addAttribute("udto",udto);
		model.addAttribute("odto",odto);
		
		return "shopping_mypage";
	}
	
	@RequestMapping("/mypageEdit.do")
	public String mypage_edit(ClientdbDTO udto) {
		
		ldao.userEdit(udto);
		
		return "redirect:/mypage.do";
	}
	
}//end
	

