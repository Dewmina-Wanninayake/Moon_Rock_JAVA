package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PaymentEdit;

import services.PaymentServices;


public class UserPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public UserPayment() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PaymentServices services = new PaymentServices();
		ArrayList<PaymentEdit> Payment = services.getAllPaymentEdit();
		request.setAttribute("payment", Payment);

		RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
