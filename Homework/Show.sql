--------------------------------------------------------------------------------------------
--Justin Pulido
--Show.sql
--May 23, 2019
--------------------------------------------------------------------------------------------

spool Show_Output.txt

COMMENT ON TABLE Hotel IS 'Hotel at location';
COMMENT ON TABLE Room IS 'Rooms at hotel';
COMMENT ON TABLE Booking IS 'Bookings for this hotel';
COMMENT ON TABLE Guest IS 'People who have rented a room at this hotel';

COLUMN table_name FORMAT A20
COLUMN column_name FORMAT A20
COLUMN comments FORMAT A40 WRAPPED
SET LINESIZE 132

--------------------------------------------------------------------------------------------
--1. Creating hotelCl which grabs the hotelNo, hotelName, and city from hotel
--------------------------------------------------------------------------------------------
DROP VIEW hotelCl;
CREATE VIEW hotelCl AS
    SELECT hotelNo, hotelName, city
    FROM Hotel;

--------------------------------------------------------------------------------------------
--Describing the hoteCL and then selecting each one from hotelCl. 
--------------------------------------------------------------------------------------------
DESC hotelCl;
SELECT *
    FROM Hotel;

--------------------------------------------------------------------------------------------
--2. creating a bookings to show the hotel that has the guests and their reservations. 
--------------------------------------------------------------------------------------------
DROP VIEW bookings;
CREATE VIEW bookings AS 
    SELECT h.hotelNo, h.hotelName, h.city, g.guestNo, g.guestName
    FROM Hotel h, Guest g;

--------------------------------------------------------------------------------------------
--selecting hotelNo, name and city and the guests no and name and only showing the 
--one with berry and hotel no that is H002.
--------------------------------------------------------------------------------------------
DESC bookings;
SELECT h.hotelNo, h.hotelName, h.city, g.guestNo, g.guestName
    FROM Hotel h, Guest g
    WHERE g.guestName = 'Berry Benson' AND h.hotelNo = 'H002';

--------------------------------------------------------------------------------------------
--3. creating view for rent. Checking hotel no, name, price and type of room and room no
--------------------------------------------------------------------------------------------
DROP VIEW Rent;
CREATE VIEW Rent AS 
    SELECT h.hotelNo, h.hotelName, r.price, r.type_room, r.roomNo
    FROM Hotel h, Room r;

--------------------------------------------------------------------------------------------
-- selecing hotel no, price of room, type and room no and then only viewing those that are 
--greater or equal to 200 and hotel Number equal h003.
--------------------------------------------------------------------------------------------
SELECT h.hotelNo, r.price, r.type_room, r.roomNo
    FROM Hotel h, Room r
    WHERE r.price >= '200' AND h.hotelNo = 'H003';

--------------------------------------------------------------------------------------------
--4. creating guestCheck that just gives the clients information. 
--------------------------------------------------------------------------------------------
DROP VIEW GuestCheck;
CREATE VIEW GuestCheck AS
    SELECT guestNo, guestName, guestAddress
    FROM Guest;

--------------------------------------------------------------------------------------------
--describing the guestcheck and then listing the guest info that is berry Benson only. 
--------------------------------------------------------------------------------------------
DESC GuestCheck;
SELECT guestNo, guestName, guestAddress
    FROM Guest
    WHERE guestName = 'Berry Benson';

--------------------------------------------------------------------------------------------
--5. Creating roomcheck to check the rooms in a given hotel. 
--------------------------------------------------------------------------------------------
DROP VIEW RoomCheck;
CREATE VIEW RoomCheck AS
    SELECT h.hotelNo, h.city, r.roomNo, r.type_room, r.price
    FROM Hotel h, Room r;

--------------------------------------------------------------------------------------------
--selcing the hotel no, name, city, type and price and viewing the hotel no of H003 and
--located in ontario and the type room is luxury. 
-------------------------------------------------------------------------------------------- 
DESC RoomCheck;
SELECT h.hotelNo, h.hotelName, h.city, r.type_room, r.price
    FROM Hotel h, Room r
    WHERE h.hotelNo = 'H003' AND h.city = 'Ontario' AND r.type_room = 'Luxury';

spool off

