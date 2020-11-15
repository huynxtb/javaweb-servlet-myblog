package com.myblog.dao.impl;

import com.myblog.dao.INewDAO;
import com.myblog.mapper.NewMapper;
import com.myblog.model.NewModel;
import com.myblog.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class NewDAO extends AbstractDAO<NewModel> implements INewDAO {

    @Override
    public List<NewModel> findByCategoryId(Long categoryId) {
        String sql = "SELECT * FROM news WHERE categoryid = ?";
        return query(sql, new NewMapper(), categoryId);
    }

    @Override
    public Long save(NewModel newModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO news (title, content, views,");
        sql.append(" thumbnail, shortdescription, categoryid, createddate, createdby)");
        sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
        return insert(sql.toString(), newModel.getTitle(), newModel.getContent(), newModel.getViews(),
                newModel.getThumbnail(), newModel.getShortDescription(), newModel.getCategoryId(),
                newModel.getCreatedDate(), newModel.getCreatedBy());
    }

    @Override
    public NewModel findOne(Long id) {
        String sql = "SELECT * FROM news WHERE id = ?";
        List<NewModel> news = query(sql, new NewMapper(), id);
        return news.isEmpty() ? null : news.get(0);
    }

    @Override
    public void update(NewModel updateNew) {
        StringBuilder sql = new StringBuilder("UPDATE news SET title = ?, thumbnail = ?,");
        sql.append(" shortdescription = ?, content = ?, views = ?, categoryid = ?,");
        sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
        update(sql.toString(), updateNew.getTitle(), updateNew.getThumbnail(), updateNew.getShortDescription(),
                updateNew.getContent(), updateNew.getViews(), updateNew.getCategoryId(), updateNew.getCreatedDate(),
                updateNew.getCreatedBy(), updateNew.getModifiedDate(),
                updateNew.getModifiedBy(), updateNew.getId());
    }

    @Override
    public void delete(long id) {
        String sql = "DELETE FROM news WHERE id = ?";
        update(sql, id);
    }

    @Override
    public List<NewModel> findAll(Pageble pageble) {

        StringBuilder sql = new StringBuilder("SELECT * FROM news");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new NewMapper());
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM news";
        return count(sql);
    }

    @Override
    public int getTotalItemByCategoryID(Long categoryId) {
        String sql = "SELECT count(*) FROM news WHERE categoryid = ?";
        return count(sql, categoryId);
    }

    @Override
    public List<NewModel> findByCategoryCode(Pageble pageble, Long categoryId) {
        StringBuilder sql = new StringBuilder("SELECT * FROM news where categoryid = ?");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new NewMapper(), categoryId);
    }

    @Override
    public List<NewModel> search(Pageble pageble, String textSearch) {
        StringBuilder sql = new StringBuilder("SELECT * FROM news where match(content) against (?)");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new NewMapper(), textSearch);
    }

    @Override
    public int getTotalItemSearch(String textSearch) {
        String sql = "SELECT count(*) FROM news where match(content) against (?)";
        return count(sql, textSearch);
    }

    @Override
    public void updateViews(NewModel updateNew) {
        StringBuilder sql = new StringBuilder("UPDATE news SET title = ?, thumbnail = ?,");
        sql.append(" shortdescription = ?, content = ?, views = ?, categoryid = ?,");
        sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
        update(sql.toString(),updateNew.getTitle(), updateNew.getThumbnail(), updateNew.getShortDescription(),
                updateNew.getContent(), updateNew.getViews(), updateNew.getCategoryId(), updateNew.getCreatedDate(),
                updateNew.getCreatedBy(), updateNew.getModifiedDate(), updateNew.getModifiedBy(), updateNew.getId());
    }

}
