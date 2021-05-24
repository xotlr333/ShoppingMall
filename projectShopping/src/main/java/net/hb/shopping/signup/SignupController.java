package net.hb.shopping.signup;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.hb.shopping.login.ClientdbDTO;
import net.hb.shopping.login.LoginDAO;



@Controller
public class SignupController {
	
	@Autowired
	LoginDAO ldao;
	
			
	@RequestMapping("/signup.do")
	public String sign() {
		
		return "shopping_signup";
	}

	@RequestMapping("/signupinsert.do")
	public String signupinsert(ClientdbDTO cdto) {
	    
		ldao.signup(cdto);
		
		return "redirect:/home.do";
	}
	
	@ResponseBody
  	@RequestMapping("/signupid.do")
  	public String signid(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
  		String sid =request.getParameter("userid");
  		String scid =ldao.loginconfirm1(sid); 
  	   
  		if(scid==null || scid=="") {
            return null;
  		}
  		return scid;
  		  		
      }

}
