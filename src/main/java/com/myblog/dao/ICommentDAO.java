package com.myblog.dao;

import com.myblog.model.CommentModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface ICommentDAO extends GenericDAO<CommentModel> {

    CommentModel findOne(Long id);

    List<CommentModel> findByNewID(Long newId, Pageble pageble);

    Long save(CommentModel commentModel);

    void update(CommentModel updateComment);

    void delete(long id);

    List<CommentModel> findAll(Pageble pageble);

    int getTotalItem();

    void deleteByNewID(long newId);

    void deleteByUserID(long userId);

    int getTotalByNewID(Long newId);

}
