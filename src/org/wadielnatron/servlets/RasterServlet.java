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
@WebServlet(urlPatterns = { "/raster" })
public class RasterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RasterServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String polygonId = request.getParameter("polygon_id");
		String polygonLat = request.getParameter("polygon_lat");
		String polygonLong = request.getParameter("polygon_long");
		request.setAttribute("polygonID", polygonId);
		request.setAttribute("lat", polygonLat);
		request.setAttribute("lng", polygonLong);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/rasterView.jsp");
		dispatcher.forward(request, response);
	}

}
