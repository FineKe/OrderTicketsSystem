package com.litesky.dao;

import com.litesky.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by finefine.com on 2017/12/11.
 */

public interface UserDao extends CrudRepository<User,Long> {

    User findByUsername(String username);
}
