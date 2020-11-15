package com.myblog.service.impl;


import com.myblog.dao.ICategoryDAO;
import com.myblog.dao.ICommentDAO;
import com.myblog.dao.INewDAO;
import com.myblog.model.CategoryModel;
import com.myblog.paging.Pageble;
import com.myblog.service.ICategoryService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class CategoryService implements ICategoryService {

    @Inject
    private ICategoryDAO categoryDAO;

    @Inject
    private ICommentDAO commentDAO;

    @Inject
    private INewDAO newDAO;

    @Override
    public List<CategoryModel> findAll(Pageble pageble) {
        return categoryDAO.findAll(pageble);
    }

    @Override
    public CategoryModel save(CategoryModel categoryModel) {
        categoryModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        Long categoryId = categoryDAO.save(categoryModel);
        return categoryDAO.findOne(categoryId);
    }

    @Override
    public CategoryModel update(CategoryModel updateModel) {
        CategoryModel oldCategory = categoryDAO.findOne(updateModel.getId());
        updateModel.setCreatedDate(oldCategory.getCreatedDate());
        updateModel.setCreatedBy(oldCategory.getCreatedBy());
        updateModel.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        categoryDAO.update(updateModel);
        return categoryDAO.findOne(updateModel.getId());
    }

    @Override
    public void delete(long[] ids) {
        for (long id : ids) {
            //1.delete comment (khoa ngoai new_id)
            //2.delete news (khoa ngoai category_id)
            //3.delete category
            categoryDAO.delete(id);
        }
    }

    @Override
    public int getTotalItem() {
        return categoryDAO.getTotalItem();
    }

    @Override
    public List<CategoryModel> findByCategoryId(Long categoryId) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public CategoryModel findOne(long id) {
        CategoryModel categoryModel = categoryDAO.findOne(id);
        return categoryModel;
    }

    @Override
    public List<CategoryModel> findAll() {
        return categoryDAO.findAll();
    }

}
