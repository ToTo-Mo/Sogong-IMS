package Sogong.IMS.controller.PackageManagement;

import Sogong.IMS.controller.Action;
import Sogong.IMS.dao.PackageDAO;
import Sogong.IMS.model.Package;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

public class PackageModifyAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Package aPakcage = new Package(request.getParameter("packageID"),"test", request.getParameter("packageName"),request.getParameter("company"),request.getParameter("type")
                ,request.getParameter("explanation"),Integer.parseInt(request.getParameter("price")));
        PrintWriter printWriter = response.getWriter();
        if(PackageDAO.getInstance().modify(aPakcage) == true)
            printWriter.print("<script>alert('성공적으로 수정되었습니다')</script>");
        else
            printWriter.print("<script>alert('수정에 실패했습니다.')</script>");
        printWriter.print("<script>self.close()</script>");




    }
}
