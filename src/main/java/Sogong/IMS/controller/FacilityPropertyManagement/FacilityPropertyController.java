package Sogong.IMS.controller.FacilityPropertyManagement;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.DeviceManagement.DeviceEnrollAction;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;

@WebServlet("/facilityPropertyMangeView")
public class FacilityPropertyController extends HttpServlet {

    private static final long serialVersionUID = 8559171819500212874L;

    HashMap<String, Action> list = null;
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        String servletPath = request.getServletPath();

        String path = url.substring(servletPath.length()).split("/")[1];

        Action action = list.get(path);
        action.excute(request, response);
    }
    @Override
    public void init(ServletConfig sc) throws ServletException {
        list = new HashMap<>();
        list.put("enroll.do", new FacilityPropertyEnrollAction());
        list.put("modify.do", new FacilityPropertyModifyAction());
        list.put("delete.do", new FacilityPropertyDeleteAction());
        list.put("lookup.do", new FacilityPropertyLookupAction());
    }

    public boolean hasAuthority(Member member, String authorityName) {
        MemberAuthorityGroupDAO memberAuthorityGroupDAO = new MemberAuthorityGroupDAO();

        return memberAuthorityGroupDAO.hasAuthority(member, authorityName);
    }
}