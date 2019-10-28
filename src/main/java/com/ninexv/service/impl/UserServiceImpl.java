package com.ninexv.service.impl;

import com.ninexv.dao.UserDao;
import com.ninexv.domain.RootKey;
import com.ninexv.domain.User;
import com.ninexv.service.UserService;
import com.ninexv.utils.DeleteFile;
import com.ninexv.utils.MailUtil;
import com.ninexv.utils.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import java.util.List;

@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    public void findAll(){
        List<User> user = userDao.findAll();
        for (User user1 :user){
            System.out.println(user);
        }

    }

    public String saveUser(User user ) {
        String name = user.getUsername();
        User user1 = findUserByName(name);
        if ((user1) != null)
        {
             return "用户名重复";
        }
        String se = UUIDUtils.getUUID();
        user.setId(se);
        try {
            System.out.println(user);
            userDao.saveUser(user);
        }catch (Exception e){
//            DeleteFile deleteFile = new DeleteFile();
//            deleteFile.deleteFailedUser(user.getResume());
            e.printStackTrace();
        }
        // 给注册的用户发邮件
        String email= user.getEmail();
        String emailMsg=
                "注册验证,为避免浏览器拦截，请复制链接后另外点开，放心，我是好人！" +
                        "请 <a href = http://148.70.145.95/user/validation?identity=recruiters&code="+user.getId()+"> 点击激活"+"</a>";
        try {
            MailUtil.sendMail(email, emailMsg);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "OK";
    }

    public User findUserByName(String username) {
        User user = userDao.findUserByName(username);
        System.out.println("查询成功"+user);
        return user;
    }

    @Override
    public Boolean findKey(String key) {
        RootKey rootKey = userDao.findKey(key);
        System.out.println(rootKey);
        if (rootKey != null){
            return true;
        }
        return false;
    }

    public String activeUser(String id){
        User user = userDao.findUserById(id);
        if (user.getActive() != 0){
            return "error";
        }
        else {
            userDao.updateUserActive(id);
            return "success";
        }
    }

}
