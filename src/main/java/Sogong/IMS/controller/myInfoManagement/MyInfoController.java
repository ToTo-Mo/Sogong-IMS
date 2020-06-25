package Sogong.IMS.controller.myInfoManagement;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.controller.memberManagement.MemberDeleteAction;
import Sogong.IMS.controller.memberManagement.MemberLookupAction;
import Sogong.IMS.controller.memberManagement.MemberModifyAction;
import Sogong.IMS.model.Member;
import lombok.SneakyThrows;

public class MyInfoController extends HttpServlet{
	HashMap<String, Action> list = null;
	
	@SneakyThrows
	@Override
	public void init(ServletConfig sc) throws ServletException {
		list = new HashMap<>();

		list.put("/modify.do", new MemberModifyAction());
		list.put("/delete.do", new MemberDeleteAction());
		list.put("/lookup.do", new MemberLookupAction());
	}
	
	@SneakyThrows
	protected void sevice(HttpServletRequest rq, HttpServletResponse rs) throws IOException, SQLException, NamingException {
		String url = rq.getRequestURI();
		String contextPath = rq.getContextPath();
		
		String path = url.substring(contextPath.length()).split("/")[1];
		
		Action action = list.get(path);
		action.excute(rq, rs);
	}
	
	public boolean hasAuthority(Member member, String authorityName) {
		return false;
	}
}
