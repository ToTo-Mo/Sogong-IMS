package Sogong.IMS.controller.PackageManagement;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.PackageDAO;
import Sogong.IMS.model.Package;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Vector;

public class PackageLookupAction implements Action {
    @Override
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
        Package[] lookupResult = PackageDAO.getInstance().lookup(condtions);
        StringBuilder stringBuilder = new StringBuilder();
        for(Package tmp : lookupResult){
            stringBuilder.append("<form action=\"${pageContext.request.servletPath}/modify.do\" method=\"POST\">");
            stringBuilder.append("<tr name='packageData'>\n");
            stringBuilder.append("<td>");
            stringBuilder.append(tmp.getPackageName());
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append(tmp.getType());
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append(tmp.getCompany());
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append(tmp.getPrice());
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append(tmp.getRegistrantID());
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append(tmp.getExplanation());
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<button type=\"submit\" class=\"btn btn-secondary btn-sm\">수정</button>");
            stringBuilder.append("</td>\n");
            stringBuilder.append("<td>");
            stringBuilder.append("<button type=\"submit\" class=\"btn btn-secondary btn-sm\">삭제</button>");
            stringBuilder.append("</td>\n");
            stringBuilder.append("</tr>\n");
            stringBuilder.append("</form>\n");
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
}
