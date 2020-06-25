package Sogong.IMS.controller.PackageSalesManagement;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.PackageSalesPerformanceDAO;
import Sogong.IMS.model.PackageSalesPerformance;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class PackageSalesPerformanceLookupAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws SQLException, NamingException {
        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

                final String stringConditions[] = { "minSalesDay", "maxSalesDay", "packageName", "type", "company", "minSumSalesPrice", "maxSumSalesPrice", "minSalesNum", "maxSalesNum"};
        LinkedHashMap<String,Object> conditions = new LinkedHashMap<String,Object>();
        final String integerCondtions[] = {"minSalesNum", "maxSalesNum","minSumSalesPrice","maxSumSalesPrice"};
        for(String key : stringConditions){
            if(key.equals("") == false){
                if(!request.getParameter(key).equals("")){
                    if(Arrays.asList(integerCondtions).contains(key))
                        conditions.put(key, Integer.parseInt(request.getParameter(key)));
                    else
                        conditions.put(key, request.getParameter(key));
                }
                else{
                    if(Arrays.asList(integerCondtions).contains(key) == true) {
                        if (key.matches("min.*"))
                            conditions.put(key,0);
                        else
                            conditions.put(key,Integer.MAX_VALUE);
                    }
                    else if(key.matches(".*SalesDay")){
                        if(key.matches("min.*"))
                            conditions.put(key, "0001-01-01");
                        else
                            conditions.put(key, "9999-12-30");
                    }
                    else
                        conditions.put(key, "%");
                }
            }
        }

        request.setAttribute("lookupResult", PackageSalesPerformanceDAO.getInstance().lookup(conditions));

        ServletContext context = request.getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/packageSalesPerformance"); // 넘길 페이지 주소
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
