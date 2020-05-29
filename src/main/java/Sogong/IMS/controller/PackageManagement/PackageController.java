package Sogong.IMS.controller.PackageManagement;

import Sogong.IMS.controller.Common.LoginAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PackageController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
        doGetPost(req,resp);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGetPost(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGetPost(request,response);
    }

    private void doGetPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");
        String uri = request.getRequestURI();
        System.out.println(uri + " = url");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/PackageManage/PackageManage.jsp");
        System.out.println(request.getParameter("login") + "Asdsadsadsdsadsad");


//        if(request.getParameter("enroll") != null)
//            new PackageEnrollAction().execute(request,response);
//        if(request.getParameter("lookup") != null)
//            new PackageLookupAction().execute(request,response);
//        else if(request.getSession().getAttribute("preCondition") != null)
//            new PackageLookupAction().executePreCondition(request,response);
//        else if(request.getParameter("delete") != null)
//            new PackageDeleteAction().execute(request,response);

        if((request.getParameter("login") != null) ||(request.getParameter("logout") != null))
            new LoginAction().execute(request,response);

        dispatcher.forward(request, response);
    }
}
