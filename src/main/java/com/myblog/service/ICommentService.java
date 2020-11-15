package com.myblog.service;

import com.myblog.model.CommentModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface ICommentService {

    CommentModel findOne(Long id);

    List<CommentModel> findByNewID(Long newId, Pageble pageble);

    CommentModel save(CommentModel commentModel);

    CommentModel update(CommentModel updateComment);

    void delete(long[] ids);

    List<CommentModel> findAll(Pageble pageble);

    int getTotalItem();

    void deleteByNewID(Long newId);

    int getTotalByNewID(Long newId);
}
