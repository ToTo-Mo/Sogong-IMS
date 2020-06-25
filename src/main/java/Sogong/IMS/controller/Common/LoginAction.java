package Sogong.IMS.controller.Common;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberDAO;
import Sogong.IMS.model.Member;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

public class LoginAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException, NamingException {
        if(request.getParameter("login") != null){
            String id = request.getParameter("id");
            String pw = request.getParameter("pw");
            Member member = MemberDAO.getInstance().login(id,pw);
            if(id.equals("test") && pw.equals("test"))
                request.getSession().setAttribute("member", member);
        }
        else if(request.getParameter("logout") != null){
            request.getSession().removeAttribute("member");
        }
    }
}
