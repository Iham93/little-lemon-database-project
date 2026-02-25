import mysql.connector

# Connect to database
connection = mysql.connector.connect(
    host="127.0.0.1",
    port=3307,  # XAMPP default
    user="root",
    password="",
    database="little_lemon_db"
)

cursor = connection.cursor()

# Test 1: Get Max Quantity
cursor.callproc('GetMaxQuantity')

for result in cursor.stored_results():
    print("Max Quantity:", result.fetchone()[0])

# Test 2: Add Booking
cursor.callproc('AddBooking', ['2026-03-20', 7, 1])
connection.commit()
print("Booking Added Successfully")

cursor.close()
connection.close()
