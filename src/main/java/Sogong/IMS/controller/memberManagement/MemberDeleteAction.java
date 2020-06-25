package Sogong.IMS.controller.memberManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberDAO;


public class MemberDeleteAction implements Action{

	@Override
	public void excute(HttpServletRequest rq, HttpServletResponse rs) {
			try {
			rq.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			rs.setContentType("text/html; charset=uft-8");
			
			ServletContext context = rq.getServletContext();
			String url = rq.getRequestURI();
			String servletPath = rq.getServletPath();
			String memberID = url.substring(servletPath.length()).split("/")[2];
			
			try {
				rq.setCharacterEncoding("utf-8");
				rs.setContentType("text/html; charset=uft-8");
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			RequestDispatcher dispatcher = context.getRequestDispatcher("/memberManage");
			
			try {
				dispatcher.include(rq, rs);
				PrintWriter printWriter = rs.getWriter();
				
				if(MemberDAO.getInstance().delete(memberID) == true) {
					printWriter.print("<script>alert('성공적으로 삭제되었습니다')</script>");
				} else {
					printWriter.print("<script>alert('삭제에 실패했습니다.')</script>");
				}
			} catch(ServletException | IOException e) {
				e.printStackTrace();
			}
	}

}
