package com.ninexv.dao;

import com.ninexv.domain.Comments;
import com.ninexv.domain.Movie;
import com.ninexv.domain.Post;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostDao {

    @Select("SELECT * FROM post ORDER BY pdate DESC,pid DESC")
    public List<Post> findPost();

    @Update("UPDATE post SET  nice = nice +1 WHERE pid = #{pid}")
    public void addNice(int pid);

    @Select("select nice from post where pid = #{pid}")
    public int findNice(int pid);

    @Select("select * from post where pid = #{pid}")
    public Post findPostByPid(int pid);

    @Insert("insert into comments (cid,id,pid,name,content,cdate) values (#{cid},#{id},#{pid},#{name},#{content},#{cdate})")
    public void addComment(Comments comments);

    @Select("SELECT * FROM comments WHERE pid = #{pid} ORDER BY cdate DESC,cid DESC ")
    public List<Comments> findComment(int pid);

    @Select("SELECT * FROM movie WHERE name = #{name}")
    public Movie findMovieByName(String name);

    @Select("SELECT * FROM post WHERE mid = #{mid} ORDER BY pdate DESC,pid DESC")
    public List<Post> findPostByMid(int mid);

    @Insert("insert into post (id,mname,pname,pcontent,pdate) " +
            "values (#{id},#{mname},#{pname},#{pcontent},#{pdate})")
    public void SavePost(Post post);

    @Delete("Delete FROM post WHERE pid = #{pid}")
    public void deletePost(int pid);
}
