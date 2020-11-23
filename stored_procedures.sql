SET SERVEROUTPUT ON;

--DECLARE
CREATE OR REPLACE PROCEDURE PRIMER_CLIENTE  is
-- VARIABLES A USAR
    nombre_cliente varchar2(100);
    apellidos_cliente varchar2(100);
    fecha_creacion_cliente date;
    --cursor cliente_cur is select nombre, apellidos, creado from clientes where nombre = nombre_param;
BEGIN
--SENTENCIAS

    SELECT  nombre, apellidos, creado INTO nombre_cliente, apellidos_cliente, fecha_creacion_cliente
    FROM clientes
    WHERE ROWNUM = 1
    ORDER BY creado DESC;
    
    DBMS_OUTPUT.PUT_LINE('Cliente: ' || nombre_cliente || ' ' || apellidos_cliente || ' ' ||fecha_creacion_cliente);
END;



EXEC BUSCAR_CLIENTE('Jose');