# Hotel Management System

A Java web application for hotel booking, room management, and administrative operations. Built with Java Servlets, JSP, and MySQL.

## Features

### Admin Management
- Add, update, and delete admin accounts
- View admin dashboard and statistics
- Manage customers, staff, rooms, services, and reservations

### Customer Features
- User registration and login
- Browse and book hotel rooms
- View reservation history
- Process payments
- Manage personal profile
- Track booking sessions

### Room Management
- Add and update room details
- View available rooms
- Manage room inventory
- Filter rooms by type and availability

### Reservation System
- Create and manage reservations
- Update reservation dates
- View reservation details
- Delete reservations

### Payment Processing
- Add payments
- View payment history
- Edit payment records

### Services & Staff
- Manage hotel services
- Add and update staff information
- Track service bookings

## Technology Stack

- **Backend**: Java Servlets
- **Frontend**: JSP, HTML, CSS, JavaScript
- **Database**: MySQL
- **Server**: Apache Tomcat 9.0+
- **IDE**: Eclipse Dynamic Web Project
- **Libraries**: 
  - MySQL Connector Java 5.1.48
  - JSTL 1.2
  - Servlet API 3.1

## Project Structure

```
Hotel_Management_System/
├── src/
│   └── main/
│       ├── java/
│       │   ├── model/           # Data models (User, Admin, Room, Reservation, Payment, etc.)
│       │   ├── services/        # Business logic services
│       │   ├── servlet/         # HTTP request handlers
│       │   └── utils/           # Utility classes
│       └── webapp/
│           ├── index.jsp        # Landing page
│           ├── login.jsp        # User login
│           ├── register.jsp     # User registration
│           ├── profile.jsp      # User profile
│           ├── room.jsp         # Room listing
│           ├── roomDetails.jsp  # Room details
│           ├── payment.jsp      # Payment page
│           ├── manager.jsp      # Admin dashboard
│           ├── AdminRegister.jsp # Admin registration
│           ├── css/             # Stylesheets
│           ├── js/              # JavaScript files
│           ├── images/          # Images and assets
│           └── WEB-INF/
│               ├── web.xml      # Deployment descriptor
│               └── lib/         # External JAR dependencies
└── build/
    └── classes/                 # Compiled class files
```

## Setup & Installation

### Prerequisites
- Java SE 17+
- Apache Tomcat 9.0+
- MySQL Server

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Dewmina-Wanninayake/Moon_Rock_JAVA.git
   cd Hotel_Management_System
   ```

2. **Configure Database**
   - Create a MySQL database for the hotel management system
   - Update database connection details in the service classes (likely in `PaymentDB.java`, `ReservationDB.java`, etc.)

3. **Build the Project**
   - In Eclipse: Right-click project → Build Project
   - Or compile manually from the command line

4. **Deploy to Tomcat**
   - Create a folder `Hotel_Management_System` in Tomcat's `webapps` directory
   - Copy files from `src/main/webapp/` to the folder root
   - Copy `build/classes/` contents to `WEB-INF/classes/`
   - Copy JAR files from `src/main/webapp/WEB-INF/lib/` to the deployed `WEB-INF/lib/` (exclude servlet-api.jar)
   - Ensure `WEB-INF/web.xml` is present

5. **Start Tomcat**
   - Start Apache Tomcat server
   - Open browser and navigate to: `http://localhost:8090/Hotel_Management_System/`

## Usage

### For Customers
1. Register a new account via the registration page
2. Login with credentials
3. Browse available rooms
4. Create reservations
5. Process payments
6. Manage profile and bookings

### For Admins
1. Login with admin credentials
2. Access admin dashboard
3. Manage customers, staff, rooms, services, and reservations
4. View statistics and reports

## Servlets Overview

### Authentication
- `CustomerLogin.java` - Customer login handler
- `LogoutServlet.java` - Logout handler

### Admin Management
- `AddAdmin.java`, `UpdateAdmin.java`, `DeleteAdmin.java` - Admin CRUD
- `AdminTable.java`, `AdminCount.java` - Admin dashboard
- `AdminCustomerTbl.java` - Admin customer management
- `AdminServiceTbl.java` - Admin service management
- `AdminStaffTbl.java` - Admin staff management

### Customer Management
- `AddCustomer.java`, `UpdateCustomer.java`, `DeleteCustomer.java` - Customer CRUD

### Reservations
- `BookingServlet.java` - Booking management
- `ManagerReservation.java`, `DeleteReservation.java` - Reservation operations
- `UpdateSessionDatesServlet.java` - Session date updates

### Payments
- `AddPayment.java`, `UserPayment.java` - Payment handling

### Room Management
- `ManagerRoom.java`, `DeleteRoom.java` - Room operations

### Services & Staff
- `AddPackage.java`, `AddService.java`, `AddStaff.java` - Add operations
- `UpdateService.java`, `UpdateStaff.java` - Update operations
- `DeleteService.java`, `DeleteStaff.java` - Delete operations

## Database Connection

The application uses MySQL connector for database operations. Ensure the following:
- MySQL server is running
- Database credentials are configured in the service layer
- Required tables are created (user, admin, room, reservation, payment, etc.)

## Notes

- The servlet classes are mapped in `WEB-INF/web.xml`
- JSP pages are stored in `src/main/webapp/`
- Static assets (CSS, JS, images) are in `src/main/webapp/css/`, `js/`, and `images/` directories
- JSTL is included for dynamic JSP content

## Future Enhancements

- Email notifications for bookings and payments
- Real-time room availability updates
- Advanced reporting and analytics
- Mobile-responsive design improvements
- API layer for REST endpoints
- Authentication token-based security

## License

This project is open source and available for educational and commercial use.

## Author

Dewmina Wanninayake

## Contact

For inquiries, please visit: https://github.com/Dewmina-Wanninayake
