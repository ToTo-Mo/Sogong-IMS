package Sogong.IMS.controller.AccomodationBookCancleManagement;

import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;

public class AccomodationBookCancleManagementController extends HttpServlet {
     //private static final long serialVersionUID = 8559171819500212874L;

     HashMap<String, Action> list = null;

     @Override
     public void init(ServletConfig sc) throws ServletException {
         list = new HashMap<>();
 
         list.put("/enroll.do", new AccomodationBookCancleHistoryEnrollAction());
         list.put("/lookup.do", new AccomodationBookCancleHistoryLookupAction());
         list.put("/modify.do", new AccomodationBookCancleHistoryModifyAction());
         list.put("/delete.do", new AccomodationBookCancleHistoryDeleteAction());
     }
 
     // get이나 post 요청에 대한 처리를 수행합니다.
     @Override
     public void service(HttpServletRequest request, HttpServletResponse response) {
         String url = request.getRequestURI();
         String servletPath = request.getServletPath();
 
         String path = url.substring(servletPath.length());
 
         Action action = list.get(path);
         action.excute(request, response);
     }
}