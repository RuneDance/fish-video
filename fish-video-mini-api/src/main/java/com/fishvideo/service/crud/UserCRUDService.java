package com.fishvideo.service.crud;

import com.fishvideo.pojo.Users;

public interface UserCRUDService {


    void saveUser(Users user);


    void updateUser(Users user);

    void updateUserExample(Users user);

    void delete();
}
