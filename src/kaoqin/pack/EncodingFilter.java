package kaoqin.pack;
import java.io.IOException;
import javax.servlet.*;

public class EncodingFilter implements Filter{

    protected FilterConfig config;
    public void init(FilterConfig filterConfig)throws ServletException{
       this.config=filterConfig;
    }
    public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws IOException,ServletException {
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request,response);
    }
    public void destroy(){}
}
