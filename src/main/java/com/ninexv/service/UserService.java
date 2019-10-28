package com.ninexv.service;


import com.ninexv.domain.User;

public interface UserService {

    public void findAll();

    public String saveUser(User user );

    public String activeUser(String id);

    public User findUserByName(String username);

    public Boolean findKey(String key);
}
