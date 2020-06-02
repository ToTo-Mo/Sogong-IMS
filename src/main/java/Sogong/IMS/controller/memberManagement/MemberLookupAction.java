package Sogong.IMS.controller.memberManagement;

import java.util.HashMap;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberDAO;
import Sogong.IMS.model.Member;

public class MemberLookupAction implements Action{

	@Override
	public void excute(HttpServletRequest rq, HttpServletResponse rs) {
		rs.setCharacterEncoding("UTF-8");
		
		String memberID = (String)rq.getAttribute("memberID");
		String memberPW = (String)rq.getAttribute("memberPW");
		String name = (String)rq.getAttribute("name");
		String phoneNumber = (String)rq.getAttribute("phoneNumber");
		String address = (String)rq.getAttribute("address");
		String email = (String)rq.getAttribute("email");
		String memberType = (String)rq.getAttribute("memberType");
		String department = (String)rq.getAttribute("department");
		
		HashMap<String, Object> condition = new HashMap<>();
		if(!memberID.equals("")) condition.put("memberID", memberID);
		if(!name.equals("")) condition.put("name", name);
		
		rq.getSession().setAttribute("preCondition", condition);
		rq.setAttribute("data", generateHtml(condition).toString());
	}

	public void executePreCondition(HttpServletRequest rq, HttpServletResponse rs) {
		HashMap<String, Object> condition = (HashMap<String, Object>) rq.getSession().getAttribute("preCondition");
		rq.setAttribute("data", generateHtml(condition).toString());
	}
	
	private StringBuilder generateHtml(HashMap<String, Object> condition) {

		// 팀장 : MemberDAO는 싱글톤 패턴을 이용하신 건가요?
		// MemberDAO에 이러한 내용이 없어서요
		Vector<Member> members = MemberDAO.getInstance().select(condition);
		StringBuilder stringBuilder = new StringBuilder();
		
		for(Member tmp : members) {
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
            stringBuilder.append("<button type=\"button\" name=\"modify\">����</button>");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<button type=\"submit\" name=\"delete\"> ���� </button>");
            stringBuilder.append("</td>\n");
            stringBuilder.append("</tr>\n");
            stringBuilder.append("</form>\n");
		}
		return stringBuilder;
	}
}
