--------------------------------------------------------------------------------------------
--Justin Pulido
--createhotel.sql
--May 22, 2019
--------------------------------------------------------------------------------------------

spool createhotel.txt

DROP TABLE Hotel CASCADE CONSTRAINTS;
CREATE TABLE Hotel (
    hotelNo VARCHAR(9),
    hotelName VARCHAR2(15) NOT NULL,
    city VARCHAR2(30) NOT NULL,
    CONSTRAINTS Hotel_PK PRIMARY KEY (hotelNo)
); 

DROP TABLE Room CASCADE CONSTRAINTS;
CREATE TABLE Room (
    roomNo VARCHAR(9) UNIQUE NOT NULL,
    hotelNo VARCHAR(9),
    type_room VARCHAR2(15),
    price INT,
    CONSTRAINTS Room_PK PRIMARY KEY (roomNo, hotelNo)
);

DROP TABLE Booking CASCADE CONSTRAINTS;
CREATE TABLE Booking (
    hotelNo VARCHAR(9),
    guestNo VARCHAR(9),
    dateFrom DATE,
    dateTo DATE,
    roomNo VARCHAR(9),
    CONSTRAINTS Booking_PK PRIMARY KEY (hotelNo, guestNo, dateFrom)
);

DROP TABLE Guest CASCADE CONSTRAINTS;
CREATE TABLE Guest ( 
    guestNo VARCHAR(9),
    guestName VARCHAR2(25),
    guestAddress VARCHAR2(40),
    CONSTRAINTS Guest_PK PRIMARY KEY (guestNo)
);

ALTER TABLE Room
    ADD CONSTRAINTS Hotel_hotelNo_FK FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Booking
    ADD CONSTRAINTS Booking_roomNo_FK FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Booking
    ADD CONSTRAINTS Booking_hotelNo_FK FOREIGN KEY (hotelNo) REFERENCES Hotel(hotelNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Booking
    ADD CONSTRAINTS Booking_guestNo_FK FOREIGN KEY (guestNo) REFERENCES Guest(guestNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE; 

spool off
