package com.myblog.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.myblog.model.CategoryModel;
import com.myblog.model.UserModel;
import com.myblog.service.ICategoryService;
import com.myblog.utils.HttpUtil;
import com.myblog.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-admin-category"})
public class CategoryAPI extends HttpServlet {

    private static final long serialVersionUID = 5530094664155294180L;

    @Inject
    private ICategoryService categoryService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CategoryModel categoryModel = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        categoryModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getUserName());
        categoryModel = categoryService.save(categoryModel);
        System.out.println(categoryModel);
        mapper.writeValue(resp.getOutputStream(), categoryModel);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CategoryModel updateCategory = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        updateCategory.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getUserName());
        updateCategory = categoryService.update(updateCategory);
        System.out.println(updateCategory);
        mapper.writeValue(resp.getOutputStream(), updateCategory);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper ob = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CategoryModel categoryModel = HttpUtil.of(req.getReader()).toModel(CategoryModel.class);
        categoryService.delete(categoryModel.getIds());
        ob.writeValue(resp.getOutputStream(), "{}");
    }
}
