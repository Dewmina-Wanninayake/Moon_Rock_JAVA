package services;

import java.time.LocalDate;
import model.Payment;


public class FacadePayment {
    
    private ReservationDB reservationDB;
    private PaymentDB paymentDB;

    public FacadePayment() {
        this.reservationDB = new ReservationDB();
        this.paymentDB = new PaymentDB();
    }

    public boolean processPayment(
            int uid,
            int rid,
            int serviceId,
            LocalDate startDate,
            LocalDate endDate,
            double amount,
            LocalDate paidDate,
            String paidMethod
    ) {
        int reservationId = reservationDB.insertReservation(uid, rid, serviceId, startDate, endDate, amount);
        if (reservationId <= 0) {
            return false;
        }

        Payment payment = new Payment(amount, paidDate, paidMethod, reservationId);
        return paymentDB.addPayment(payment);
    }
}
