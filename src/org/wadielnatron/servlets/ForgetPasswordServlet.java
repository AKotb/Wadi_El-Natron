/**
 * 
 */
package org.wadielnatron.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.hibernate.Session;
import org.wadielnatron.beans.User;
import org.wadielnatron.dao.UserDAO;
import org.wadielnatron.utils.Codes;
import org.wadielnatron.utils.EmailUtility;
import org.wadielnatron.utils.HibernateUtil;

/**
 * @author ahmed.kotb
 *
 */
@WebServlet(urlPatterns = { "/resetpassword" })
public class ForgetPasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String email;
	private String name;
	private String pass;

	public ForgetPasswordServlet() {
		super();
	}

	public void init() {
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		email = context.getInitParameter("email");
		name = context.getInitParameter("name");
		pass = context.getInitParameter("pass");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/forgetpasswordView.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession httpsession = request.getSession(true);
		String message = "";
		String recipient = request.getParameter("email");
		String subject = "Your Password has been reset";
		String newPassword = this.resetUserPassword(recipient);
		try {
			if (newPassword != null && newPassword.length() > 0) {
				String content = "Hi, this is your new password: " + newPassword;
				content += "\nNote: for security reason, " + "you must change your password after logging in.";
				System.out.println("Host: "+host);
				System.out.println("Port: "+port);
				System.out.println("Email: "+email);
				System.out.println("Name: "+name);
				System.out.println("Password: "+pass);
				System.out.println("Recipient: "+recipient);
				System.out.println("Subject: "+subject);
				System.out.println("Content: "+content);
				EmailUtility.sendEmail(host, port, email, name, pass, recipient, subject, content);
				message = Codes.PASSWORD_RESET_SUCCESSFUL;
			} else {
				message = Codes.ENTERED_EMAIL_NOT_FOUND;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			message = Codes.PASSWORD_RESET_FAILED;
		} finally {
			httpsession.setAttribute("message", message);
			request.getRequestDispatcher("messageView.jsp").forward(request, response);
		}
	}

	private String resetUserPassword(String email) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		UserDAO userdao = new UserDAO(session);
		User user = userdao.findByEmail(email);
		String randomPassword = null;
		if (user != null) {
			randomPassword = RandomStringUtils.randomAlphanumeric(10);
			RandomNumberGenerator rng = new SecureRandomNumberGenerator();
			Object salt = rng.nextBytes();
			String hashedPassword = new Sha256Hash(randomPassword, salt, 1024).toBase64();
			userdao.updateUser(user.getName(), user.getEmail(), user.getIdentifynumber(), user.getPhoneNumber(),
					user.getRoleid(), hashedPassword, salt.toString());
		}
		return randomPassword;
	}
}
