package org.jsp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/admin/UserList.jsp", "/admin/AddUser.jsp","/admin/BookingList.jsp","/admin/EditAdmin.jsp","/admin/EditHotel.jsp"
		+"/admin/Home.jsp","/admin/HotelList","/admin/LogOut.jsp","/admin/SignUp.jsp","//admin/UserList.jsp"})
public class AdminFileFilters  implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Admin filter start");
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;//downCasting
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpSession session = httpRequest.getSession(false);
		
		if(session.getAttribute("adminObj") == null)
		{
			httpResponse.sendRedirect("/Hotel_Booking_System/admin/Login.jsp");
		}
		else
		{
			chain.doFilter(request, response);
		}
		
		
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
