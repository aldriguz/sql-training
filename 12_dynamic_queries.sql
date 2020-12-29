/*
  Using Toad for Oracle
	1. F9 (to run the statement)
	2. Select type: CURSOR	
*/


DECLARE
    P_CURSOR   SYS_REFCURSOR;
BEGIN
    OPEN P_CURSOR FOR 'select * from TRON2000.G010007_EXT where rownum <= 10';   
    :1 := P_CURSOR;
END;