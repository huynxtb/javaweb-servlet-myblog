package com.myblog.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.myblog.model.UserModel;
import com.myblog.service.IUserService;
import com.myblog.utils.HttpUtil;
import com.myblog.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-web-del-account"})
public class DelUserAPI extends HttpServlet {

    @Inject
    private IUserService userService;

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        UserModel userModel = HttpUtil.of(request.getReader()).toModel(UserModel.class);
        userModel.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
        userModel = userService.delete(userModel);
        mapper.writeValue(response.getOutputStream(), userModel);
    }
}
