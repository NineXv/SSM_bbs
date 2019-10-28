package com.ninexv.service.impl;

import com.ninexv.dao.PostDao;
import com.ninexv.domain.Comments;
import com.ninexv.domain.Movie;
import com.ninexv.domain.Post;
import com.ninexv.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("PostService")
@Transactional
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;
    @Override
    public List<Post> findPost() {
        List<Post> posts = postDao.findPost();
        return posts;
    }

    @Override
    public int addNice(int pid) {
        postDao.addNice(pid);
        return postDao.findNice(pid);
    }

    @Override
    public int findNice(int pid) {
        return postDao.findNice(pid);
    }

    @Override
    public Post findPostByPid(int pid) {
        return postDao.findPostByPid(pid);
    }

    @Override
    public void addComment(Comments comments) {
        postDao.addComment(comments);
    }

    @Override
    public List<Comments> findComments(int pid) {
        return postDao.findComment(pid);
    }

    @Override
    public Movie findMovieByName(String name){
        return postDao.findMovieByName(name);
    }

    @Override
    public List<Post> findPostByMid(int mid){
        return postDao.findPostByMid(mid);
    }

    @Override
    public void sendPost(Post post) {
        postDao.SavePost(post);
    }

    @Override
    public void deletePost(int pid) {
        postDao.deletePost(pid);
    }
}
