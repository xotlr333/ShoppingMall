package net.hb.shopping.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoginController {
	
	@Autowired
	LoginDAO ldao;
	
	
	@RequestMapping("/login.do")
	public String login() {
		
		return "shopping_login";
	}

	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userid");		
		return "redirect:/home.do";
	}

		
	@RequestMapping("/loginConfirm.do")
	 public String loginConfirm(ClientdbDTO cdto, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
	
	     String userid = ldao.loginconfirm111(cdto);
		
			
	     System.out.println("userid=" +userid);
	     
		if(userid==null || userid=="") {
			String msg="회원정보가 일치하지 않습니다";
			model.addAttribute("msg", msg);
			return "shopping_login";
		}else if(userid.equals("admin")){
			userid = "admin";
			
			session.setAttribute("userid","admin");
			return "redirect:/home.do";
			
		}
		
		session.setAttribute("userid", userid);
		
		
		model.addAttribute("userid", userid);
	      return "redirect:/home.do" ;
		
	
	}
	
	
	
	
	@RequestMapping("/findid.do")
	public String findid() {
		
		return "shopping_findid";
	}
    
	
	
	
	
    
   	
}//end
	

