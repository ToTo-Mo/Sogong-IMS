package Sogong.IMS.controller.FacilityPropertyManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.dao.FacilityPropertyDAO;
import Sogong.IMS.model.Facility;
import Sogong.IMS.controller.Action;
import Sogong.IMS.model.Device;
import Sogong.IMS.model.FacilityProperty;

public class FacilityPropertyModifyAction implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ParseException, NamingException, SQLException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date to = (Date) transFormat.parse(request.getParameter("OpenningDate"));

        FacilityProperty facilityProperty = new FacilityProperty(request.getParameter("FacilityPrpertyID"), request.getParameter("FacilityID"),request.getParameter("registrantID"),to
                ,Integer.parseInt(request.getParameter("FacilityScale")),Integer.parseInt(request.getParameter("FacilityCost")));
        PrintWriter printWriter = response.getWriter();
        if(FacilityPropertyDAO.getInstance().modify(facilityProperty) == true)
            printWriter.print("<script>alert('성공적으로 수정되었습니다')</script>");
        else
            printWriter.print("<script>alert('수정에 실패했습니다.')</script>");
        printWriter.print("<script>self.close()</script>");

    
}

@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
    }
}