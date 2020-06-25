package Sogong.IMS.controller.memberManagement;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberDAO;
import Sogong.IMS.model.Member;

public class MemberLookupAction implements Action{

	@Override
	public void excute(HttpServletRequest rq, HttpServletResponse rs) {
		try {
			rq.setCharacterEncoding("utf-8");
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String[] conditionNames = {"memberID", "memberPW", "name", "phoneNumber", "address", "email", "memberType", "department"};
		HashMap<String, Object> conditions = new HashMap<>();
		
		for(String condition : conditionNames) {
			String value = rq.getParameter(condition);
			
			if(value != "") conditions.put(condition, value);
		}
		
		if((rq.getParameter("memberID") != "") || (rq.getParameter("name") != "")) {
			
		}
		
		Member[] lookupResult = MemberDAO.getInstance().lookup(conditions);
		StringBuilder stringBuilder = new StringBuilder();
		for(Member tmp : lookupResult) {
			stringBuilder.append("<form method=\"post\">\n");
			stringBuilder.append("<tr name='memberData'>\n");
			stringBuilder.append("<td>");
		    stringBuilder.append("<input type=\"text\" name=\"memberID\" class=\"data\" readonly value=");
            stringBuilder.append(tmp.getMemberID() + ">\n");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<input type=\"text\" name=\"memberPW\" class=\"data\" readonly value=");
            stringBuilder.append(tmp.getMemberPW() + ">\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<input type=\"text\" name=\"name\" class=\"data\" readonly value=");
            stringBuilder.append(tmp.getName() + ">\n");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<input type=\"text\" name=\"phoneNumber\" class=\"data\" readonly value=");
            stringBuilder.append(tmp.getPhoneNumber() + ">\n");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<input type=\"text\" name=\"address\" class=\"data\" readonly value=");
            stringBuilder.append(tmp.getAddress() + ">\n");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<input type=\"text\" name=\"email\" class=\"data\" readonly value=");
            stringBuilder.append(tmp.getEmail() + ">\n");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<button type=\"button\" name=\"modify\">수정</button>");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<button type=\"submit\" name=\"delete\"> 삭제 </button>");
            stringBuilder.append("</td>\n");
            stringBuilder.append("</tr>\n");
            stringBuilder.append("</form>\n");
		}
		rq.setAttribute("lookup", stringBuilder.toString());
		ServletContext context = rq.getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/memberManage");
		
		try {
			dispatcher.forward(rq, rs);
		} catch(ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
