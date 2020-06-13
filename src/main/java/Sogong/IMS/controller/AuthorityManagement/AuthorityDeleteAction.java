package Sogong.IMS.controller.authorityManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.MemberAuthorityGroupDAO;
import Sogong.IMS.model.Member;
import Sogong.IMS.model.MemberAuthorityGroup;
import org.apache.commons.lang3.StringUtils;

public class AuthorityDeleteAction implements Action {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();


            String memberID = StringUtils.defaultIfBlank(request.getParameter("memberID"),null);

            if(memberID != null){

                HashMap<String,Object> condition = new HashMap<>();
                condition.put("memberID",memberID);

                Member member = new MemberAuthorityGroupDAO().lookup(condition)[0];

                for(MemberAuthorityGroup mag : member.getMemberAuthorityGroups()){
                    Boolean isOK = new MemberAuthorityGroupDAO().delete(mag);

                    if(!isOK){
                        out.println("<script>alert('실패했습니다.')</script>");
                        out.println("<script>self.close()</script>");
                        break;
                    }
                }
            }

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}