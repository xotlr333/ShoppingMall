package net.hb.crud;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {

   private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
   
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
          //preHandle(request,response, Object)
           //세션을 찾아온다
         HttpSession session = request.getSession();
         String ss = (String)session.getAttribute("daum");
   
         System.out.println("LoginInterceptor ss=" + ss);
         //로그인이 안된 상태에서 요청을 햇을 때 로그인 한 후 요청한 페이지로 이동하도록 하기 위해서 요청한 주소를 세션에 저장한 후 로그인이 성공했을 때 그 주소로 이동하도록 하면 된다.
         String uri = request.getRequestURI();
         System.out.println("request.getRequestURI()  " + uri);
           
          //프로젝트 이름까지 찾아오기때문에 주소만  http://127.0.0.1:8081/crud/~.do
         int idx = uri.lastIndexOf("/");
           uri = uri.substring(idx+1);
           
           System.out.println("idx 값 :  "+idx);
         System.out.println("LoginInterceptor인셉  uri매핑 "+uri);
         String query = request.getQueryString();
         System.out.println("LoginInterceptor인셉  넘어온값 " + query);
         
         //파라미터가 없으면 요청 주소는 그대로 
         if(query==null || query.equals("null")){ query="";}
         else{ query="?"+query;}
         uri = uri + query;
         System.out.println("최종 uri 값  " + uri);
      
         boolean adminCheck = false;
         //로그인이 안된 경우 로그인 페이지로 이동
         response.setContentType("text/html; charset=UTF-8");
           PrintWriter out = response.getWriter() ;
           
         if(ss!=null){
            adminCheck=true;   
         }else {
            out.println("<div align=center style='margin-top:30px'> <img src='./resources/images/tulips.png' width='500' height='400'>");
            out.println("<br><font color=blue size=7> <b>loging작업... login작업...</b></font> </div> <p>");
            out.append("<script>"
               + "alert('로그인이 필요한 문서입니다');"
                + "location.href='login.do';"
               + "</script>").flush();
            adminCheck=false;
         }
         return adminCheck;
   }//end

   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)throws Exception {
      //컨트롤러의 메소드 끝나고 , 화면처리후 처리 
      //afterCompletion(request,response, Object, Exception)
        logger.info("=======================afterCompletion start========================");
      logger.info("=======================afterCompletion end=========================");
   }//end
         
   
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)throws Exception {
      //postHandle(request,response, Object, ModelAndView)
      logger.info("=======================postHandle start======================");
      logger.info("=======================postHandle end=========================");   
   }//end

}//LoginInterceptor END