package net.hb.shopping.notice;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	NoticeDAO ndao;
	
	@RequestMapping("/noticeList.do")
	public String notice_list(Model model) {
		List<NoticeDTO> ndto = ndao.dbSelectAll();
		model.addAttribute("ndto",ndto);
		return "shopping_notice_list";
	}//end
	
	@RequestMapping("/noticeDetail.do")
	public String notice_detail(Model model, @RequestParam("code") int code) {
		NoticeDTO ndto = ndao.dbDetail(code);
		model.addAttribute("ndto",ndto);
		return "shopping_notice_detail";
	}//end
	

	
}//class end
