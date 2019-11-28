/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.wadielnatron.beans.Voucher;
import org.wadielnatron.dao.VoucherDAO;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/vouchers" })
public class VoucherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public VoucherServlet() {
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
		String operationType = request.getParameter("operation_type");
		if (operationType.equals("delete")) {
			HttpSession httpsession = request.getSession(true);
			try {
				String role = httpsession.getAttribute("userRole").toString();
				if (role != null) {
					if (role.equals("2") || role.equals("3")) {
						int voucherID = Integer.parseInt(request.getParameter("voucher_id"));
						String farmID = request.getParameter("farm_id");
						List<Voucher> vouchers = null;
						try {
							VoucherDAO voucherdao = new VoucherDAO();
							voucherdao.deleteByVoucherID(voucherID);
							vouchers = voucherdao.getVouchersByFarmID(farmID);
							voucherdao.closeDBConn();
						} catch (Exception e) {
							e.printStackTrace();
						}
						ObjectMapper mapper = new ObjectMapper();
						String vouchersInjson = mapper.writeValueAsString(vouchers);
						request.setAttribute("vouchers", vouchersInjson);
						request.setAttribute("selectedfarmid", farmID);
					} else {
						httpsession.setAttribute("deletevoucher", "برجاء مراجعة مع موظف لتسجيل ايصال");
					}
				}
			} catch (NullPointerException ne) {
				httpsession.setAttribute("deletevoucher", "برجاء قم بتسجيل الدخول");
			}
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/vouchersView.jsp");
			dispatcher.forward(request, response);
		}
		if (operationType.equals("add")) {
			HttpSession httpsession = request.getSession(true);
			String gov = request.getParameter("gov");
			String site = request.getParameter("site");
			String farmId = request.getParameter("farm_id");
			String personId = request.getParameter("person_id");
			String personName = request.getParameter("person_name");
			String voucherDate = request.getParameter("voucher_date");
			String feesStatus = request.getParameter("fees_status");
			String amount = request.getParameter("amount");
			String paymentStatus = request.getParameter("payment_status");
			System.out.println("=========Payment Status: "+paymentStatus);
			String issuingDocument = request.getParameter("issuing_document");
			String issuingDocumentSection = request.getParameter("issuing_document_section");
			String issuingDocumentNo = request.getParameter("issuing_document_no");
			String notes = request.getParameter("notes");
			String role = null;
			try {
				role = httpsession.getAttribute("userRole").toString();
				if (role != null) {
					if (role.equals("2") || role.equals("3")) {
						try {
							Voucher voucher = new Voucher();
							voucher.setGov(gov);
							voucher.setSite(site);
							voucher.setFarmID(farmId);
							voucher.setPersonID(personId);
							voucher.setPersonName(personName);
							DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date date = formatter.parse(voucherDate);
							voucher.setVoucherDate(date);
							voucher.setFeesStatus(feesStatus);
							voucher.setAmount(amount);
							voucher.setPaymentStatus(paymentStatus);
							voucher.setIssuingDocument(issuingDocument);
							voucher.setIssuingDocumentSection(issuingDocumentSection);
							voucher.setIssuingDocumentNo(issuingDocumentNo);
							voucher.setNotes(notes);
							List<Voucher> vouchers = null;

							VoucherDAO voucherdao = new VoucherDAO();
							voucherdao.addVoucher(voucher);
							vouchers = voucherdao.getVouchersByFarmID(farmId);
							voucherdao.closeDBConn();
							ObjectMapper mapper = new ObjectMapper();
							String vouchersInjson = mapper.writeValueAsString(vouchers);
							request.setAttribute("selectedfarmid", farmId);
							request.setAttribute("vouchers", vouchersInjson);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}

					else {
						httpsession.setAttribute("addNewVoucher", "برجاء مراجعة مع موظف لتسجيل ايصال");
					}
				}
			} catch (NullPointerException ne) {
				httpsession.setAttribute("addNewVoucher", "برجاء قم بتسجيل الدخول");
			}
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/vouchersView.jsp");
			dispatcher.forward(request, response);
		}
		if (operationType.equals("edit")) {
			HttpSession httpsession = request.getSession(true);
			String gov = request.getParameter("gov");
			String site = request.getParameter("site");
			String farmId = request.getParameter("farm_id");
			String personId = request.getParameter("person_id");
			String personName = request.getParameter("person_name");
			String voucherDate = request.getParameter("voucher_date");
			String feesStatus = request.getParameter("fees_status");
			String amount = request.getParameter("amount");
			String paymentStatus = request.getParameter("payment_status");
			System.out.println("=========Payment Status: "+paymentStatus);
			String issuingDocument = request.getParameter("issuing_document");
			String issuingDocumentSection = request.getParameter("issuing_document_section");
			String issuingDocumentNo = request.getParameter("issuing_document_no");
			String notes = request.getParameter("notes");
			String voucherId = request.getParameter("voucher_id");

			try {
				String role = httpsession.getAttribute("userRole").toString();
				if (role != null) {
					if (role.equals("2") || role.equals("3")) {
						try {
							Voucher voucher = new Voucher();
							voucher.setGov(gov);
							voucher.setSite(site);
							voucher.setFarmID(farmId);
							voucher.setPersonID(personId);
							voucher.setPersonName(personName);
							DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
							Date date = formatter.parse(voucherDate);
							voucher.setVoucherDate(date);
							voucher.setFeesStatus(feesStatus);
							voucher.setAmount(amount);
							voucher.setPaymentStatus(paymentStatus);
							voucher.setIssuingDocument(issuingDocument);
							voucher.setIssuingDocumentSection(issuingDocumentSection);
							voucher.setIssuingDocumentNo(issuingDocumentNo);
							voucher.setNotes(notes);
							voucher.setVoucherID(Integer.parseInt(voucherId));

							List<Voucher> vouchers = null;
							VoucherDAO voucherdao = new VoucherDAO();
							voucherdao.updateVoucher(voucher);
							vouchers = voucherdao.getVouchersByFarmID(farmId);
							voucherdao.closeDBConn();
							ObjectMapper mapper = new ObjectMapper();
							String vouchersInjson = mapper.writeValueAsString(vouchers);
							request.setAttribute("selectedfarmid", farmId);
							request.setAttribute("vouchers", vouchersInjson);
						} catch (Exception e) {
							e.printStackTrace();
						}
					} else {
						httpsession.setAttribute("editVoucher", "برجاء مراجعة مع موظف لتسجيل ايصال");
					}
				}
			} catch (NullPointerException ne) {
				httpsession.setAttribute("editVoucher", "برجاء قم بتسجيل الدخول");
			}
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/vouchersView.jsp");
			dispatcher.forward(request, response);
		}
		if (operationType.equals("list")) {
			String polygonId = request.getParameter("polygon_id");
			String polygonLat = request.getParameter("polygon_lat");
			String polygonLong = request.getParameter("polygon_long");
			List<Voucher> vouchers = null;
			try {
				VoucherDAO voucherdao = new VoucherDAO();
				vouchers = voucherdao.getVouchersByFarmID(polygonId);
				voucherdao.closeDBConn();
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (vouchers.size() == 0) {
				vouchers = null;
			}
			ObjectMapper mapper = new ObjectMapper();
			String vouchersInjson = mapper.writeValueAsString(vouchers);
			String selectedfarmid = mapper.writeValueAsString(polygonId);
			request.setAttribute("vouchers", vouchersInjson);
			request.setAttribute("selectedfarmid", selectedfarmid);
			request.setAttribute("lat", polygonLat);
			request.setAttribute("lng", polygonLong);
			RequestDispatcher dispatcher = this.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/vouchersView.jsp");
			dispatcher.forward(request, response);
		}
	}

}
