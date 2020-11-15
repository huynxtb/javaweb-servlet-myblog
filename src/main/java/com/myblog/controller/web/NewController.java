package com.myblog.controller.web;

import com.myblog.constant.SystemConstant;
import com.myblog.model.CategoryModel;
import com.myblog.model.CommentModel;
import com.myblog.model.NewModel;
import com.myblog.paging.PageRequest;
import com.myblog.paging.Pageble;
import com.myblog.service.ICategoryService;
import com.myblog.service.ICommentService;
import com.myblog.service.INewService;
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

@WebServlet(urlPatterns = {"/home-new"})
public class NewController extends HttpServlet {

    private static final long serialVersionUID = 2686801510274002166L;

    @Inject
    private INewService newService;

    @Inject
    private ICategoryService categoryService;

    @Inject
    private ICommentService commentService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewModel model = FormUtil.toModel(NewModel.class, request);
        CategoryModel categoryModel = FormUtil.toModel(CategoryModel.class, request);
        CommentModel commentModel = FormUtil.toModel(CommentModel.class, request);
        String view = "";
        if (model.getType().equals(SystemConstant.LIST)) {
            Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
                    new Sorter(model.getSortName(), model.getSortBy()));
            model.setListResult(newService.findAll(pageble));
            model.setTotalItem(newService.getTotalItem());
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            view = "/views/web/new/list.jsp";
        } else if (model.getType().equals(SystemConstant.DETAIL)) {
            model = newService.findOne(model.getId());
            model = newService.updateViews(model);
            request.setAttribute("categories", categoryService.findAll());
            Pageble pageble = new PageRequest(commentModel.getPage(), commentModel.getMaxPageItem(),
                    new Sorter(commentModel.getSortName(), commentModel.getSortBy()));
            commentModel.setListResult(commentService.findByNewID(model.getId(), pageble));
            commentModel.setTotalItem(commentService.getTotalByNewID(model.getId()));
            commentModel.setTotalPage((int) Math.ceil((double) commentModel.getTotalItem() / commentModel.getMaxPageItem()));
            request.setAttribute("commentss", commentModel);
            view = "/views/web/new/detail.jsp";
        } else if (model.getType().equals(SystemConstant.LIST_BY_CATEGORY_CODE)) {
            Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
                    new Sorter(model.getSortName(), model.getSortBy()));
            model.setListResult(newService.findByCategoryCode(pageble, categoryModel.getId())); // Fix request category code
            model.setTotalItem(newService.getTotalItemByCategoryID(categoryModel.getId()));
            model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));
            view = "/views/web/new/listByCode.jsp";
        }
        MessageUtil.showMessage(request);
        request.setAttribute(SystemConstant.MODEL, model);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);

    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        NewModel model = FormUtil.toModel(NewModel.class, request);
//    }
}
