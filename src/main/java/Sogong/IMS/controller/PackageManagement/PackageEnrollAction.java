package Sogong.IMS.controller.PackageManagement;

import Sogong.IMS.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PackageEnrollAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
//        boolean result = PackageDAO.getInstance().enroll(new Package(request.getParameter("packageName"), Integer.parseInt(request.getParameter("packagePrice").trim()), request.getParameter("packageCompany"), request.getParameter("packageRegistrant")));
    }
}
