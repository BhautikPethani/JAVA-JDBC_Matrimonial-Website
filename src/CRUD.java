

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

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

/**
 * Servlet implementation class CRUD
 */
@WebServlet("/CRUD")
public class CRUD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CRUD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	final String senderEmailID = "17bmiit013@gmail.com";
	final String senderPassword = "Vs303230";
	final String emailSMTPserver = "smtp.gmail.com";
	final String emailServerPort = "465";
	String receiverEmailID;
	static String emailSubject = "Sign up Varification OTP !!";
	static String emailBody;
	
	public class SMTPAuthenticator extends javax.mail.Authenticator
    {
		  public PasswordAuthentication getPasswordAuthentication()
		  {
			  return new PasswordAuthentication(senderEmailID, senderPassword);
		  }
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String otp = request.getParameter("otp");
		if(otp!=null)
		{
			System.out.println("OTP Established" + otp);
			HttpSession session = request.getSession(false);
			String fname = (String) session.getAttribute("fname");
			String lname = (String) session.getAttribute("lname");
			String email1 = (String) session.getAttribute("email");
			String passwd = (String) session.getAttribute("passwd");
			int otp1 = (int) session.getAttribute("otp");
			session.invalidate();
			System.out.println(fname + lname + email1 + passwd + otp + otp1);
			if(otp1 == Integer.parseInt(otp))
			{
				System.out.println("OTP Matched");
				try{
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
			
				 		System.out.println("Established..");
				 	
					java.sql.PreparedStatement pst = conn.prepareStatement("insert into signup (fname,lname,email,passwd) values (?,?,?,?)");
				 	pst.setString(1, fname);
				 	pst.setString(2, lname);
				 	pst.setString(3, email1);
				 	pst.setString(4, passwd);
				 	pst.executeUpdate();
				 	conn.close();
				 	
				 	Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/root","root","");
				 	java.sql.PreparedStatement pst1 = conn1.prepareStatement("insert into login values (?,?)");
				 	pst1.setString(1, email1);
				 	pst1.setString(2, passwd);
				    int i = pst1.executeUpdate();
				 	if(i==0)
				 	{
				 		System.out.println("Not Inserted..");
				 	}
				 	else if(i==1)
				 	{
					 		System.out.println("Inserted..");
				 	}
				 	
				 	
				 	conn.close();
				 	
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
				  // Subject
				  this.emailSubject="Thank You..";
				  // Body
				  this.emailBody="Thank You For Registering in Matrimonial.";
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
					  Session session1 = Session.getInstance(props, auth);
					  MimeMessage msg = new MimeMessage(session1);
					  msg.setText(emailBody);
					  msg.setSubject(emailSubject);
					  msg.setFrom(new InternetAddress(senderEmailID));
					  msg.addRecipient(Message.RecipientType.TO,
					  new InternetAddress(email1));
					  Transport.send(msg);
					  System.out.println("Thank:)");
					  
					  RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					  rd.forward(request, response);
				  }
				  catch (Exception mex)
				  {
					  mex.printStackTrace();
				  }

			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
				rd.forward(request, response);
			}
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("Signup.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
