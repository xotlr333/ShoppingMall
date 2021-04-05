package net.hb.crud.reply;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardReplyController.class);
	
	@Inject
	@Autowired
	BoardReplyDAO rdao;
	
	@RequestMapping(value = "/boardreply.do", method = RequestMethod.GET)
	public String board_write() {
		return "board_reply";  //board_reply.jsp
	}//end
	
	@RequestMapping("/boardreply_insert.do")
	public String reply_insert(BoardReplyDTO dto) {
		rdao.dbInsert(dto);
		int data = dto.getHobby_idx();
		return "redirect:/boardDetail.do?idx="+ data;
	}//end
	
	@RequestMapping("/boardreply_list.do")
	public ModelAndView reply_select(@RequestParam("idx") int idx) {
	   ModelAndView mav = new ModelAndView();
	   //rdao접근
	   List<BoardReplyDTO> rLG = rdao.dbSelect(idx);
	   mav.addObject("rLG", rLG);
	   mav.setViewName("board_reply"); //board_reply.jsp
	   return mav;
	}//end
	
	@RequestMapping("/boardreply_delete.do")
	public String reply_delete(@RequestParam("Ridx") int Ridx, @RequestParam("idx") int idx) {
		//rdao접근 void
		rdao.dbDelete(Ridx);
		
		return "redirect:/boardDetail.do?idx="+ idx;
	}//end
	
	@RequestMapping("/boardreply_edit.do")
	public String reply_preEdit(HttpServletRequest request) {
		int a =Integer.parseInt(request.getParameter("rhobby_idx"));
		String b = request.getParameter("rwriter");
		String c = request.getParameter("rmemo");
		int d =Integer.parseInt(request.getParameter("hobby_idx"));
		logger.info("수정전 데이터 출력 3-30-화요일");
		System.out.println("수정전 데이터 " + a + " " + b + " " + c + " " + d);
		
		BoardReplyDTO rdto = new BoardReplyDTO();
		rdto.setRhobby_idx(a);
		rdto.setRwriter(b);
		rdto.setRmemo(c);
		rdto.setHobby_idx(d);
		rdao.dbUpdate(rdto);
		
		return "redirect:/boardDetail.do?idx="+ rdto.getHobby_idx();
	}
	
	
}//class END








