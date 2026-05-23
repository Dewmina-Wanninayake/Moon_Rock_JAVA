package services;

import java.sql.*;
import java.time.LocalDate;
import utils.DBconnect;

public class ReservationDB {

    public int insertReservation(int uid, int rid, int serviceId, LocalDate startDate, LocalDate endDate, double price) {
        int generatedReserveId = 0;

        try {
            String query = "INSERT INTO reservation (UID, RID, ServiceID, StartDate, EndDate, Price) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = DBconnect.getConnection().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, uid);
            ps.setInt(2, rid);
            ps.setInt(3, serviceId);
            ps.setDate(4, Date.valueOf(startDate));
            ps.setDate(5, Date.valueOf(endDate));
            ps.setDouble(6, price);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    generatedReserveId = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return generatedReserveId;
    }
}
