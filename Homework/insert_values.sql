--------------------------------------------------------------------------------------------
--Justin Pulido
--insert_values.sql
--May 23rd, 2019
--------------------------------------------------------------------------------------------

spool insert_values_Output.txt

SET CONSTRAINTS ALL DEFERRED;

INSERT INTO HOTEL VALUES ('H001', 'Sun Shine', 'San Bernardino');
INSERT INTO HOTEL VALUES ('H002', 'King Stay', 'Riverside');
INSERT INTO HOTEL VALUES ('H003', 'John Wick', 'Ontario');
INSERT INTO HOTEL VALUES ('H004', 'Iron Man', 'Montclair');

INSERT INTO ROOM VALUES ('L01', 'H001', 'Luxury', '200');
INSERT INTO ROOM VALUES ('D02', 'H002', 'Double', '100');
INSERT INTO ROOM VALUES ('R01', 'H003', 'Queen', '600');
INSERT INTO ROOM VALUES ('X01', 'H004', 'King', '500');

INSERT INTO BOOKING VALUES ('H001', 'G001', '4-JAN-19', '8-JAN-19', 'L01');
INSERT INTO BOOKING VALUES ('H002', 'G001', '11-FEB-19', '15-FEB-19', 'D02');
INSERT INTO BOOKING VALUES ('H003', 'G002', '09-MAR-19', '14-MAR-19', 'R01');
INSERT INTO BOOKING VALUES ('H002', 'G002', '12-DEC-19', '15-DEC-19', 'D02');
INSERT INTO BOOKING VALUES ('H004', 'G003', '05-NOV-19', '15-NOV-19', 'X01');
INSERT INTO BOOKING VALUES ('H002', 'G003', '18-JUL-19', '21-JUL-19', 'L01');


INSERT INTO GUEST VALUES ('G001', 'Larry Whites', '124 Main street, Riverside 92403');
INSERT INTO GUEST VALUES ('G002', 'Berry Benson', '134 Main street, Riverside 92403');
INSERT INTO GUEST VALUES ('G003', 'Pegasus Harrington', '144 Main street, Riverside 92403');


SET CONSTRAINTS ALL IMMEDIATE;

SET PAUSE OFF
SELECT * FROM HOTEL;
SELECT * FROM ROOM;
SELECT * FROM BOOKING;
SELECT * FROM GUEST;
SET PAUSE ON

spool off
