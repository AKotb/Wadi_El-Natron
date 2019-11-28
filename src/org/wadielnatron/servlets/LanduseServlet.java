/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.wadielnatron.beans.Farm;
import org.wadielnatron.dao.FarmDAO;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/landuse" })
public class LanduseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LanduseServlet() {
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
		int farmID = Integer.parseInt(polygonId);
		Farm farm = null;
		try {
			FarmDAO farmdao = new FarmDAO();
			farm = farmdao.getByFarmID(farmID);
			farmdao.closeDBConn();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ObjectMapper mapper = new ObjectMapper();
		String farmInjson = mapper.writeValueAsString(farm);
		request.setAttribute("farmdata", farmInjson);
		request.setAttribute("polygonID", polygonId);
		request.setAttribute("lat", polygonLat);
		request.setAttribute("lng", polygonLong);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/landuseView.jsp");
		dispatcher.forward(request, response);
	}

}
