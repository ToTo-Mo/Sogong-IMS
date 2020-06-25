package Sogong.IMS.controller.memberManagement;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;
import lombok.SneakyThrows;

@WebServlet("/memberManage/*")
public class MemberController extends HttpServlet{
	HashMap<String, Action> list = null;
	
	@SneakyThrows
	@Override
	public void init(ServletConfig sc) throws ServletException {
		list = new HashMap<>();
		
		list.put("enroll.do", new MemberEnrollAction());
		list.put("modify.do", new MemberModifyAction());
		list.put("delete.do", new MemberDeleteAction());
		list.put("lookup.do", new MemberLookupAction());
	}
	
	protected void sevice(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, NamingException {
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
