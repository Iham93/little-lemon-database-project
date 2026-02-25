-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Waktu pembuatan: 25 Feb 2026 pada 15.01
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `little_lemon_db`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking` (IN `booking_date` DATE, IN `table_number` INT, IN `customer_id` INT)   BEGIN
    INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
    VALUES (booking_date, table_number, customer_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelBooking` (IN `booking_id` INT)   BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity` ()   BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ManageBooking` (IN `booking_date` DATE, IN `table_number` INT, IN `customer_id` INT)   BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*) INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
    AND TableNumber = table_number;

    IF booking_count > 0 THEN
        SELECT 'Table already booked.' AS Status;
    ELSE
        INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
        VALUES (booking_date, table_number, customer_id);
        SELECT 'Booking successful.' AS Status;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking` (IN `booking_id` INT, IN `new_date` DATE)   BEGIN
    UPDATE Bookings
    SET BookingDate = new_date
    WHERE BookingID = booking_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `BookingID` int(11) NOT NULL,
  `BookingDate` date NOT NULL,
  `TableNumber` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`BookingID`, `BookingDate`, `TableNumber`, `CustomerID`) VALUES
(1, '2026-03-01', 3, 1),
(2, '2026-03-02', 5, 2),
(3, '2026-03-03', 2, 3),
(4, '2026-03-04', 4, 4),
(5, '2026-03-05', 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`CustomerID`, `FullName`, `PhoneNumber`, `Email`) VALUES
(1, 'Andi Saputra', '081234567890', 'andi@email.com'),
(2, 'Budi Santoso', '081234567891', 'budi@email.com'),
(3, 'Citra Dewi', '081234567892', 'citra@email.com'),
(4, 'Dewi Lestari', '081234567893', 'dewi@email.com'),
(5, 'Eko Pratama', '081234567894', 'eko@email.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` int(11) NOT NULL,
  `TotalCost` decimal(10,2) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderDate`, `Quantity`, `TotalCost`, `CustomerID`) VALUES
(1, '2026-03-01', 2, 250000.00, 1),
(2, '2026-03-02', 4, 500000.00, 2),
(3, '2026-03-03', 1, 120000.00, 3),
(4, '2026-03-04', 3, 375000.00, 4),
(5, '2026-03-05', 5, 650000.00, 5);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `BookingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
