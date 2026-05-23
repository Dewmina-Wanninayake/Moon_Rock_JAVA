package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.time.LocalDate;
import services.FacadePayment;


public class AddPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            int uid = (int) session.getAttribute("uid");

            int rid = Integer.parseInt(request.getParameter("rid"));
            int serviceId = 1;
            
            LocalDate startDate = LocalDate.parse(request.getParameter("arrival"));
            LocalDate endDate = LocalDate.parse(request.getParameter("departure"));
            double price = Double.parseDouble(request.getParameter("amount"));
            LocalDate paidDate = LocalDate.parse(request.getParameter("paidDate"));
            String paidMethod = request.getParameter("paidMethod");

            FacadePayment facade = new FacadePayment();
            boolean success = facade.processPayment(uid, rid, serviceId, startDate, endDate, price, paidDate, paidMethod);

            if (success) {
                response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("1.jsp");
        }
    }
}



