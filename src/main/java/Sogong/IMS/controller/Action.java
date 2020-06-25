package Sogong.IMS.controller;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public interface Action {
    public void excute(HttpServletRequest request, HttpServletResponse response);
}