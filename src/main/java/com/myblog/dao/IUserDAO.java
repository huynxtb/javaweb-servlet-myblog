package com.myblog.dao;


import com.myblog.model.UserModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface IUserDAO extends GenericDAO<UserModel> {
    UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);

    UserModel findByUserName(String userName);

    UserModel findOne(Long id);

    Long save(UserModel userModel);

    void update(UserModel updateUser);

    void delete(UserModel deleteUser);

    List<UserModel> findAll(Pageble pageble);

    int getTotalItem();
}
