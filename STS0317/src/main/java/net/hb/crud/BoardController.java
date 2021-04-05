package net.hb.crud;

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
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	@Autowired
	ServletContext  application;
	
	@Inject
	@Autowired
	BoardDAO dao;
	
	
	@RequestMapping(value = "/boardWrite.do", method = RequestMethod.GET)
	public String board_write() {
		return "boardWrite";  //boardWrite.jsp
	}//end
	
	@RequestMapping("/boardInsert.do")
	public String  board_insert(BoardDTO dto) {		
		String path=application.getRealPath("/resources/upload"); 
		String img=dto.getUpload_f().getOriginalFilename(); 
		File file = new File(path, img);
		
		try{dto.getUpload_f().transferTo(file);}catch(Exception e) {	}
		dto.setImg_file_name(img);
		
		dao.dbInsert(dto);
		//return "boardList"; //boardList.jsp
		return "redirect:/boardList.do"; //저장서블릿 response.sendRedirect("boardList.do");
	}//end
	
	@RequestMapping("/boardList.do")
	public ModelAndView  board_select( HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String skey = request.getParameter("skey");
		String sval = request.getParameter("sval");
		if(skey==null||skey==""||sval==null||sval=="") {
			skey="title";
			sval="";
		}
		
		String pagenum = request.getParameter("pagenum");
		if(pagenum==null || pagenum=="") {pagenum="1";}
		int pageNUM=Integer.parseInt(pagenum);
		int Gtotal = dao.dbCount();
		int GGtotal = dao.dbSearchCount(skey, sval);
		
		int start;
		int end;
		
		start =(pageNUM-1)*10 + 1;
		end = start + 9;
		
		int startpage;
		int endpage;
		int pagecount;
		
		if(GGtotal%10==0) {pagecount=GGtotal/10;}
		else {pagecount=GGtotal/10 + 1;}
		startpage = pageNUM - (pageNUM-1)%10;
		endpage = startpage + 9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		List<BoardDTO> LG = dao.dbList(start,end,skey,sval);
		mav.addObject("LG",LG);
		mav.addObject("Gtotal",Gtotal);
		mav.addObject("GGtotal",GGtotal);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("pagecount",pagecount);
		mav.addObject("sval",sval);
		mav.addObject("skey",skey);
		mav.addObject("pageNUM",pageNUM);
		mav.setViewName("boardList");
		return mav; 
	}//end

	@RequestMapping("/boardList0324.do")
	public String  board_select0324( HttpServletRequest request, Model model) {
		String skey = request.getParameter("skey");
		String sval = request.getParameter("sval");
		if(skey==null||skey==""||sval==null||sval=="") {
			skey="title";
			sval="";
		}
		
		String pagenum = request.getParameter("pagenum");
		if(pagenum==null || pagenum=="") {pagenum="1";}
		int pageNUM=Integer.parseInt(pagenum);
		int Gtotal = dao.dbCount();
		int GGtotal = dao.dbSearchCount(skey, sval);
		
		int start;
		int end;
		
		start =(pageNUM-1)*10 + 1;
		end = start + 9;
		
		int startpage;
		int endpage;
		int pagecount;
		
		if(GGtotal%10==0) {pagecount=GGtotal/10;}
		else {pagecount=GGtotal/10 + 1;}
		startpage = pageNUM - (pageNUM-1)%10;
		endpage = startpage + 9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		List<BoardDTO> LG = dao.dbList(start,end,skey,sval);
		model.addAttribute("LG",LG);
		model.addAttribute("Gtotal",Gtotal);
		model.addAttribute("GGtotal",GGtotal);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("pagecount",pagecount);
		model.addAttribute("sval",sval);
		model.addAttribute("skey",skey);
		model.addAttribute("pageNUM",pageNUM);
		//LG개체명을 뷰boardList.jsp문서로 어떻게 넘길까 requset없어요 
		return "boardList"; //boardList.jsp
	}//end
	
	@RequestMapping("/boardDetail0324.do")
	public String board_detail0324( HttpServletRequest request ,Model model) {
		BoardDTO dto = dao.dbDetail(Integer.parseInt(request.getParameter("idx")));
		model.addAttribute("dto",dto);
		return "boardDetail";
	}//end
	
	//String, Model대신 ModelAndView클래스 적용
	@RequestMapping("/boardDetail.do")
	public ModelAndView board_detail(@RequestParam("idx") int data) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dto = dao.dbDetail(data);
		mav.addObject("dto",dto);
		mav.setViewName("boardDetail");
		return mav;
	}//end
	
	
	@RequestMapping("/boardDelete.do")
	public String board_delete( HttpServletRequest request) {
		dao.dbDelete(Integer.parseInt(request.getParameter("idx")));
		return "redirect:/boardList.do";
	}//end
	
	@RequestMapping("/boardPreEdit.do")
	public String board_preEdit( HttpServletRequest request ,Model model) {
		BoardDTO dto = dao.dbDetail(Integer.parseInt(request.getParameter("idx")));
		model.addAttribute("dto",dto);
		return "boardEdit";
	}//end
	
	@RequestMapping("/boardEdit.do")
	public String board_edit(BoardDTO dto ) {
		
		String path=application.getRealPath("/resources/upload"); 
		String img=dto.getUpload_f().getOriginalFilename(); 
		File file = new File(path, img);
		
		try{dto.getUpload_f().transferTo(file);}catch(Exception e) {	}
		dto.setImg_file_name(img);
		
		dao.dbEdit(dto);
		return "redirect:/boardList.do";
	}//end
	
	//파일다운로드
	//<a href="download.do?fname=${dto.img_file_name}&idx=${dto.hobby_idx}">그림 </a>
	@RequestMapping("/download.do")
	public void board_download(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException {
		try {
			String data = request.getParameter("idx");
			String filename = request.getParameter("fname");
		    String path = application.getRealPath("/resources/upload");
		    
		    //첫번째순서 setHeader
		    response.setHeader("Content-Disposition", "attachment;filename="+filename);
		    File file = new File(path,filename);
		    
		    //두번째순서
		    InputStream is = new FileInputStream(file);
		    OutputStream os = response.getOutputStream();
		    
		    //세번째순서
		    byte[] bt = new byte[(int)file.length()];
		    //read후 => write기록
		    is.read(bt, 0, bt.length);
		    os.write(bt);
		    
		    is.close(); os.close();
		    
		}catch (Exception e) { }
	}//end
	
}//class END








