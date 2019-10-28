package com.ninexv.controller;

import com.ninexv.domain.User;
import com.ninexv.service.UserService;
import com.ninexv.utils.DeleteFile;

import com.ninexv.utils.JedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import redis.clients.jedis.Jedis;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/***
 * 管理人员注册和登陆的控制器
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    public UserService userService;

    /***
     * 测试
     */
    @RequestMapping("findUser")
    public @ResponseBody User findUser(HttpServletRequest request){
        HttpSession session = request.getSession();
        // 从session中获取用户
        User user1 =(User)session.getAttribute("user");
        System.out.println("session"+user1);
        return user1;
    }


    @RequestMapping("/saveUser")
    @ResponseBody
    public String saveApplicant(User user ,
                                HttpServletRequest request
                                 ) throws IOException{
        //@RequestParam(value="file", required = false)MultipartFile upload
        if (user.getRole().equals("root")){
            if (!userService.findKey(user.getRkey())){
                return "";
            }
        }
//
//        //上传的位置
//        String path = request.getSession().getServletContext().getRealPath("/uploads/");
//        //判断路径是否存在
//        File file = new File(path);
//        if (!file.exists()){
//            file.mkdir();
//        }
//        // 说明上传文件项
//        // 获取上传文件的名称
//        String filename = upload.getOriginalFilename();
//        // 把文件的名称设置唯一值，uuid
//        String uuid = UUID.randomUUID().toString().replace("-", "");
//        filename = uuid+"_"+filename;
//        // 完成文件上传
//        upload.transferTo(new File(path,filename));
//        // 自动删除临时文件
//        //保存路径
//        user.setResume(path+""+filename);

        System.out.println(user.toString());
        //调用service
        String s = userService.saveUser(user);
        if (s.equals("用户名重复")){
            System.out.println("控制层判断"+user.getUsername()+"用户名重复");
            DeleteFile deleteFile = new DeleteFile();
            deleteFile.deleteFailedUser(user.getResume());
            return "0";
        }
        return "1";
    }


    @RequestMapping("/login")
    public String login(HttpServletRequest request,
                        HttpServletResponse response,
                        @RequestParam("username") String username,
                        @RequestParam("password") String password
                        ){
        //
        Jedis jedis = JedisUtils.getJedis();

        System.out.println("登陆");
        try {
            //
            HttpSession session = request.getSession();
            // 从session中获取用户
            User user1 =(User)session.getAttribute("user");
            System.out.println("session"+user1);
            // 判断用户是否存在
            if(user1!=null)
            {
                String p = jedis.get(username);
                System.out.println(p);
                if (p != null){
                    if (p.equals(user1.getPassword())) {
                        return "main";
                    }
                }
            }
            //
            User user = userService.findUserByName(username);
            if (user != null){
                if (user.getPassword().equals(password))
                {
                    System.out.println("登陆成功"+user);
                    session = request.getSession();
                    session.setAttribute("user", user);
                    jedis.set(username,password);
                    return "main";
                }
            }
            return "error";
        }finally {
            jedis.close();
        }
    }

    @RequestMapping("/validation")
    public String validation(
            @RequestParam("identity") String identity,
            @RequestParam("code") String code){
        System.out.println("激活验证 "+code);
        String s = userService.activeUser(code);
        return s;
    }

    @RequestMapping("/exit")
    public String exit(ServletRequest req, ServletResponse response){

        Jedis jedis = JedisUtils.getJedis();

        try {
            // 获取session
            HttpServletRequest request = (HttpServletRequest) req;
            HttpSession session = request.getSession();

            // 从session中获取用户
            User user1 = (User) session.getAttribute("user");
            jedis.del(user1.getUsername());
            session.setAttribute("user",null);
            return "login";
        }finally {
            jedis.close();
        }

    }

}
