package Sogong.IMS.controller.AuthorityManagement;

import java.net.http.HttpResponse;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;

@WebServlet("/authority")
public class AuthorityController extends HttpServlet{

    private static final long serialVersionUID = 8559171819500212874L;

    HashMap<String, Action> list = null;

    @Override
    public void init(ServletConfig sc) throws ServletException{
        list = new HashMap<>();

        list.put("/enroll.do", new AuthorityEnrollAction());
    }

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURI();
        String contextPath = request.getContextPath();

        String path = url.substring(contextPath.length());

        Action action = list.get(path);
        action.excute(request, response);
    }
}