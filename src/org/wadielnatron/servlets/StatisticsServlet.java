/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;
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
@WebServlet(urlPatterns = { "/statistics" })
public class StatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StatisticsServlet() {
		super();
	}

	@Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
		List<Farm> farmsList = null;
		try {
			FarmDAO farmdao = new FarmDAO();
			farmsList = farmdao.getAllAvailableFarms();
			farmdao.closeDBConn();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ObjectMapper mapper = new ObjectMapper();
		String farmsInjson = mapper.writeValueAsString(farmsList);
		request.setAttribute("farms", farmsInjson);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/statisticsView.jsp");
		dispatcher.forward(request, response);
   }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
