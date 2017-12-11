package com.litesky.service.impl;

import com.litesky.dao.UserDao;
import com.litesky.model.User;
import com.litesky.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by finefine.com on 2017/12/11.
 */
@Service
public class UserSericeImpl implements UserService{

    @Autowired
    UserDao userDao;

    @Override
    public User save(User user) {
        return userDao.save(user);
    }
}
