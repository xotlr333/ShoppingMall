package net.hb.shopping.QnA;


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


@Controller
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	QnADAO qdao;
	
	@RequestMapping("/qnaWrite.do")
	public String QnA_write(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		model.addAttribute("idch",idch);
		return "shopping_QnA_write";
	}//end
	
	@RequestMapping("/qnaInsert.do")
	public String QnA_insert(QnADTO qdto) {
		qdao.dbInsert(qdto);
		return "redirect:/qnaList.do";
	}//end
	
	@RequestMapping("/qnaList.do")
	public String QnA_list(Model model, HttpServletRequest request,HttpServletResponse response) {
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
		
		int totalall = qdao.dbCountAll();
		int total = qdao.dbCount(skey, sval);
		int pagecount;
		if(total%10==0) {pagecount=total/10;}
		else {pagecount=total/10+1;}
		
		int startpage = pagenum - (pagenum-1)%10;
		int endpage = startpage + 9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		List<QnADTO> qdto = qdao.dbSelectAll(start,end,skey,sval);
		model.addAttribute("qdto",qdto);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("pagecount",pagecount);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("skey",skey);
		model.addAttribute("sval",sval);
		model.addAttribute("idch",idch);
		
		return "shopping_QnA_list";
		
	}//end
	
	@RequestMapping("/qnadatail.do")
	public String QnA_detail(@RequestParam("code") int code,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		QnADTO qdto = qdao.dbDetail(code);
		
		String idch = (String)session.getAttribute("userid");
		String checkid;
		
		if( idch!=null&&idch.equals(qdto.getUserid())) {checkid="ok";}
		else {checkid="no";}
		
		model.addAttribute("qdto",qdto);
		model.addAttribute("checkid",checkid);
		return "shopping_QnA_detail";
	}//end
	
	@RequestMapping("/qnadelete.do")
	public String QnA_delete(@RequestParam("code") int code) {
		qdao.dbDelete(code);
		return "redirect:/qnaList.do";
	}//end
	
	@RequestMapping("/qnapreedit.do")
	public String QnA_preedit(@RequestParam("code") int code,Model model) {
		QnADTO qdto = qdao.dbDetail(code);
		model.addAttribute("qdto",qdto);
		return "shopping_QnA_edit";
	}//end
	
	@RequestMapping("/qnaedit.do")
	public String QnA_edit(QnADTO qdto) {
		qdao.dbEdit(qdto);
		return "redirect:/qnaList.do";
	}//end

	
}//class end
