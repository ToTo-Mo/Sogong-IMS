package Sogong.IMS.controller.PaymentHistoryManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.PaymentHistoryDAO;
import Sogong.IMS.model.AuthorityGroup;
import Sogong.IMS.model.PaymentHistory;

public class PaymentHistoryLookupAction implements Action {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();

            PaymentHistoryDAO payDAO = new PaymentHistoryDAO();

            String memberID = request.getParameter("inputMemberID");
            String[] authorities = request.getParameterValues("inputAuthorities");
            

            if(memberID != null & authorities != null){

                Boolean isOk = null;

                HashMap<String, Object> condition = new HashMap<>();
                condition.put("memberID", memberID);

                if(payDAO.lookup(condition).length <= 0){
//                    for(String s : authorities){
//                        isOk = payDAO.enroll(PaymentHistory.builder()
//                                                .authorityGroup(AuthorityGroup.builder()
//                                                .authorityGroupID(Integer.parseInt(s)).build())
//
//                                                .memberID(memberID).build());
//                    }

                    if(isOk){
                        out.println("<script>alert('성공적으로 등록되었습니다.')</script>");
                        out.println("<script>self.close()</script>");
                    }else{
                        out.println("<script>alert('존재하지 않는 ID입니다.')</script>");
                        out.println("<script>self.close()</script>");
                    }

                }else{
                    out.println("<script>alert('이미 등록된 ID입니다.')</script>");
                    out.println("<script>self.close()</script>");
                }

                out.flush();
            }

        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
    
}