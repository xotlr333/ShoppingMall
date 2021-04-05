package net.hb.blog;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	@Autowired
	BoardDAO dao;
	
	@Inject
	@Autowired
	ServletContext  application;
	
	@RequestMapping("/boardWrite.do")
	public String board_write() {
		System.out.println("글쓰기");
		return "boardWrite";
	}//end
	
	@RequestMapping("/boardInsert.do")
	public String board_insert(BoardDTO dto) {
		//String path = application.getRealPath("/resources/upload");
		//System.out.println("경로 : " + path);
		String img=dto.getUpload_f().getOriginalFilename();
		//System.out.println("파일 : " + dto.getUpload_f());
		//System.out.println("파일명 : " + img);
		//File file = new File(path,img);
		//System.out.println("file : " + file);
		
		//try{dto.getUpload_f().transferTo(file);}catch(Exception e) {	}
		//System.out.println("파일변환후 : " + dto.getUpload_f());
		dto.setImg_file_name(img);
		
		dao.dbInsert(dto);
		//return "redirect:/boardList.do";
		
		System.out.println("글쓰기 저장 완료");
		return "redirect:/boardList.do";
	}//end
	
	@RequestMapping("/boardList.do")
	public String board_List(Model model) {
		List<BoardDTO> list = dao.dbSelectAll();
		model.addAttribute("list",list);
		return "boardList";
	}//end
	
}//BoardController END
