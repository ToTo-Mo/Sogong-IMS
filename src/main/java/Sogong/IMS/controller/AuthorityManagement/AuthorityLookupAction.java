package Sogong.IMS.controller.authorityManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.model.AuthorityGroup;
import org.apache.commons.lang3.StringUtils;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.model.Member;

public class AuthorityLookupAction implements Action {

    @Override
    public void excute(final HttpServletRequest request, final HttpServletResponse response) {
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        String memberID = StringUtils.defaultIfBlank(request.getParameter("inputMemberID"), null);
        String memberType = StringUtils.defaultIfBlank(request.getParameter("inputMemberType"), null);
        String department = StringUtils.defaultIfBlank(request.getParameter("inputDepartment"), null);
        String authorityName = StringUtils.defaultIfBlank(request.getParameter("inputAuthorityName"), null);

        AuthorityGroup authorityGroup = null;

        if(authorityName != null){
            authorityGroup = AuthorityGroup.builder().authorityGroupName(authorityName).build();
        }

        HashMap<String,Object> condition = new HashMap<>();

        if(memberID != null) condition.put("memberID", memberID);
        if(memberType != null) condition.put("memberType", memberType);
        if(department != null) condition.put("department", department);
        if(authorityGroup != null) condition.put("authorityGroupName", authorityGroup);

        ArrayList<Member> members = new ArrayList<>(Arrays.asList(new MemberAuthorityGroupDAO().lookup(condition)));

        request.setAttribute("members", members);

        ServletContext context = request.getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/authorityManage"); // 넘길 페이지 주소
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
}