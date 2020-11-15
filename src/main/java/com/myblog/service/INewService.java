package com.myblog.service;

import com.myblog.model.NewModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface INewService {
    List<NewModel> findByCategoryId(Long categoryId);

    NewModel save(NewModel newModel);

    NewModel update(NewModel updateNew);

    void delete(long[] ids);

    List<NewModel> findAll(Pageble pageble);

    int getTotalItem();

    int getTotalItemByCategoryID(Long categoryId);

    NewModel findOne(long id);

    List<NewModel> findByCategoryCode(Pageble pageble, Long categoryId);

    List<NewModel> search(Pageble pageble, String textSearch);

    int getTotalItemSearch(String textSearch);

    NewModel updateViews(NewModel updateNew);
}
