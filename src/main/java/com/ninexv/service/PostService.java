package com.ninexv.service;

import com.ninexv.domain.Comments;
import com.ninexv.domain.Movie;
import com.ninexv.domain.Post;

import java.util.List;

public interface PostService {

    public List<Post> findPost();

    public int addNice(int id);

    public int findNice(int id);

    public Post findPostByPid(int pid);

    public void addComment(Comments comments);

    public List<Comments> findComments(int pid);

    public Movie findMovieByName(String name);

    public List<Post> findPostByMid(int mid);

    public void sendPost(Post post);

    public void deletePost(int pid);
}
