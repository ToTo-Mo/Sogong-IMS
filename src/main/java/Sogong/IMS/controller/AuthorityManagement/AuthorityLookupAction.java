package Sogong.IMS.controller.authorityManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.model.Member;
import Sogong.IMS.model.MemberAuthorityGroup;

public class AuthorityLookupAction implements Action {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub

        response.setCharacterEncoding("UTF-8");

        String memberID = (String)request.getAttribute("memberID");
        String memberType = (String)request.getAttribute("memberType");
        String department = (String)request.getAttribute("department");
        String authorityGroupName = (String)request.getAttribute("authorityGroupName");

        HashMap<String,String> condition = new HashMap<>();
        if(memberID != null) condition.put("memberID", memberID);
        if(memberType != null) condition.put("memberType", memberType);
        if(department != null) condition.put("department", department);
        if(authorityGroupName != null) condition.put("authorityGroupName", authorityGroupName);

        Member[] members = new MemberAuthorityGroupDAO().lookup(condition);

        StringBuilder data = new StringBuilder();

        if(members != null){
            int seq = 1;

            for(Member m : members){

                String authorityGroups = "";

                for(MemberAuthorityGroup mag : m.getMemberAuthorityGroups())
                    authorityGroups += mag.getAuthorityGroup().getAuthorityGroupName() +" ";

                data.append("<tr>")
                    .append(String.format("<td>%s</td>", seq++))
                    .append(String.format("<td>%s</td>", m.getDepartment()))
                    .append(String.format("<td>%s</td>", m.getMemberID()))
                    .append(String.format("<td>%s</td>", m.getMemberType()))
                    .append(String.format("<td>%s</td>", authorityGroups))
                    .append("<tr>");
            }
        }
        request.setAttribute("data", data.toString());

        ServletContext context = request.getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/AuthorityManage.jsp"); // 넘길 페이지 주소
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
}