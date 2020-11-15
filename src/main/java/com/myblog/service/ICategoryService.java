package com.myblog.service;


import com.myblog.model.CategoryModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface ICategoryService {
    List<CategoryModel> findByCategoryId(Long categoryId);

    CategoryModel save(CategoryModel categoryModel);

    CategoryModel update(CategoryModel categoryModel);

    void delete(long[] ids);

    List<CategoryModel> findAll(Pageble pageble);

    int getTotalItem();

    CategoryModel findOne(long id);

    List<CategoryModel> findAll();
}
