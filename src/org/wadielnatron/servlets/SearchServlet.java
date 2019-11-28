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
import javax.servlet.http.HttpSession;
import org.wadielnatron.beans.Farm;
import org.wadielnatron.dao.FarmDAO;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/search" })
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String polygonID = request.getParameter("polygon_id");
		String polygonLat = request.getParameter("polygon_lat");
		String polygonLong = request.getParameter("polygon_long");
		RequestDispatcher dispatcher = null;
		if (polygonID != null) {
			request.setAttribute("showfarm_id", polygonID);
			// map center for Egypt
			request.setAttribute("selectedlat", polygonLat);
			request.setAttribute("selectedlng", polygonLong);
			dispatcher = this.getServletContext().getRequestDispatcher("/home");
		} else {
			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/searchView.jsp");
		}
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String formType = request.getParameter("form_type");
		String farmName = request.getParameter("farm_name");
		String ownerId = request.getParameter("owner_id");
		String ownerName = request.getParameter("owner_name");
		String ownerTelephone = request.getParameter("owner_telephone");
		String ownership = request.getParameter("ownership_status");
		List<Farm> farmsList = null;
		ObjectMapper mapper = null;
		String farmsInjson = null;
		FarmDAO farmdao = null;
		 
		if (formType.equals("paging")) {
			System.out.println("=======Paging Pressed!");
	
		}
		// search for farms
		if (formType.equals("searchform")) {
			try {
				farmdao = new FarmDAO();
				farmsList = farmdao.getAllFarms(farmName, ownerId, ownerName, ownerTelephone, ownership);
				farmdao.closeDBConn();
			} catch (Exception e) {
				e.printStackTrace();
			}
			mapper = new ObjectMapper();
			farmsInjson = mapper.writeValueAsString(farmsList);
			request.setAttribute("farms", farmsInjson);
		} else {
			// edit farm data
			String farmId = request.getParameter("farm_id");
			HttpSession httpsession = request.getSession(true);
			String role = httpsession.getAttribute("userRole").toString();
			if (role != null) {
				if (role.equals("2") || role.equals("3")) {
					Farm farm = new Farm();
					farm.setFarmID(Integer.parseInt(farmId));
					farm.setFarmName(farmName);
					farm.setOwnerName(ownerName);
					farm.setOwnerID(ownerId);
					farm.setTelephone(ownerTelephone);
					if (ownership == null || ownership.equals("")) {
						ownership = null;
					}
					farm.setOwnership(ownership);
					try {
						farmdao = new FarmDAO();
						farmdao.updateFarm(farm);
						farmsList = farmdao.getAllFarms(farmName, ownerId, ownerName, ownerTelephone, ownership);
						farmdao.closeDBConn();
					} catch (Exception e) {
						e.printStackTrace();
					}
					mapper = new ObjectMapper();
					farmsInjson = mapper.writeValueAsString(farmsList);
					request.setAttribute("farms", farmsInjson);
				} else {
					httpsession.setAttribute("updateFarmData", "برجاء المراجعة مع الموظف المختص");
				}
			} else {
				httpsession.setAttribute("updateFarmData", "برجاء تسجيل الدخول");
			}
		}
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/searchView.jsp");
		dispatcher.forward(request, response);
	}
}
