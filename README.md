# 🍋 Little Lemon Database Project

## 📌 Project Overview
This project is part of the Meta Database Engineer Capstone.  
The goal is to design and implement a database system for Little Lemon restaurant that manages:

- Customer information
- Table bookings
- Orders
- Stored procedures for booking management
- Data visualization integration (Tableau ready)

---

## 🗂 Database Structure

The database `little_lemon_db` contains the following tables:

### 1️⃣ Customers
- CustomerID (Primary Key)
- FullName
- PhoneNumber
- Email

### 2️⃣ Bookings
- BookingID (Primary Key)
- BookingDate
- TableNumber
- CustomerID (Foreign Key)

### 3️⃣ Orders
- OrderID (Primary Key)
- OrderDate
- Quantity
- TotalCost
- CustomerID (Foreign Key)

---

## 🧠 Entity Relationship Diagram

ER Diagram is included in this repository:

📷 `er-diagram.png`

---

## ⚙️ Stored Procedures Implemented

The following stored procedures are implemented:

- `GetMaxQuantity()` → Returns maximum order quantity.
- `AddBooking()` → Adds new booking.
- `UpdateBooking()` → Updates booking date.
- `CancelBooking()` → Cancels booking.
- `ManageBooking()` → Prevents double booking.

---

## 🛠 Technologies Used

- MySQL
- phpMyAdmin
- XAMPP
- GitHub
- Tableau (for visualization)

---

## 🚀 How to Run the Project

1. Install XAMPP
2. Start Apache & MySQL
3. Open phpMyAdmin
4. Import `little_lemon_database.sql`
5. Execute stored procedures for testing

Example:

```sql
CALL GetMaxQuantity();
