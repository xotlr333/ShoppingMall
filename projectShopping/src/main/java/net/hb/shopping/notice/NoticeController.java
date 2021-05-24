package net.hb.shopping.notice;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import net.hb.shopping.QnA.QnADTO;


@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeDAO ndao;
	
	@RequestMapping("/noticeWrite.do")
	public String notice_write(Model model) {
		return "shopping_notice_write";
	}//end
	
	@RequestMapping("/noticeInsert.do")
	public String notice_insert(NoticeDTO ndto) {
		ndao.dbInsert(ndto);
		return "redirect:/noticeList.do";
	}//end
	
	@RequestMapping("/noticeList.do")
	public String notice_list(Model model, HttpServletRequest request,HttpServletResponse response) {
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
		
		int totalall = ndao.dbCountAll();
		int total = ndao.dbCount(skey, sval);
		int pagecount;
		if(total%10==0) {pagecount=total/10;}
		else {pagecount=total/10+1;}
		
		int startpage = pagenum - (pagenum-1)%10;
		int endpage = startpage + 9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		List<NoticeDTO> ndto = ndao.dbSelectAll(start,end,skey,sval);
		model.addAttribute("ndto",ndto); 
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("pagecount",pagecount);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("skey",skey);
		model.addAttribute("sval",sval);
		model.addAttribute("idch",idch);
		
		return "shopping_notice_list";
	}//end
	
	@RequestMapping("/noticeDetail.do")
	public String notice_detail(Model model, @RequestParam("code") int code, HttpServletRequest request) {
		NoticeDTO ndto = ndao.dbDetail(code);
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		

		model.addAttribute("idch",idch);
		model.addAttribute("ndto",ndto);
		return "shopping_notice_detail";
	}//end
	
	@RequestMapping("/noticeDelete.do")
	public String notice_delete(@RequestParam("code") int code) {
		ndao.dbDelete(code);
		return "redirect:/noticeList.do";
	}//end
	
	@RequestMapping("/noticePrEedit.do")
	public String QnA_preedit(@RequestParam("code") int code,Model model) {
		NoticeDTO ndto = ndao.dbDetail(code);
		model.addAttribute("ndto",ndto);
		return "shopping_notice_edit";
	}//end
	
	@RequestMapping("/noticeEedit.do")
	public String QnA_preedit(NoticeDTO ndto) {
		ndao.dbEdit(ndto);
		return "redirect:/noticeList.do";
	}//end

	
}//class end
