package com.ninexv.dao;

import com.ninexv.domain.RootKey;
import com.ninexv.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    @Insert("insert into user (id,username,password,resume,email,company,job,active,role)" +
            " values (#{id},#{username},#{password},#{resume},#{email},#{company},#{job},#{active},#{role})")
    public void saveUser(User user );


    @Select("select * from user where username = #{username}")
    public User findUserByName(String username);


    @Select("select * from user")
    public List<User> findAll();

    @Select("select * from user where id = #{id}")
    public User findUserById(String id);

    @Update("UPDATE user SET active = 1 WHERE id = #{active}")
    public void updateUserActive(String id);


    @Select("select * from rootKey where rkey = #{key}")
    public RootKey findKey(String key);
}
