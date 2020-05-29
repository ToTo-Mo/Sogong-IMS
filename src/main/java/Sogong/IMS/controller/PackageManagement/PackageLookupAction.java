//package Sogong.controller.PackageManagement;
//
//import Sogong.controller.Action;
//import Sogong.dao.PackageDAO;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.Vector;
//
//public class PackageLookupAction implements Action {
//    @Override
//    public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String minPrice = request.getParameter("minPrice");
//        String maxPrice = request.getParameter("maxPrice");
//        HashMap<String,String> condtions = new HashMap<>();
//        if(!minPrice.equals(""))
//            condtions.put("minPrice", minPrice);
//        if(!maxPrice.equals(""))
//            condtions.put("maxPrice", maxPrice);
//        request.getSession().setAttribute("preCondition", condtions);
//
//        request.setAttribute("data",generateHtml(condtions).toString());
//    }
//
//
//    public void executePreCondition(HttpServletRequest request, HttpServletResponse response) {
//
//        HashMap<String,String> condtions = (HashMap<String, String>) request.getSession().getAttribute("preCondition");
//        request.setAttribute("data",generateHtml(condtions).toString());
//    }
//
//    private StringBuilder generateHtml(HashMap<String,String> condtions){
//        Vector<Package> packages = PackageDAO.getInstance().select(condtions);
//        StringBuilder stringBuilder = new StringBuilder();
//        for(Package tmp : packages){
//            stringBuilder.append("<form method=\"post\">\n");
//            stringBuilder.append("<tr name='packageData'>\n");
//            stringBuilder.append("<td>");
//            stringBuilder.append("<input type=\"text\" name=\"packageName\" class=\"data\" readonly value=");
//            stringBuilder.append(tmp.getName() + ">\n");
//            stringBuilder.append("</td>\n");
//            stringBuilder.append("<td>");
//            stringBuilder.append("<input type=\"text\" name=\"packagePrice\" class=\"data\" readonly value=");
//            stringBuilder.append(tmp.getPrice() + ">\n");
//            stringBuilder.append("<td>");
//            stringBuilder.append("<input type=\"text\" name=\"packageCompany\" class=\"data\" readonly value=");
//            stringBuilder.append(tmp.getCompany() + ">\n");
//            stringBuilder.append("</td>\n");
//            stringBuilder.append("<td>");
//            stringBuilder.append("<input type=\"text\" name=\"packageRegistrant\" class=\"data\" readonly value=");
//            stringBuilder.append(tmp.getRegistrant() + ">\n");
//            stringBuilder.append("</td>\n");
//            stringBuilder.append("<td>");
//            stringBuilder.append("<button type=\"button\" name=\"modify\">수정</button>");
//            stringBuilder.append("</td>\n");
//            stringBuilder.append("<td>");
//            stringBuilder.append("<button type=\"submit\" name=\"delete\"> 삭제 </button>");
//            stringBuilder.append("</td>\n");
//            stringBuilder.append("</tr>\n");
//            stringBuilder.append("</form>\n");
//        }
//
//        return stringBuilder;
//    }
//
//
//
//}
