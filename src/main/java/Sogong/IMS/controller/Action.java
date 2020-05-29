package Sogong.IMS.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

public interface Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException;
}