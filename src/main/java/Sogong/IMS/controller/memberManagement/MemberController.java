package Sogong.IMS.controller.memberManagement;

import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

@WebServlet("/memberManage/*")
public class MemberController extends HttpServlet{
	HashMap<String, Action> list = null;
	
	@Override
	public void init(ServletConfig sc) throws ServletException {
		list = new HashMap<>();
		
		list.put("enroll.do", new MemberEnrollAction());
		list.put("modify.do", new MemberModifyAction());
		list.put("delete.do", new MemberDeleteAction());
		list.put("lookup.do", new MemberLookupAction());
	}
	
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURI();
        String servletPath = request.getServletPath();

        String path = url.substring(servletPath.length()).split("/")[1];

        if(list.get(path) !=null){
            Action action = list.get(path);
            action.excute(request, response);
        }
	}
	
	public boolean hasAuthority(Member member, String authorityName) {
		return false;
	}
}
