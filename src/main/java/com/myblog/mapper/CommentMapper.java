package com.myblog.mapper;

import com.myblog.model.CommentModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentMapper implements RowMapper<CommentModel> {
    @Override
    public CommentModel mapRow(ResultSet resultSet) {

        try {

            CommentModel comments = new CommentModel();
            comments.setId(resultSet.getLong("id"));
            comments.setContent(resultSet.getString("content"));
            comments.setUserId(resultSet.getLong("user_id"));
            comments.setNewId(resultSet.getLong("new_id"));
            comments.setCreatedDate(resultSet.getTimestamp("createddate"));
            comments.setCreatedBy(resultSet.getString("createdby"));
            if (resultSet.getTimestamp("modifieddate") != null) {
                comments.setModifiedDate(resultSet.getTimestamp("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null) {
                comments.setModifiedBy(resultSet.getString("modifiedby"));
            }
            return comments;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
