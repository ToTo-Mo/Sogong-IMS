package Sogong.IMS.controller.FacilityChargeManagement;

import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Member;
import lombok.SneakyThrows;

@WebServlet("/facilityChargeMangeView")
public class FacilityChargeController extends HttpServlet {

    private static final long serialVersionUID = 8559171819500212874L;

    HashMap<String, Action> list = null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        list = new HashMap<>();

        list.put("/enroll.do", new FacilityChargeEnrollAction());
        list.put("/lookup.do", new FacilityChargeLookupAction());
        list.put("/modify.do", new FacilityChargeModifyAction());
        list.put("/delete.do", new FacilityChargeDeleteAction());
    }

    @SneakyThrows
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response){
        String url = request.getRequestURI();
        String contextPath = request.getContextPath();

        String path = url.substring(contextPath.length());

        Action action = list.get(path);
        action.excute(request, response);
    }

    public boolean hasAuthority(Member member, String authorityName){
        return false;
    }
}