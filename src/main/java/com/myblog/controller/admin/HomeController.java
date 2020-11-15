package com.myblog.controller.admin;

import com.myblog.constant.SystemConstant;
import com.myblog.model.CategoryModel;
import com.myblog.model.CommentModel;
import com.myblog.model.NewModel;
import com.myblog.model.UserModel;
import com.myblog.service.ICategoryService;
import com.myblog.service.ICommentService;
import com.myblog.service.INewService;
import com.myblog.service.IUserService;
import com.myblog.utils.FormUtil;
import com.myblog.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {

    private static final long serialVersionUID = 2686801510274002166L;

    @Inject
    private INewService newService;

    @Inject
    private ICategoryService categoryService;

    @Inject
    private ICommentService commentService;

    @Inject
    private IUserService userService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String view = "";

        NewModel newModel = FormUtil.toModel(NewModel.class, request);
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, request);
        CommentModel cmmentModel = FormUtil.toModel(CommentModel.class, request);
        UserModel userModel = FormUtil.toModel(UserModel.class, request);

        newModel.setTotalItem(newService.getTotalItem());
        categoryModel.setTotalItem(categoryService.getTotalItem());
        cmmentModel.setTotalItem(commentService.getTotalItem());
        userModel.setTotalItem(userService.getTotalItem());

        request.setAttribute(SystemConstant.MODEL, newModel);
        request.setAttribute("categorys", categoryModel);
        request.setAttribute("comments", cmmentModel);
        request.setAttribute("users", userModel);

        if (action != null && action.equals(SystemConstant.UPDATE_PROFILE)) {
            MessageUtil.showMessage(request);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/edit.jsp");
            rd.forward(request, response);
        } else {
            MessageUtil.showMessage(request);
            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
            rd.forward(request, response);
        }
    }
}
