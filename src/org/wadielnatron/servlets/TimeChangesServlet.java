/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/timechanges" })
public class TimeChangesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TimeChangesServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/timechangesView.jsp");
		dispatcher.forward(request, response);
	}
}
