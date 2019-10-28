package com.ninexv.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ninexv.domain.Comments;
import com.ninexv.domain.Movie;
import com.ninexv.domain.Post;
import com.ninexv.domain.User;
import com.ninexv.service.PostService;
import com.ninexv.utils.JsonDateValueProcessor;
import com.ninexv.utils.UUIDUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/***
 * 使用@RestController注解可以不让控制器返回String时自动跳转
 */
@RestController
@RequestMapping("/post")
@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
public class PostController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "/findPost",produces = "text/html;charset=UTF-8")
    public String findPost(){
        List<Post> posts = postService.findPost();
        System.out.println(posts);
        //接下来需要使用工具类将json中的date类型转换，否则传递的就是数组
        JsonConfig config = new JsonConfig();
        config.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
        JSONArray js  = JSONArray.fromObject(posts, config);//loadAll是我需要转换成jsonArray的数据，
        System.out.println(js.toString());
        return js.toString();
    }

    @RequestMapping(value = "/addNice",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addNice(@RequestBody String pid){
        String[] parts = pid.split(":");
        String[] parts2 = parts[1].split("}");
        int id = Integer.parseInt(parts2[0]);
        postService.addNice(id);
        return findPost();
    }

    @RequestMapping(value = "/findPostByPid",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findPostByPid(@RequestBody String pid){
        System.out.println("成功"+pid);
        int id = Integer.parseInt(pid);
        Post post = postService.findPostByPid(id);
        JsonConfig config = new JsonConfig();
        config.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
        JSONArray js  = JSONArray.fromObject(post, config);//loadAll是我需要转换成jsonArray的数据，
        System.out.println(js.toString());
        return js.toString();
    }


    @RequestMapping("/addReply")
    @ResponseBody
    public String addReply(HttpServletRequest request,
                           @RequestBody Comments comments){
        HttpSession session = request.getSession();
        User user1 = (User) session.getAttribute("user");
        if (user1.getActive() == 0)
        {
            return "";
        }
        comments.setId(user1.getId());
        comments.setName(user1.getUsername());
        Date date = new Date();
        comments.setCdate(date);
        comments.setCid(UUIDUtils.getUUID());
        System.out.println(comments);

        postService.addComment(comments);
        return "1";
    }

    @RequestMapping(value = "/findComments",produces = "text/html;charset=UTF-8")
    public String findCommets(@RequestBody String pid){
        int id = Integer.parseInt(pid);
        List<Comments> comments = postService.findComments(id);
        System.out.println(comments);
        //接下来需要使用工具类将json中的date类型转换，否则传递的就是数组
        JsonConfig config = new JsonConfig();
        config.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
        JSONArray js  = JSONArray.fromObject(comments, config);//loadAll是我需要转换成jsonArray的数据，
        System.out.println(js.toString());
        return js.toString();
    }

    @RequestMapping(value = "/findPostByName",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String findPostByName(@RequestBody String movie){
        System.out.println(movie);
        String[] parts = movie.split("\"");
        System.out.println(parts[3]);
        Movie movies = postService.findMovieByName(parts[3]);
        List<Post> posts = postService.findPostByMid(movies.getMid());
        JsonConfig config = new JsonConfig();
        config.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
        JSONArray js  = JSONArray.fromObject(posts, config);//loadAll是我需要转换成jsonArray的数据，
        System.out.println(js.toString());
        return js.toString();
    }

    @RequestMapping(value = "/sendPost",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String sendPost(HttpServletRequest request,
                           @RequestBody Post post){

        HttpSession session = request.getSession();
        User user1 = (User) session.getAttribute("user");
        System.out.println("查询"+user1);
        if (user1.getActive() == 0)
        {
            return "";
        }
//        Movie movie = postService.findMovieByName(post.getMovieName());
//        post.setMid(movie.getMid());
        post.setId(user1.getId());
        post.setPname(user1.getUsername());
        post.setPdate(new Date());
        System.out.println(post);
        postService.sendPost(post);
        return "1";

    }

    @RequestMapping(value = "/deletePost",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String deletePost(@RequestBody String pid){
        System.out.println(pid);
        String[] parts = pid.split(":");
        String[] parts2 = parts[1].split("}");
        int id = Integer.parseInt(parts2[0]);
        System.out.println(id);
        postService.deletePost(id);
        return "1";
    }
}
