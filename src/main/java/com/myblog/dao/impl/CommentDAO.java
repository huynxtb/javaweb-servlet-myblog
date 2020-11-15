package com.myblog.dao.impl;

import com.myblog.dao.ICommentDAO;
import com.myblog.mapper.CommentMapper;
import com.myblog.model.CommentModel;
import com.myblog.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class CommentDAO extends AbstractDAO<CommentModel> implements ICommentDAO {

    @Override
    public CommentModel findOne(Long id) {
        String sql = "SELECT * FROM comment WHERE id = ?";
        List<CommentModel> comments = query(sql, new CommentMapper(), id);
        return comments.isEmpty() ? null : comments.get(0);
    }

    @Override
    public Long save(CommentModel commentModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO comment (content, user_id,");
        sql.append(" new_id, createddate, createdby)");
        sql.append(" VALUES(?, ?, ?, ?, ?)");
        return insert(sql.toString(), commentModel.getContent(), commentModel.getUserId(), commentModel.getNewId(), commentModel.getCreatedDate(), commentModel.getCreatedBy());
    }

    @Override
    public void update(CommentModel commentModel) {
        StringBuilder sql = new StringBuilder("UPDATE comment SET content = ?, user_id = ?,");
        sql.append(" new_id = ?, createddate = ?, modifieddate = ?,");
        sql.append(" createdby = ?, modifiedby = ? WHERE id = ?");
        update(sql.toString(), commentModel.getContent(), commentModel.getUserId(), commentModel.getNewId(),
                commentModel.getCreatedDate(), commentModel.getModifiedDate(),
                commentModel.getCreatedBy(), commentModel.getModifiedBy(), commentModel.getId());
    }

    @Override
    public void delete(long id) {
        String sql = "DELETE FROM comment WHERE id = ?";
        update(sql, id);

    }

    @Override
    public List<CommentModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM comment");
        if (pageble.getSorter() != null) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new CommentMapper());
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM comment";
        return count(sql);
    }

    @Override
    public List<CommentModel> findByNewID(Long newId, Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM comment WHERE new_id = ?");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new CommentMapper(), newId);
    }

    @Override
    public void deleteByNewID(long newId) {
        String sql = "DELETE FROM comment WHERE new_id = ?";
        update(sql, newId);
    }

    @Override
    public void deleteByUserID(long userId) {
        // TODO Auto-generated method stub

    }

    @Override
    public int getTotalByNewID(Long newId) {
        String sql = "SELECT count(*) FROM comment WHERE new_id = ?";
        return count(sql, newId);
    }
}
