package Sogong.IMS.controller.PackageManagement;

import Sogong.IMS.controller.Action;
import lombok.SneakyThrows;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
@WebServlet({"/packageManage/*"})
public class PackageController extends HttpServlet {
    HashMap<String, Action> list = null;
    @SneakyThrows
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        String servletPath = request.getServletPath();

        String path = url.substring(servletPath.length()).split("/")[1];

        Action action = list.get(path);
        action.execute(request, response);
    }
    @Override
    public void init(ServletConfig sc) throws ServletException {
        list = new HashMap<>();
        list.put("enroll.do", new PackageEnrollAction());
        list.put("modify.do", new PackageModifyAction());
        list.put("delete.do", new PackageDeleteAction());
        list.put("lookup.do", new PackageLookupAction());
    }

}
