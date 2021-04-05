package net.hb.crud;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class LoginController {
   
  private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

   @Inject
   @Autowired
   LoginDAO dao;
   
   
   @RequestMapping(value = "/login.do")
   public String login_view() {
      return "login";  //login.jsp
   }//end
   
   @RequestMapping(value = "/loginprocess.do")
   public void login_process(LoginDTO dto, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
      response.setContentType("text/html;charset=UTF-8");  
      PrintWriter out = response.getWriter(); 
      HttpSession session = request.getSession();
      
      System.out.println("03-25-목요일 넘어온 uid = " + request.getParameter("userid"));
      System.out.println("03-25-목요일 넘어온 pwd = " + request.getParameter("pwd"));
   try {   
      //LoginDAO 메소드접근 데이터가 있으면 세션설정
      String result = dao.dbDetail(dto); 
      if(result==null||result=="") {
         out.println("<div align=center> <img src='./resources/images/hydran.png' width='400' height='250'></div>");
         out.append("<script>");
         out.append("alert('userid pwd 일치하지 않습니다');"); 
         out.append("</script>");
         out.append("<div align=center><a href=\"login.do\">[로그인]</a></div>");
         out.flush();
      }else {
        session.setAttribute("daum", result);
        response.sendRedirect("boardList.do");  
      }
   }catch (Exception e){ }
      //response.sendRedirect(boardList.do);  
       //RequestDispatcher dis = request.getRequestDispatcher(boardList.do);
       //dis.forward(request, response);
   }//end
   
   
   @RequestMapping(value="logout.do", method=RequestMethod.GET)
   public String logout(HttpSession session){
      session.invalidate(); //세션 초기화 
      return "redirect:/index.jsp";
   }//end
   
}//LoginController class END
