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

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.hibernate.Session;
import org.wadielnatron.beans.User;
import org.wadielnatron.dao.UserDAO;
import org.wadielnatron.utils.Codes;
import org.wadielnatron.utils.HibernateUtil;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/manageusers" })
public class ManageUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManageUsersServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usersInjson = null;
		String userInjson = null;
		List<User> users = null;
		User user = null;
		RequestDispatcher dispatcher = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		HttpSession httpsession = request.getSession(true);
		session.beginTransaction();
		UserDAO userdao = new UserDAO(session);
		ObjectMapper mapper = new ObjectMapper();
		String operationType = request.getParameter("operation_type");
		if (operationType.equals("list")) {
			try {
				String role = httpsession.getAttribute("userRole").toString();
				if (role != null) {
					if (role.equals("2")) {
						try {
							users = userdao.getAllUsers();
							session.getTransaction().commit();
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							if (session.isOpen())
								session.close();
						}
						if (users.size() == 0) {
							users = null;
						}
					} else {
						httpsession.setAttribute("adminmessage", Codes.USER_LIST_NOTALLOWED);
					}
				}
			} catch (NullPointerException ne) {
				httpsession.setAttribute("adminmessage", Codes.USER_LIST_NOTALLOWED);
			}
			usersInjson = mapper.writeValueAsString(users);
			request.setAttribute("users", usersInjson);
			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/manageusersView.jsp");
			dispatcher.forward(request, response);
		} 
		
		if (operationType.equals("remove")) {
			String selectedusername = request.getParameter("selectedusername");
			boolean removed = false;
			try {
				removed = userdao.removeUser(selectedusername);
				users = userdao.getAllUsers();
				session.getTransaction().commit();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session.isOpen())
					session.close();
			}
			if (removed) {
				httpsession.setAttribute("adminmessage", Codes.USER_REMOVE_SUCCESSFULL);
			} else {
				httpsession.setAttribute("adminmessage", Codes.USER_REMOVE_FAILED);
			}
			usersInjson = mapper.writeValueAsString(users);
			request.setAttribute("users", usersInjson);
			dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/manageusersView.jsp");
			dispatcher.forward(request, response);
		}
		
		if (operationType.equals("update")) {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String identifyNumber = request.getParameter("user_id");
			String phoneNumber = request.getParameter("user_telephone");
			String roleid = request.getParameter("user_role");
			String plainTxtPassword = request.getParameter("user_password");
			try {
				if(plainTxtPassword != null && plainTxtPassword.length()>0){
					RandomNumberGenerator rng = new SecureRandomNumberGenerator();
					Object salt = rng.nextBytes();
					String hashedPassword = new Sha256Hash(plainTxtPassword, salt, 1024).toBase64();
					userdao.updateUser(name, email, identifyNumber, phoneNumber, Integer.parseInt(roleid), hashedPassword, salt.toString());
				}else{
					userdao.updateUser(name, email, identifyNumber, phoneNumber, Integer.parseInt(roleid));
				}
				httpsession.setAttribute("adminmessage", Codes.USER_UPDATE_SUCCESSFULL);
				users = userdao.getAllUsers();
			} catch (Exception e) {
				httpsession.setAttribute("adminmessage", Codes.USER_UPDATE_FAILED);
				e.printStackTrace();
			} finally {
				if (session.isOpen()){
					session.close();
				}
				usersInjson = mapper.writeValueAsString(users);
				request.setAttribute("users", usersInjson);
				dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/manageusersView.jsp");
				dispatcher.forward(request, response);
			}
		}
		
		if (operationType.equals("updatemyprofile")) {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String identifyNumber = request.getParameter("user_id");
			String phoneNumber = request.getParameter("user_telephone");
			String roleid = request.getParameter("user_role");
			String plainTxtPassword = request.getParameter("user_password");
			try {
				if(plainTxtPassword != null && plainTxtPassword.length()>0){
					RandomNumberGenerator rng = new SecureRandomNumberGenerator();
					Object salt = rng.nextBytes();
					String hashedPassword = new Sha256Hash(plainTxtPassword, salt, 1024).toBase64();
					userdao.updateUser(name, email, identifyNumber, phoneNumber, Integer.parseInt(roleid), hashedPassword, salt.toString());
				}else{
					userdao.updateUser(name, email, identifyNumber, phoneNumber, Integer.parseInt(roleid));
				}
				user = userdao.getUserByName(name);
				httpsession.setAttribute("adminmessage", Codes.USER_UPDATE_SUCCESSFULL);
			} catch (Exception e) {
				httpsession.setAttribute("adminmessage", Codes.USER_UPDATE_FAILED);
				e.printStackTrace();
			} finally {
				if (session.isOpen()){
					session.close();
				}
				userInjson = mapper.writeValueAsString(user);
				request.setAttribute("user", userInjson);
				dispatcher = this.getServletContext().getRequestDispatcher("/userInfo?loggedinuser="+name);
				dispatcher.forward(request, response);
			}
		}
	}
}
