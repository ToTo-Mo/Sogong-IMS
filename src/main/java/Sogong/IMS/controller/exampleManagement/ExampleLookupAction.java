package Sogong.IMS.controller.exampleManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.ExampleDAO;
import Sogong.IMS.model.Example;

public class ExampleLookupAction implements Action {

    @Override
    public void excute(HttpServletRequest request, HttpServletResponse response) {
        // TODO Auto-generated method stub

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        //1. 값이 없다면 null로 지정됩니다.
        String id = StringUtils.defaultIfBlank(request.getParameter("inputId"), null);
        String title = StringUtils.defaultIfBlank(request.getParameter("inputTitle"), null);
        String dateRange =  StringUtils.defaultIfBlank(request.getParameter("inputDateRange"), null);

        LocalDate[] createDate = null;

        if(dateRange != null){
            createDate = new LocalDate[2];

            createDate[0] = LocalDate.parse(dateRange.split("~")[0]);   // 시작일
            createDate[1] = LocalDate.parse(dateRange.split("~")[1]);   // 종료일
        }

        // 2. 조건 검색을 위한 HashMap으로 String은 table의 column명, Object는 그 자료형이 됩니다.
        HashMap<String,Object> condition = new HashMap<>();
        
        // 3. 값이 있는 항목에 대해서만 조건 검색에 추가합니다.
        if(id != null) condition.put("id", id);

        if(title != null) condition.put("title", title);

        if(createDate != null) condition.put("createDate", createDate);

        // 4. 결과를 가져옵니다. 출력의 편의성을 위해 Example[]에서 ArrayList로 변환했습니다.
        ArrayList<Example> examples = new ArrayList<>(Arrays.asList(new ExampleDAO().lookup(condition)));

        // 5. 보여줄 페이지에 해당 결과를 전달합니다.
        request.setAttribute("examples", examples);

        // 6. 보여줄 페이지를 지정합니다.
        ServletContext context = request.getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/exampleManage"); // 넘길 페이지 주소
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}