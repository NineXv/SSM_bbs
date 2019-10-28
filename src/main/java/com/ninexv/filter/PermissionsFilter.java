package com.ninexv.filter;

import com.ninexv.domain.User;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class PermissionsFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpSession session = request.getSession();
        // 从session中获取用户
        User user1 = (User) session.getAttribute("user");
        if (user1.getRole().equals("root")){
            // 存在 --放行
            filterChain.doFilter(request,servletResponse);
        }
        else{
            request.getRequestDispatcher("NoPermiss.jsp").forward(request, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
