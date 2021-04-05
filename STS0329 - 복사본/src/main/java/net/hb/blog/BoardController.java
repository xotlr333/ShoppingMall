package net.hb.blog;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
	
	@Autowired
	BoardDAO dao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String board_write(BoardDTO dto) {
		String path = application.getRealPath("/resources/upload");
		System.out.println("경로 : " + path);
		String img=dto.getUpload_f().getOriginalFilename();
		System.out.println("파일 : " + dto.getUpload_f());
		System.out.println("파일명 : " + img);
		File file = new File(path,img);
		
		try{dto.getUpload_f().transferTo(file);}catch(Exception e) {	}
		System.out.println("파일변환후 : " + dto.getUpload_f());
		dto.setImg_file_name(img);
		
		dao.dbinsert(dto);
		return "redirect:/boardList.do";
	}//end
	
	@RequestMapping(value = "/boardList.do", method = RequestMethod.GET)
	public String board_List() {

		return "boardList";
	}//end
	
}//class end
