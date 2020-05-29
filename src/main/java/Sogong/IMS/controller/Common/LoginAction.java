package Sogong.IMS.controller.Common;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class LoginAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        if(request.getParameter("login") != null){
            String id = request.getParameter("id");
            String pw = request.getParameter("pw");
            System.out.println(id);
            System.out.println(pw);
            if(id.equals("test") && pw.equals("test"))
                request.getSession().setAttribute("member", new Member(id,pw,"도준호"));
        }
        else if(request.getParameter("logout") != null){
            request.getSession().removeAttribute("member");
        }
    }
}
