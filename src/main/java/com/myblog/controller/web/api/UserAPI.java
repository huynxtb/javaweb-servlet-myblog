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

@WebServlet(urlPatterns = {"/api-web-user"})
public class UserAPI extends HttpServlet {

    private static final long serialVersionUID = 5207745918071529392L;

    @Inject
    private IUserService userService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper ob = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel userModel = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        userModel = userService.save(userModel);
        System.out.println(userModel);
        ob.writeValue(resp.getOutputStream(), userModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel updateUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        updateUser.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getUserName());
        updateUser = userService.update(updateUser);
        System.out.println(updateUser);
        mapper.writeValue(resp.getOutputStream(), updateUser);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UserModel updateUser = HttpUtil.of(req.getReader()).toModel(UserModel.class);
        updateUser = userService.delete(updateUser);
        System.out.println(updateUser);
        mapper.writeValue(resp.getOutputStream(), updateUser);
    }
}

