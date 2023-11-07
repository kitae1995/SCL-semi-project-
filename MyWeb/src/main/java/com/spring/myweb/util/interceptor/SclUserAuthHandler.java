package com.spring.myweb.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class SclUserAuthHandler implements HandlerInterceptor{

	//회원 권한이 필요한 페이지 요청이 들어왔을 때 , 컨트롤러보다 먼저 요청을 가로채서
	//확인할 인터셉터로 활용할 예정입니다.
	//글쓰기 화면, 마이페이지 화면으로 들어가는 요청을 가로채 검사하도록 합시다.
	//만약 권한이 없다면 로그인페이지로 보내버리겠습니다.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//세션에서 로그인 데이터를 얻은 후에 확인해보기
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			//로그인 안했네?
			response.sendRedirect(request.getContextPath() + "/scluser/sclLogin");
			//getContextPath -> locahhost/myweb ~~ 앞에 붙던 주소
			
			//로그인안했으면 false를 리턴 시킴
			//false를 리턴시키면? 컨트롤러로 요청이 전달이 막힘
			return false;
		}
		
		//로그인을 했다면 통과~
		return true;
		
		
	}
	
	
	
}
