package kaoqin.pack;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class LoginCheck extends HttpServlet implements Filter {
    private FilterConfig filterConfig;
    //Handle the passed-in FilterConfig
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }
    //Process the request/response pair
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) {
        try {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;

            boolean isValid = true;
           String uriStr = httpRequest.getRequestURI().toUpperCase();
           if (uriStr.indexOf("LOGIN.JSP") == -1 && httpRequest.getSession().getAttribute("login_role") == null)
           {
             isValid = false;
           }
          if (isValid)
          {
          filterChain.doFilter(request, response);

          } else
          {
             httpResponse.sendRedirect("../excepterror.jsp");
          }

        } catch (ServletException sx) {
            filterConfig.getServletContext().log(sx.getMessage());
        } catch (IOException iox) {
            filterConfig.getServletContext().log(iox.getMessage());
        }
    }

    //Clean up resources
    public void destroy() {
    }
}
