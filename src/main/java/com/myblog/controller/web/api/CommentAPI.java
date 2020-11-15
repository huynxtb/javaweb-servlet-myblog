package com.myblog.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.myblog.model.CommentModel;
import com.myblog.model.NewModel;
import com.myblog.model.UserModel;
import com.myblog.service.ICommentService;
import com.myblog.service.INewService;
import com.myblog.utils.CheckComment;
import com.myblog.utils.HttpUtil;
import com.myblog.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/api-web-comment"})
public class CommentAPI extends HttpServlet {

    private static final long serialVersionUID = 8753209695160730519L;

    @Inject
    private ICommentService commentService;

    @Inject
    private INewService newService;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper ob = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CommentModel commentModel = HttpUtil.of(req.getReader()).toModel(CommentModel.class);
        NewModel newModel = HttpUtil.of(req.getReader()).toModel(NewModel.class);
        commentModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getUserName());
        commentModel.setUserId(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getId());
        commentModel.setContent(CheckComment.invalidCmt(commentModel.getContent()));
        commentModel = commentService.save(commentModel);
        System.out.println(commentModel);
        ob.writeValue(resp.getOutputStream(), commentModel);

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper ob = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CommentModel updateComment = HttpUtil.of(req.getReader()).toModel(CommentModel.class);
        updateComment.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(req, "USERMODEL")).getFullName());
        // viết logic lấy id bài viết đang đứng và
        updateComment = commentService.update(updateComment);
        System.out.println(updateComment);
        ob.writeValue(resp.getOutputStream(), updateComment);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ObjectMapper ob = new ObjectMapper();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        CommentModel deleteComment = HttpUtil.of(req.getReader()).toModel(CommentModel.class);
//		deleteComment = commentService.delete();
    }
}
