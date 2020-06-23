package Sogong.IMS.controller.FacilityChargeManagement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.FacilityChargeDAO;
import Sogong.IMS.model.FacilityCharge;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

public class FacilityChargeLookupAction implements Action{
    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();

            String workspaceID = request.getParameter("inputWorkspaceID");
            String facilityID =request.getParameter("inputFacilityID");

            String chargeName = request.getParameter("inputChargeName");
            String resistrantID = request.getParameter("inputResistrantID");

            HashMap<String, Object> condition = new HashMap<>();

            condition.put("workspaceID", workspaceID);
            condition.put("facilityID", facilityID);

            if (chargeName != null) {
                condition.put("chargeName", chargeName);
            }
            if (resistrantID !=  null) {
                condition.put("resistrantID", resistrantID);
            }

            FacilityCharge[] facilityCharges = new FacilityChargeDAO().lookup(condition);

            request.setAttribute("facilityCharges", facilityCharges);

            ServletContext context = request.getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("faciltyChargeManage");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}