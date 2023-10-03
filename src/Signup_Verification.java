

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;


/**
 * Servlet implementation class Signup_Verification
 */
@WebServlet("/Signup_Verification")
public class Signup_Verification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup_Verification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
    final String senderEmailID = "17bmiit013@gmail.com";
	final String senderPassword = "Vs303230";
	final String emailSMTPserver = "smtp.gmail.com";
	final String emailServerPort = "465";
	String receiverEmailID;
	static String emailSubject = "Sign up Varification OTP !!";
	static String emailBody;
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	public class SMTPAuthenticator extends javax.mail.Authenticator
    {
		  public PasswordAuthentication getPasswordAuthentication()
		  {
			  return new PasswordAuthentication(senderEmailID, senderPassword);
		  }
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		if(email!=null){
				String fname = request.getParameter("fname");
				String lname = request.getParameter("lname");
				String passwd = request.getParameter("passwd");
				
				HttpSession session = request.getSession();
				session.setAttribute("fname", fname);
				session.setAttribute("lname", lname);
				session.setAttribute("passwd", passwd);
				session.setAttribute("email", email);
				
				
				Random random = new Random();
				int rnum = (int)((random.nextDouble())*10000);
				session.setAttribute("otp", rnum);
				response.setContentType("text/html");
				PrintWriter out =response.getWriter();
				//out.println(rnum);
				
					this.receiverEmailID=email; 
				  // Subject
				  this.emailSubject=emailSubject;
				  // Body
				  this.emailBody="OTP Is " + rnum;
				  Properties props = new Properties();
				  props.put("mail.smtp.user",senderEmailID);
				  props.put("mail.smtp.host", emailSMTPserver);
				  props.put("mail.smtp.port", emailServerPort);
				  props.put("mail.smtp.starttls.enable", "true");
				  props.put("mail.smtp.auth", "true");
				  props.put("mail.smtp.socketFactory.port", emailServerPort);
				  props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				  props.put("mail.smtp.socketFactory.fallback", "false");
				  SecurityManager security = System.getSecurityManager();
				  try{  
					  Authenticator auth = new SMTPAuthenticator();
					  Session session2 = Session.getInstance(props, auth);
					  MimeMessage msg = new MimeMessage(session2);
					  msg.setText(emailBody);
					  msg.setSubject(emailSubject);
					  msg.setFrom(new InternetAddress(senderEmailID));
					  msg.addRecipient(Message.RecipientType.TO,
					  new InternetAddress(receiverEmailID));
					  Transport.send(msg);
					  System.out.println("Message send Successfully:)");
				  }
				  catch (Exception mex)
				  {
					  mex.printStackTrace();
				  }

				
				out.println("<html>"
						+ "<style>"
						+ "body{"
						+ "background: linear-gradient(rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35)), url(photos/1.jpg) no-repeat;"
						+ "}"
						+ ".Box{"
						+ "width:20%;"
						+ "height:15%;"
						+ "position: absolute;"
						+ "top: calc(40% - 35px);"
						+ "left: calc(55% - 255px);"
						+ "flex-grow:1;"
						+ "padding:15px 0;"
						+ "background-color:white;"
						+ "border-radius:5px;border-bottom: solid rgb(15, 15, 15);"
						+ "}"
						+ ".Box input[type='text']{"
						+ "border: none;"
						+ "border-bottom: 1px solid rgb(5, 5, 5);"
						+ "background: transparent;"
						+ "outline: none;"
						+ "height: 40px;"
						+ "color: rgb(3, 3, 3);"
						+ "font-size: 20px;"
						+ "}"
						+ ".Box input[type='submit']{"
						+ "border: none;"
						+ "outline: none;"
						+ "height: 40px;"
						+ "background: #1c8adb;"
						+ "color: #fff;"
						+ "font-size: 18px;"
						+ "border-radius: 20px;"
						+ "}"
						+ ".Box input[type='submit']:hover{"
						+ "cursor: pointer;color: #000;"
						+ "}"
						+ "</style>"
						+ "<body>"
						+ "<form action='CRUD' method='get'>"
						+ "<div class='Box'>"
						+ "<center><input type='text' name='otp' placeholder='        Enter OTP' required/></center>"
						+ "<center><br><input type='submit' value='Submit'/></center>"
						+ "</div>"
						+ "</form>"
						+ "</body>"
						+ "</html>");
			}
			else
			{
					RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
					rd.forward(request, response);
				
			}

		}
		
}
