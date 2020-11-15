package com.myblog.controller.admin;

import com.myblog.constant.SystemConstant;
import com.myblog.model.CategoryModel;
import com.myblog.paging.PageRequest;
import com.myblog.paging.Pageble;
import com.myblog.service.ICategoryService;
import com.myblog.sort.Sorter;
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

@WebServlet(urlPatterns = {"/admin-category"})
public class CategoryController extends HttpServlet {

    private static final long serialVersionUID = -5698818484842857743L;

    @Inject
    private ICategoryService categoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, req);
        String views = "";

        if (categoryModel.getType().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageRequest(categoryModel.getPage(), categoryModel.getMaxPageItem(),
                    new Sorter(categoryModel.getSortName(), categoryModel.getSortBy()));
            categoryModel.setListResult(categoryService.findAll(pageble));
            categoryModel.setTotalItem(categoryService.getTotalItem());
            categoryModel.setTotalPage((int) Math.ceil((double) categoryModel.getTotalItem() / categoryModel.getMaxPageItem()));
            views = "/views/admin/category/list.jsp";
        } else if (categoryModel.getType().equals(SystemConstant.EDIT)) {
            if (categoryModel.getId() != null) {
                categoryModel = categoryService.findOne(categoryModel.getId());
            }
            views = "/views/admin/category/edit.jsp";
        }
        MessageUtil.showMessage(req);
        req.setAttribute(SystemConstant.MODEL, categoryModel);
        RequestDispatcher rd = req.getRequestDispatcher(views);
        rd.forward(req, resp);
    }
}
