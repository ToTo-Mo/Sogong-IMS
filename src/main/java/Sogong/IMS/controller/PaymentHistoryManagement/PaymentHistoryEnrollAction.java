package Sogong.IMS.controller.PaymentHistoryManagement;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.PaymentHistoryDAO;
import Sogong.IMS.model.PaymentHistory;

public class PaymentHistoryEnrollAction implements Action {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");

            String paymentHistoryID = request.getParameter("inputPaymentHistoryID");

            new PaymentHistoryDAO().enroll(
                                    PaymentHistory.builder()
                                                    .paymentHistoryID(paymentHistoryID)
                                                    .build());
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
}