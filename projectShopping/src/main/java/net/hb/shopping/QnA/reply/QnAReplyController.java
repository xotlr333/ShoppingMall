package net.hb.shopping.QnA.reply;

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


@Controller
public class QnAReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnAReplyController.class);
	
	@Autowired
	QnAReplyDAO qrdao;
	
	@RequestMapping("/qnaReply.do")
	public String QnA_re(Model model) {
		return "shopping_QnA_reply";
	}//end
	
	@RequestMapping("/qnaReplyList.do")
	public String QnA_re_list(Model model,@RequestParam("code") int code,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		List<QnAReplyDTO> qrdto = qrdao.dbSelect(code);
		model.addAttribute("qrdto",qrdto);
		model.addAttribute("idch",idch);
		return "shopping_QnA_reply";
	}//end
	
	@RequestMapping("/qnaReplyInsert.do")
	public String QnA_re_insert(QnAReplyDTO qrdto) {
		qrdao.dbInsert(qrdto);
		return "redirect:/qnadatail.do?code=" + qrdto.getCode();
	}//end
	
	@RequestMapping("/qnaReplyDelete.do")
	public String QnA_re_delete(@RequestParam("code") int code,@RequestParam("r_code") int r_code) {
		qrdao.dbDelete(r_code);
		return "redirect:/qnadatail.do?code=" + code;
	}//end
	
	@RequestMapping("/qnaReplyEdit.do")
	public String QnA_re_Edit(QnAReplyDTO qrdto) {
		System.out.println(qrdto.getCode()+" "+qrdto.getR_code()+" "+qrdto.getR_content());
		qrdao.dbEdit(qrdto);
		return "redirect:/qnadatail.do?code=" + qrdto.getCode();
	}//end

	
}//class end
