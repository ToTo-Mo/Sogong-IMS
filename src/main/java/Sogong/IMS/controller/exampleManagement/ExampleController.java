package Sogong.IMS.controller.exampleManagement;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.model.Member;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

@WebServlet({ "/exampleManage/*", "/exampleEnroll/*" })
public class ExampleController extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = -828422004854432800L;
    HashMap<String, Action> list = null;

    @Override
    public void init(ServletConfig sc) throws ServletException {
        list = new HashMap<>();

        list.put("/enroll.do", new ExampleEnrollAction());
        list.put("/lookup.do", new ExampleLookupAction());
        list.put("/modify.do", new ExampleModifyAction());
        list.put("/delete.do", new ExampleDeleteAction());
    }

    // get이나 post 요청에 대한 처리를 수행합니다.
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("euc-kr");
            response.setCharacterEncoding("euc-kr");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        String url = request.getRequestURI();
        String servletPath = request.getServletPath();
        String path = url.substring(servletPath.length());

        // Member member = Member.builder().name("apple").build();

        // try {
        //     PrintWriter out;
        //     out = response.getWriter();


        //     if(!hasAuthority(member, "관리자")){
        //         switch (path) {
        //             case "/enroll.do":
        //                 if (!hasAuthority(member, "회원_등록")) {
        //                     path= null;
        //                     out.println("<script>alert('권한이 없습니다.');</script>");
        //                     out.flush();
        //                     return;
        //                 }
        //             case "/lookup.do":
        //                 if (!hasAuthority(member, "회원_조회")) {
        //                     path= null;
        //                     out.println("<script>alert('조회 권한이 없습니다.'); location.href='"+servletPath+"';</script>");
        //                     out.flush();
        //                     return;
        //                 }
        //         }
        //     }
            
        // } catch (IOException e) {
        //     // TODO Auto-generated catch block
        //     e.printStackTrace();
        // }

        if (list.get(path) != null) {
            Action action = list.get(path);
            action.excute(request, response);
        }
    }

    public boolean hasAuthority(Member member, String authorityName) {
        MemberAuthorityGroupDAO memberAuthorityGroupDAO = new MemberAuthorityGroupDAO();

        return memberAuthorityGroupDAO.hasAuthority(member, authorityName);
    }
}
