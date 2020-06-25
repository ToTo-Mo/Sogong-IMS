package Sogong.IMS.controller.authorityManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.model.Member;

@WebServlet("/authorityManage/*")
public class AuthorityController extends HttpServlet {

    private static final long serialVersionUID = 8559171819500212874L;

    HashMap<String, Action> list = null;

    @Override
    public void init(ServletConfig sc) throws ServletException {
        list = new HashMap<>();

        list.put("enroll.do", new AuthorityEnrollAction());
        list.put("lookup.do", new AuthorityLookupAction());
        list.put("modify.do", new AuthorityModifyAction());
        list.put("delete.do", new AuthorityDeleteAction());
    }

    // get이나 post 요청에 대한 처리를 수행합니다.
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {

            String url = request.getRequestURI();
            String servletPath = request.getServletPath();

            String path = url.substring(servletPath.length()).split("/")[1];

            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();

            Member member = (Member) session.getAttribute("member");

            if (!hasAuthority(member, "관리자")) {
                switch (path) {
                    case "enroll.do":
                        if (!hasAuthority(member, "권한_등록")) {
                            path = null;
                            out.println("<script>alert('등록 권한이 없습니다.');</script>");
                            out.flush();
                            return;
                        }
                        break;
                    case "lookup.do":
                        if (!hasAuthority(member, "권한_조회")) {
                            path = null;
                            out.println("<script>alert('조회 권한이 없습니다.'); location.href='" + servletPath + "';</script>");
                            out.flush();
                            return;
                        }
                        break;
                    case "modify.do":
                        if (!hasAuthority(member, "권한_수정")) {
                            path = null;
                            out.println("<script>alert('수정 권한이 없습니다.'); location.href='" + servletPath + "';</script>");
                            out.flush();
                            return;
                        }
                        break;
                    case "delete.do":
                        if (!hasAuthority(member, "권한_삭제")) {
                            path = null;
                            out.println("<script>alert('삭제 권한이 없습니다.'); location.href='" + servletPath + "';</script>");
                            out.flush();
                            return;
                        }
                        break;
                }
            }

            if (list.get(path) != null) {
                Action action = list.get(path);
                action.excute(request, response);
            }

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public boolean hasAuthority(Member member, String authorityName) {
        return new MemberAuthorityGroupDAO().hasAuthority(member, authorityName);
    }
}