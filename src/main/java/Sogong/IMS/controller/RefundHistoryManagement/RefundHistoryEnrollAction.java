package Sogong.IMS.controller.RefundHistoryManagement;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.RefundHistoryDAO;
import Sogong.IMS.model.RefundHistory;

public class RefundHistoryEnrollAction implements Action {
   
    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");

            String refundHistoryID = request.getParameter("inputRefundHistoryID");

            new RefundHistoryDAO().enroll(
                                    RefundHistory.builder()
                                                    .refundHistoryID(refundHistoryID)
                                                    .build());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}