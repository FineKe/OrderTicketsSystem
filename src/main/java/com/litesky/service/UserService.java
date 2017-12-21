package com.litesky.service;

import com.litesky.model.User;

/**
 * Created by finefine.com on 2017/12/11.
 */
public interface UserService {
    public User save(User user);

    public User findByUsername(String username);
}
