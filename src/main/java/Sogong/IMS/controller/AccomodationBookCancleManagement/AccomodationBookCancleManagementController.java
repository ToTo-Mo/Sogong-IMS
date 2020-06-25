package Sogong.IMS.controller.AccomodationBookCancleManagement;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.model.Member;
import lombok.SneakyThrows;

@WebServlet({ "/accomodationBookCancleHistoryManage/*", "/accomodationBookCancleHistoryEnroll/*" })
public class AccomodationBookCancleManagementController extends HttpServlet {
     
    private static final long serialVersionUID = 8559000000000000001L;
     HashMap<String, Action> list = null;

     @Override
     public void init(ServletConfig sc) throws ServletException {
         list = new HashMap<>();
 
         list.put("enroll.do", new AccomodationBookCancleHistoryEnrollAction());
         list.put("lookup.do", new AccomodationBookCancleHistoryLookupAction());
         list.put("modify.do", new AccomodationBookCancleHistoryModifyAction());
         list.put("delete.do", new AccomodationBookCancleHistoryDeleteAction());
     }
 
     // get이나 post 요청에 대한 처리를 수행합니다.
     @SneakyThrows
     @Override
     public void service(HttpServletRequest request, HttpServletResponse response) {
      
        String url = request.getRequestURI();
        String servletPath = request.getServletPath();

        String path = url.substring(servletPath.length()).split("/")[1];

        if(list.get(path) !=null){
            Action action = list.get(path);
            action.excute(request, response);
        }
     }

     public boolean hasAuthority(Member member, String authorityName) {
        MemberAuthorityGroupDAO memberAuthorityGroupDAO = new MemberAuthorityGroupDAO();

        return memberAuthorityGroupDAO.hasAuthority(member, authorityName);
    }
}