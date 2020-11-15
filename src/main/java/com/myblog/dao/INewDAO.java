package com.myblog.dao;


import com.myblog.model.NewModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface INewDAO extends GenericDAO<NewModel> {

    NewModel findOne(Long id);

    List<NewModel> findByCategoryId(Long categoryId);

    Long save(NewModel newModel);

    void update(NewModel updateNew);

    void delete(long id);

    List<NewModel> findAll(Pageble pageble);

    int getTotalItem();

    int getTotalItemByCategoryID(Long categoryId);

    List<NewModel> findByCategoryCode(Pageble pageble, Long categoryId);

    List<NewModel> search(Pageble pageble, String textSearch);

    int getTotalItemSearch(String textSearch);

    void updateViews(NewModel updateNew);

}
