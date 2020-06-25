package Sogong.IMS.controller.memberManagement;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberDAO;
import Sogong.IMS.model.Member;

public class MemberModifyAction implements Action {

	@Override
	public void excute(HttpServletRequest rq, HttpServletResponse rs) {
		try {
			rq.setCharacterEncoding("utf-8");
			rs.setContentType("text/html; charset=UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		Member members = new Member(rq.getParameter("memberID"), rq.getParameter("memberPW"), rq.getParameter("name"),
				rq.getParameter("phoneName"), rq.getParameter("address"), rq.getParameter("emain"),
				rq.getParameter("memberType"), rq.getParameter("department"), null);
		PrintWriter printWriter;
		try {
			printWriter = rs.getWriter();

			if(MemberDAO.getInstance().modify(members) == true) {
				printWriter.print("<script>alert('성공적으로 수정되었습니다')</script>");
				printWriter.print("<script>self.close()</script>");
			}
				
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
