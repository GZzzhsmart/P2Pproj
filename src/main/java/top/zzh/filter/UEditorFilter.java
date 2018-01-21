package top.zzh.filter;

import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UEditorFilter extends OncePerRequestFilter {
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		if (url.contains("/jsp/controller.jsp")) {
			System.out.println("jsp/controller");
			filterChain.doFilter(request, response);
		}else{
			super.doFilter(request, response, filterChain);
		}
	}
}