package Sogong.IMS.controller.WorkspaceManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

@WebServlet({"/workspaceManage/*"})
public class WorkspaceController extends HttpServlet{
    HashMap<String, Action> actionList;

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            PrintWriter printWriter = response.getWriter();

            String url = request.getRequestURI();
            String servletPath = request.getServletPath();
    
            String path = url.substring(servletPath.length()).split("/")[1];
    
            Action action = actionList.get(path);
            action.excute(request, response);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public void init() throws ServletException {
        actionList = new HashMap<>();
        actionList.put("enroll.do", new WorkspaceEnrollAction());
        actionList.put("modify.do", new WorkspaceModifyAction());
        actionList.put("delete.do", new WorkspaceDeleteAction());
        actionList.put("lookup.do", new WorkspaceLookupAction());
    }

    public boolean hasAuthority(Member member, String authorityName) {
        return false;
    }
}