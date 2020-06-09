package Sogong.IMS.controller.MemberManagement;

import Sogong.IMS.controller.Action;
import Sogong.IMS.controller.PackageManagement.PackageDeleteAction;
import Sogong.IMS.controller.PackageManagement.PackageEnrollAction;
import Sogong.IMS.controller.PackageManagement.PackageLookupAction;
import Sogong.IMS.controller.PackageManagement.PackageModifyAction;
import Sogong.IMS.dao.MemberDAO;
import Sogong.IMS.model.Member;
import lombok.SneakyThrows;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.HashMap;
@WebServlet({"/login","/logout"})
public class LoginController extends HttpServlet {
    @SneakyThrows
    @Override
    //TODO 홈화면 만들면 홈화면으로 돌아가는 방식으로 수정
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();

        String preUrl = request.getHeader("Referer");
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        PrintWriter printWriter = response.getWriter();

        if(url.equals("/login")){
            Member member = MemberDAO.getInstance().login(request.getParameter("id"),request.getParameter("pw"));
            if(member != null)
                request.getSession().putValue("member", member);
            else
                printWriter.print("<script>alert('로그인에 실패했습니다')</script>");
        }
        else{
            Member member = (Member) request.getSession().getAttribute("member");
            if(member == null)
                printWriter.print("<script>alert('비정상적인 접근입니다')</script>");
            else
                request.getSession().removeAttribute("member");
        }
        printWriter.print("<script>window.location.href ='" + preUrl +"'</script>");
    }
}
