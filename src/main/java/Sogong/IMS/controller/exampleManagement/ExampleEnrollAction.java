package Sogong.IMS.controller.exampleManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.ExampleDAO;
import Sogong.IMS.model.Example;

public class ExampleEnrollAction implements Action {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");

            PrintWriter out = response.getWriter();

            String title = request.getParameter("inputTitle");

            new ExampleDAO().enroll(
                                    Example.builder()
                                                    .title(title)
                                                    .build());

            out.println("<script>alert('성공적으로 등록되었습니다.')</script>");
            out.println("<script>self.close()</script>");
            out.flush();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


    }
}