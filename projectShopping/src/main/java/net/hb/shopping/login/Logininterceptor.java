package net.hb.shopping.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Logininterceptor extends HandlerInterceptorAdapter {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		HttpSession session = request.getSession();
		String ss= (String)session.getAttribute("userid");
		
		String uri = request.getRequestURI();
		System.out.println("URI=" + uri);
		
		
		int idx = uri.lastIndexOf("/");
		uri = uri.substring(idx+1);
		
		String query = request.getQueryString();
		if(query== null || query.equals("null")) {
			query="";
		}else {query="?"+query;}
		
		uri = uri+query;
		
		boolean adminCheck = false;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		
		if(ss!=null){
		  adminCheck = true;
		}else {
			out.println("<script> alert('로그인이 필요합니다'); location.href='login.do'</script>");
			adminCheck=false;
		}return adminCheck;
	}
	
	
	
	
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3)throws Exception{
    	
    }
	
	
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)throws Exception{
    	
    }
	
    
    
}
