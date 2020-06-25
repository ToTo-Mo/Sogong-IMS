package Sogong.IMS.controller.FacilityManagement;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.dao.FacilityDAO;
import Sogong.IMS.controller.Action;

public class FacilityDeleteAction implements Action {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=utf-8");
      ServletContext context = request.getServletContext();
      String url = request.getRequestURI();
      String servletPath = request.getServletPath();
      String packageID = url.substring(servletPath.length()).split("/")[2];
      try {
          request.setCharacterEncoding("utf-8");
          response.setCharacterEncoding("UTF-8");
          response.setContentType("text/html; charset=UTF-8");
      } catch (Exception e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
      }

      RequestDispatcher dispatcher = context.getRequestDispatcher("/packageManage"); // 넘길 페이지 주소
      try {
          dispatcher.include(request, response);
          PrintWriter printWriter = response.getWriter();
          if(FacilityDAO.getInstance().delete(Integer.parseInt(packageID)) == true)
              printWriter.print("<script>alert('성공적으로 삭제되었습니다')</script>");
          else
              printWriter.print("<script>alert('삭제에 실패했습니다.')</script>");
      } catch (ServletException | IOException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
      }
  }

  @Override
  public void excute(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub

  }
}