package Sogong.IMS.controller.memberManagement;

import java.util.HashMap;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

public class MemberController extends HttpServlet{
	HashMap<String, Action> list = null;
	
	@Override
	public void init(ServletConfig sc) throws ServletException {
		list = new HashMap<>();
		
		list.put("/enroll.do", new MemberEnrollAction());
	}
	
	public void sevice(HttpServletRequest rq, HttpServletResponse response) {
		String url = rq.getRequestURI();
		String contextPath = rq.getContextPath();
		
		String path = url.substring(contextPath.length());
		
		System.out.printf("Context : %s", contextPath);
		System.out.printf("path : %s", path);
		
		Action action = list.get(path);
		action.excute(rq, response);
	}
	
	public boolean hasAuthority(Member member, String authorityName) {
		return false;
	}
}
