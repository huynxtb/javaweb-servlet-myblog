package com.myblog.dao;


import com.myblog.model.CategoryModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
    // CategoryModel findOne(long id);

    List<CategoryModel> findAll(Pageble pageble);

    CategoryModel findOne(Long id);

    CategoryModel findOneByCode(String code);

    void update(CategoryModel updateCategory);

    void delete(long id);

    int getTotalItem();

    Long save(CategoryModel categoryModel);

    List<CategoryModel> findAll();
}
