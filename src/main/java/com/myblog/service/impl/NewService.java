package com.myblog.service.impl;


import com.myblog.dao.ICategoryDAO;
import com.myblog.dao.INewDAO;
import com.myblog.model.CategoryModel;
import com.myblog.model.NewModel;
import com.myblog.paging.Pageble;
import com.myblog.service.INewService;

import javax.inject.Inject;
import java.sql.Timestamp;
import java.util.List;

public class NewService implements INewService {

    @Inject
    private INewDAO newDao;

    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<NewModel> findByCategoryId(Long categoryId) {
        return newDao.findByCategoryId(categoryId);
    }

    @Override
    public NewModel save(NewModel newModel) {
        newModel.setViews(0L);
        newModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        CategoryModel category = categoryDAO.findOneByCode(newModel.getCategoryCode());
        newModel.setCategoryId(category.getId());
        Long newId = newDao.save(newModel);
        return newDao.findOne(newId);
    }

    @Override
    public NewModel update(NewModel updateNew) {
        NewModel oldNew = newDao.findOne(updateNew.getId());
        updateNew.setViews(oldNew.getViews());
        updateNew.setCreatedDate(oldNew.getCreatedDate());
        updateNew.setCreatedBy(oldNew.getCreatedBy());
        updateNew.setModifiedDate(new Timestamp(System.currentTimeMillis()));
        CategoryModel category = categoryDAO.findOneByCode(updateNew.getCategoryCode());
        updateNew.setCategoryId(category.getId());
        newDao.update(updateNew);
        return newDao.findOne(updateNew.getId());
    }

    @Override
    public void delete(long[] ids) {
        for (long id : ids) {
            newDao.delete(id);
        }
    }

    @Override
    public List<NewModel> findAll(Pageble pageble) {
        return newDao.findAll(pageble);
    }

    @Override
    public int getTotalItem() {
        return newDao.getTotalItem();
    }

    @Override
    public int getTotalItemByCategoryID(Long categoryId) {
        return newDao.getTotalItemByCategoryID(categoryId);
    }

    @Override
    public NewModel findOne(long id) {
        NewModel newModel = newDao.findOne(id);
        CategoryModel categoryModel = categoryDAO.findOne(newModel.getCategoryId());
        newModel.setCategoryCode(categoryModel.getCode());
        return newModel;
    }

    @Override
    public List<NewModel> findByCategoryCode(Pageble pageble, Long categoryId) {
        return newDao.findByCategoryCode(pageble, categoryId);
    }

    @Override
    public List<NewModel> search(Pageble pageble, String textSearch) {
        return newDao.search(pageble, textSearch);
    }

    @Override
    public int getTotalItemSearch(String textSearch) {
        return newDao.getTotalItemSearch(textSearch);
    }

    @Override
    public NewModel updateViews(NewModel updateNew) {
        NewModel oldNew = newDao.findOne(updateNew.getId());
        updateNew.setTitle(oldNew.getTitle());
        updateNew.setThumbnail(oldNew.getThumbnail());
        updateNew.setShortDescription(oldNew.getShortDescription());
        updateNew.setContent(oldNew.getContent());
        updateNew.setCategoryId(oldNew.getCategoryId());
        updateNew.setCreatedDate(oldNew.getCreatedDate());
        updateNew.setModifiedDate((oldNew.getModifiedDate()));
        updateNew.setCreatedBy(oldNew.getCreatedBy());
        updateNew.setModifiedBy(oldNew.getModifiedBy());
        updateNew.setViews(oldNew.getViews()+1L);
        newDao.updateViews(updateNew);
        return newDao.findOne(updateNew.getId());
    }
}
