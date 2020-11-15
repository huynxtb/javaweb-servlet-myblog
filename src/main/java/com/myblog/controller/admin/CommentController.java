package com.myblog.controller.admin;

import com.myblog.constant.SystemConstant;
import com.myblog.model.CommentModel;
import com.myblog.paging.PageRequest;
import com.myblog.paging.Pageble;
import com.myblog.service.ICommentService;
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

@WebServlet(urlPatterns = {"/admin-comment"})
public class CommentController extends HttpServlet {

    @Inject
    private ICommentService commentService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CommentModel commentModel = FormUtil.toModel(CommentModel.class, req);
        Pageble pageble = new PageRequest(commentModel.getPage(), commentModel.getMaxPageItem(),
                new Sorter(commentModel.getSortName(), commentModel.getSortBy()));
        commentModel.setListResult(commentService.findAll(pageble));
        commentModel.setTotalItem(commentService.getTotalItem());
        commentModel.setTotalPage((int) Math.ceil((double) commentModel.getTotalItem() / commentModel.getMaxPageItem()));
        req.setAttribute(SystemConstant.MODEL, commentModel);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/comment/list.jsp");
        rd.forward(req, resp);
    }
}