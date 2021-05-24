package net.hb.shopping.product;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
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

import net.hb.shopping.login.LoginDAO;



@Controller
public class ProductController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Inject
	@Autowired
	ProductDAO pdao;
	
	@Inject
	@Autowired
	ServletContext  application;
	
	@RequestMapping("/productWrite.do")
	public String product_write() {
		return "shopping_product_write";
	}//end
	
	@RequestMapping("/productInsert.do")
	public String product_insert(ProductDTO pdto) {
		String img=pdto.getUpload_f2().getOriginalFilename();
		String content=pdto.getUpload_f1().getOriginalFilename();
		pdto.setImg(img);
		pdto.setContent(content);
		
		pdao.dbInsert(pdto);
		
		return "redirect:/productList.do";
	}//end
	
	@RequestMapping("/productList.do")
	public String product_list(Model model,HttpServletRequest request,HttpServletResponse response) {
		String categ = request.getParameter("categ");
		if(categ=="" || categ==null) {categ="recent";}
		
		String pcategory = request.getParameter("pcategory");
		if(pcategory=="" || pcategory==null) {pcategory="all";}
		
		String pageNum = request.getParameter("pageNUM");
		if(pageNum=="" || pageNum==null) {pageNum="1";}
		int pagenum = Integer.parseInt(pageNum);
		
		int start = (pagenum-1)*16 + 1;
		int end = start + 15;
		
		int totalall = pdao.dbCountAll(pcategory);
		int pagecount;
		if(totalall%16==0) {pagecount=totalall/16;}
		else {pagecount=totalall/16+1;}
		
		int startpage = pagenum - (pagenum-1)%10;
		int endpage = startpage + 9;
		if(endpage>pagecount) {endpage=pagecount;}
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		List<ProductDTO> pdto = pdao.dbList(start,end,categ,pcategory);
		model.addAttribute("pdto",pdto);
		model.addAttribute("pagenum",pagenum);
		model.addAttribute("pagecount",pagecount);
		model.addAttribute("startpage",startpage);
		model.addAttribute("endpage",endpage);
		model.addAttribute("categ",categ);
		model.addAttribute("pcategory",pcategory);
		model.addAttribute("idch",idch);
		return "shopping_product_list";
	}//end
	
	@RequestMapping("/productDetail.do")
	public String product_detail(Model model, @RequestParam("code") int code,HttpServletRequest request) {
		ProductDTO pdto = pdao.dbDetail(code);
		
		//색상,사이즈 개별로 가져오기
		String[] color = pdto.getColor().split(",");
		String[] psize = pdto.getPsize().split(",");
		
		HttpSession session = request.getSession();
		String idch = (String)session.getAttribute("userid");
		
		model.addAttribute("pdto",pdto);
		model.addAttribute("color",color);
		model.addAttribute("psize",psize);
		model.addAttribute("idch",idch);
		return "shopping_product_detail";
	}//end
	
	@RequestMapping("/productDelete.do")
	public String product_delte(@RequestParam("code") int code) {
		pdao.dbDelete(code);
		return "redirect:/productList.do";
	}//end
	
	@RequestMapping("/productPreEdit.do")
	public String product_preedit(@RequestParam("code") int code,Model model) {
		ProductDTO pdto = pdao.dbDetail(code);
		model.addAttribute("pdto",pdto);
		return "shopping_product_edit";
	}//end
	
	@RequestMapping("/productEdit.do")
	public String product_edit(ProductDTO pdto) {
		String img=pdto.getUpload_f2().getOriginalFilename();
		String content=pdto.getUpload_f1().getOriginalFilename();
		pdto.setImg(img);
		pdto.setContent(content);
		
		pdao.dbEdit(pdto);
		
		return "redirect:/productList.do";
	}//end
	
	@RequestMapping("/slist.do")
	public String slist(Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
	    response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out = response.getWriter(); 
	    String keyword = request.getParameter("search");
    	String pcode = request.getParameter("pcode");
    	ProductDTO pdto = new ProductDTO();
    	pdto.setKeyword(keyword);
    	    	   	    	
		List<ProductDTO> dto =pdao.slist(pdto);
		    
        if(dto.isEmpty()==true){
    	   out.println("<script> alert('검색 결과가 없습니다');");
    	   out.append(" history.go(-1);</script>");
           out.flush();
          } model.addAttribute("dto", dto);
	    	return "shopping_alist";		
	    }

	
}//class end
