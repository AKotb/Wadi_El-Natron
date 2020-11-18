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
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Farm> farmsList = null;
		FarmDAO farmdao = null;

		String formType = request.getParameter("form_type");
		if (formType != null) {
			// select ploygon on map
			if (formType.equals("displayonmap")) {
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
			} else {
				String farmName = request.getParameter("farm_name");
				String ownerId = request.getParameter("owner_id");
				String ownerName = request.getParameter("owner_name");
				String ownerTelephone = request.getParameter("owner_telephone");
				String ownership = request.getParameter("ownership_status");
				String fileNo = request.getParameter("file_no");
				int nOfPages = 1;
				int rows = 1;

				// search for farms
				if (formType.equals("searchform")) {
					// For Pagination
					try {
						response.setContentType("text/html;charset=UTF-8");
						int currentPage = Integer.parseInt(request.getParameter("currentPage"));
						int recordsPerPage = Integer.parseInt(request.getParameter("recordsPerPage"));
						farmdao = new FarmDAO();
						farmsList = farmdao.findFarms(farmName, ownerId, ownerName, ownerTelephone, ownership, fileNo,
								currentPage, recordsPerPage);
						rows = (farmdao.getAllFarms(farmName, ownerId, ownerName, ownerTelephone, ownership, fileNo))
								.size();
						nOfPages = rows / recordsPerPage;
						if (nOfPages % recordsPerPage > 0) {
							nOfPages++;
						}
						farmdao.closeDBConn();
						request.setAttribute("farmspg", farmsList);
						request.setAttribute("noOfPages", nOfPages);
						request.setAttribute("currentPage", currentPage);
						request.setAttribute("recordsPerPage", recordsPerPage);
						request.setAttribute("farm_ownership_status", ownership);
						request.setAttribute("noofrows", rows + "");
					} catch (NumberFormatException e) {
						System.out.println("No Pages to Show!");
					} catch (Exception e) {
						e.printStackTrace();
					}
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
							farm.setFileNo(fileNo);
							try {
								farmdao = new FarmDAO();
								farmdao.updateFarm(farm);
								farmsList = farmdao.getAllFarms(farmName, ownerId, ownerName, ownerTelephone, ownership,
										fileNo);
								farmdao.closeDBConn();
							} catch (Exception e) {
								e.printStackTrace();
							}
							request.setAttribute("farmspg", farmsList);
							request.setAttribute("farm_ownership_status", ownership);
							request.setAttribute("noofrows", "1");
						} else {
							httpsession.setAttribute("updateFarmData", "برجاء المراجعة مع الموظف المختص");
						}
					} else {
						httpsession.setAttribute("updateFarmData", "برجاء تسجيل الدخول");
					}
				}
				RequestDispatcher dispatcher = this.getServletContext()
						.getRequestDispatcher("/WEB-INF/views/searchView.jsp");
				dispatcher.forward(request, response);
			}
		} else {
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/searchView.jsp");
			dispatcher.forward(request, response);
		}
	}
}
