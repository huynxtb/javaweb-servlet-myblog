package com.myblog.service.impl;

import com.myblog.dao.ICommentDAO;
import com.myblog.model.CommentModel;
import com.myblog.paging.Pageble;
import com.myblog.service.ICommentService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class CommentService implements ICommentService {

    @Inject
    private ICommentDAO commentDAO;

    @Override
    public List<CommentModel> findByNewID(Long newId, Pageble pageble) {
        return commentDAO.findByNewID(newId, pageble);
    }

    @Override
    public CommentModel save(CommentModel commentModel) {
        commentModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        Long commentId = commentDAO.save(commentModel);
        return commentDAO.findOne(commentId);
    }

    @Override
    public CommentModel update(CommentModel updateComment) {
        CommentModel oldComment = commentDAO.findOne(updateComment.getId());
        updateComment.setCreatedDate(oldComment.getCreatedDate());
        updateComment.setCreatedBy(oldComment.getCreatedBy());
        updateComment.setUserId(oldComment.getUserId());
        updateComment.setNewId(oldComment.getNewId());
        updateComment.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        commentDAO.update(updateComment);
        return commentDAO.findOne(updateComment.getId());

    }

    @Override
    public List<CommentModel> findAll(Pageble pageble) {
        return commentDAO.findAll(pageble);
    }

    @Override
    public int getTotalItem() {
        return commentDAO.getTotalItem();
    }

    @Override
    public void deleteByNewID(Long newId) {
        commentDAO.delete(newId);
    }

    @Override
    public int getTotalByNewID(Long newId) {
        return commentDAO.getTotalByNewID(newId);
    }

    @Override
    public CommentModel findOne(Long id) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public void delete(long[] ids) {
        // TODO Auto-generated method stub

    }

}
