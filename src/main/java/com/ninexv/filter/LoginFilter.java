package com.ninexv.filter;

import com.ninexv.domain.User;
import com.ninexv.utils.JedisUtils;
import redis.clients.jedis.Jedis;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse response, FilterChain filterChain)
            throws IOException, ServletException {

        Jedis jedis = JedisUtils.getJedis();
        try {
            // 获取session
            HttpServletRequest request = (HttpServletRequest) req;
            HttpSession session = request.getSession();

            // 从session中获取用户
            User user1 = (User) session.getAttribute("user");
            // 判断用户是否存在
            if (user1 != null) {
                String p = jedis.get(user1.getUsername());
                if (p != null) {
                    if (p.equals(user1.getPassword())) {
                        request.getRequestDispatcher("main.jsp").forward(request, response);
                        return;
                    }
                }
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
        finally {
            jedis.close();
        }
    }

    @Override
    public void destroy() {

    }
}
