package Sogong.IMS.controller.FacilityChargeManagement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.FacilityChargeDAO;
import Sogong.IMS.model.FacilityCharge;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

public class FacilityChargeModifyAction implements Action{
    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {

        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();

            String workspaceID = StringUtils.defaultIfBlank(request.getParameter("inputWorkspaceID"), null);
            String facilityID = StringUtils.defaultIfBlank(request.getParameter("inputFacilityID"), null);
            String prevChargeName = StringUtils.defaultIfBlank(request.getParameter("inputPreviousChargeName"), null);

            String newChargeName;
            int newCharge;
            boolean newIsDiscount = false;
            float newDiscountRate;

            newChargeName = StringUtils.defaultIfBlank(request.getParameter("inputNewChargeName"), null);
            newCharge = Integer.parseInt(request.getParameter("inputNewCharge"));
            newDiscountRate = Float.parseFloat(request.getParameter("inputNewDiscountRate"));

            String strNewIsDiscount = StringUtils.defaultIfBlank(request.getParameter("inputNewIsDiscount"), null);
            switch (strNewIsDiscount) {
                case "예":
                    newIsDiscount = true;
                    break;
                case "아니오":
                    newIsDiscount = false;
                    break;
            }

            if (workspaceID != null && prevChargeName != null && facilityID != null) {

                HashMap<String, Object> condition = new HashMap<>();
                condition.put("workspaceID", workspaceID);
                condition.put("facilityID", facilityID);
                condition.put("chargeName", prevChargeName);

                FacilityCharge facilityCharge = new FacilityChargeDAO().lookup(condition)[0];

                facilityCharge.setChargeName(newChargeName);
                facilityCharge.setCharge(newCharge);
                facilityCharge.setDiscount(newIsDiscount);
                facilityCharge.setDiscountRate(newDiscountRate);

                boolean isOK = new FacilityChargeDAO().modify(prevChargeName, facilityCharge);

                if (isOK) {
                    out.println("<script>alert('성공적으로 수정되었습니다.')</script>");
                    out.println("<script>self.close()</script>");
                }

                out.flush();
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}