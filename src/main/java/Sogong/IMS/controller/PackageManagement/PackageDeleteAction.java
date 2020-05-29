package Sogong.IMS.controller.PackageManagement;

import Sogong.IMS.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public class PackageDeleteAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
//        boolean result = PackageDAO.getInstance().delete(new Package(request.getParameter("packageName"), Integer.parseInt(request.getParameter("packagePrice").trim()), request.getParameter("packageCompany"), request.getParameter("packageRegistant")));
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=utf-8");

    }
}
