package net.hb.shopping.user;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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


@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	LoginDAO ldao;
	
	@RequestMapping("/userList.do")
	public String user_list(Model model, HttpServletRequest request,HttpServletResponse response) {
		String skey = request.getParameter("skey");
		String sval = request.getParameter("sval");
		if(skey==""||skey==null||sval==""||sval==null) {
			skey="all";
			sval="";
		}
		
		String pageNum = request.getParameter("pageNUM");
		if(pageNum=="" || pageNum==null) {pageNum="1";}
		int pagenum = Integer.parseInt(pageNum);
		
		int start = (pagenum-1)*10 + 1;
		int end = start + 9;
		
		int totalall = ldao.dbCountAll();
		int total = ldao.dbCount(skey, sval);
		int pagecount;
		if(total%10==0) {pagecount=total/10;}
		else {pagecount=total/10+1;}
		
		int startpage = pagenum - (pagenum-1)%10;
		int endpage = startpage + 9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		List<ClientdbDTO> udto = ldao.getUserAll(start,end,skey,sval);
		model.addAttribute("udto",udto);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("pagecount",pagecount);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("skey",skey);
		model.addAttribute("sval",sval);
		model.addAttribute("idch",idch);
		
		return "shopping_user_list";
		
	}//end
	
	@RequestMapping("/userDelete.do")
	public String QnA_delete(@RequestParam("code") int code) {
		ldao.dbDelete(code);
		return "redirect:/userList.do";
	}//end
	
}//class end
