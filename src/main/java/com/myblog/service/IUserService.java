package com.myblog.service;


import com.myblog.model.UserModel;
import com.myblog.paging.Pageble;

import java.util.List;

public interface IUserService {
    UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);

    UserModel findByUserName(String userName);

    UserModel findOne(Long id);

    UserModel save(UserModel userModel);

    UserModel update(UserModel updateUser);

    UserModel delete(UserModel deleteUser);

    List<UserModel> findAll(Pageble pageble);

    int getTotalItem();
}
