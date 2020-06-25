package Sogong.IMS.controller.FacilityManagement;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.dao.FacilityPropertyDAO;
import Sogong.IMS.controller.Action;
import Sogong.IMS.model.FacilityProperty;

public class FacilityLookupAction implements Action {
	 public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, NamingException, ClassNotFoundException {
	        try {
	            request.setCharacterEncoding("utf-8");
	        } catch (UnsupportedEncodingException e1) {
	            // TODO Auto-generated catch block
	            e1.printStackTrace();
	        }

	        String[] condtionNames = {"packageName", "type" , "company" , "registrantID"};
	        HashMap<String,Object> condtions = new HashMap<>();
	        for(String condition : condtionNames){
	            String value = request.getParameter(condition);
	            if(value != "")
	                condtions.put(condition, value);
	        }
	        if((request.getParameter("packageMinPrice") != "") || (request.getParameter("packageMaxPrice") != "")){
	            int priceRange[] ={1,2};
	            priceRange[0] = request.getParameter("packageMinPrice") == "" ? 0 : Integer.parseInt(request.getParameter("packageMinPrice"));
	            priceRange[1] = request.getParameter("packageMaxPrice") == "" ? 99999999 : Integer.parseInt(request.getParameter("packageMaxPrice"));
	            condtions.put("price", priceRange);
	        }
	        FacilityProperty[] lookupResult = FacilityPropertyDAO.getInstance().lookup(condtions);
	        StringBuilder stringBuilder = new StringBuilder();
	        for(FacilityProperty tmp : lookupResult){
	            stringBuilder.append("<tr>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append(tmp.getFacilityID());
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append("null");
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append(tmp.getRegistrantID());
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append(tmp.getFacilityScale());
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append(tmp.getFacilityCost());
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append(tmp.getOpeningDate());
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append("<button type=\"button\" class=\"btn btn-secondary btn-sm\" onclick='modifyPopup("+ tmp.getFacilityPropertyID() + ")'>수정</button>");
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("<td>");
	            stringBuilder.append("<a class='btn btn-secondary btn-sm' href='delete.do/"+tmp.getFacilityPropertyID() + "'>삭제</a>");
	            stringBuilder.append("</td>\n");
	            stringBuilder.append("</tr>\n");
	        }
	        request.setAttribute("lookup", stringBuilder.toString());
	        ServletContext context = request.getServletContext();
	        RequestDispatcher dispatcher = context.getRequestDispatcher("/packageManage"); // 넘길 페이지 주소
	        try {
	            dispatcher.forward(request, response);
	        } catch (ServletException | IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}
}