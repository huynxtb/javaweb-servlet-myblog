package com.myblog.controller.admin;

import com.myblog.constant.SystemConstant;
import com.myblog.model.UserModel;
import com.myblog.paging.PageRequest;
import com.myblog.paging.Pageble;
import com.myblog.service.IUserService;
import com.myblog.sort.Sorter;
import com.myblog.utils.FormUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin-user"})
public class UserController extends HttpServlet {

    private static final long serialVersionUID = -229198239087394606L;

    @Inject
    private IUserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserModel userModel = FormUtil.toModel(UserModel.class, req);
        Pageble pageble = new PageRequest(userModel.getPage(), userModel.getMaxPageItem(),
                new Sorter(userModel.getSortName(), userModel.getSortBy()));
        userModel.setListResult(userService.findAll(pageble));
        userModel.setTotalItem(userService.getTotalItem());
        userModel.setTotalPage((int) Math.ceil((double) userModel.getTotalItem() / userModel.getMaxPageItem()));
        req.setAttribute(SystemConstant.MODEL, userModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/list.jsp");
        rd.forward(req, resp);


    }
}
