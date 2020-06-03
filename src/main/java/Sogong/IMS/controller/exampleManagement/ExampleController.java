package Sogong.IMS.controller.exampleManagement;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

@WebServlet("/ExampleManage/*")
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
        String url = request.getRequestURI();
        String servletPath = request.getServletPath();

        String path = url.substring(servletPath.length());

        Action action = list.get(path);
        action.excute(request, response);
    }

    public boolean hasAuthority(Member member, String authorityName){
        return false;
    }
}
