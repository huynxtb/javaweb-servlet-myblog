package com.myblog.dao.impl;


import com.myblog.dao.ICategoryDAO;
import com.myblog.mapper.CategoryMapper;
import com.myblog.model.CategoryModel;
import com.myblog.paging.Pageble;

import java.util.List;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

    @Override
    public List<CategoryModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM category");
        if (pageble.getSorter() != null) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortName() + " " + pageble.getSorter().getSortBy() + "");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT " + pageble.getOffset() + ", " + pageble.getLimit() + "");
        }
        return query(sql.toString(), new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(Long id) {
        String sql = "SELECT * FROM category WHERE id = ?";
        List<CategoryModel> category = query(sql, new CategoryMapper(), id);
        return category.isEmpty() ? null : category.get(0);
    }


    @Override
    public CategoryModel findOneByCode(String code) {
        String sql = "SELECT * FROM category WHERE code = ?";
        List<CategoryModel> category = query(sql, new CategoryMapper(), code);
        return category.isEmpty() ? null : category.get(0);
    }

    @Override
    public void update(CategoryModel updateCategory) {

        StringBuilder sql = new StringBuilder("UPDATE category SET name = ?, code = ?,");
        sql.append(" createddate = ?, modifieddate = ?, createdby = ?,");
        sql.append(" modifiedby = ? WHERE id = ?");
        update(sql.toString(), updateCategory.getName(), updateCategory.getCode(), updateCategory.getCreatedDate(),
                updateCategory.getModifiedDate(), updateCategory.getCreatedBy(), updateCategory.getModifiedBy(), updateCategory.getId());

    }

    @Override
    public void delete(long id) {
        String sql = "DELETE FROM category WHERE id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM category";
        return count(sql);
    }

    @Override
    public Long save(CategoryModel categoryModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO category (name, code,");
        sql.append(" createddate, createdby)");
        sql.append(" VALUES(?, ?, ?, ?)");
        return insert(sql.toString(), categoryModel.getName(), categoryModel.getCode(), categoryModel.getCreatedDate(), categoryModel.getCreatedBy());
    }

    @Override
    public List<CategoryModel> findAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

}
