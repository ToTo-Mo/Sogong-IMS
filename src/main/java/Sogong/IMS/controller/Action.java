package Sogong.IMS.controller;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

public interface Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException, NamingException, ClassNotFoundException;
}