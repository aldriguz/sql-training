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
END PRIMER_CLIENTE;


create or replace PROCEDURE Buscar_Cliente (nombre_param in varchar2) is
-- VARIABLES A USAR
    nombre_cliente varchar2(100);
    apellidos_cliente varchar2(100);
    fecha_creacion_cliente date;
    cursor cliente_cur is select nombre, apellidos, creado from clientes where nombre = nombre_param;
BEGIN
--SENTENCIAS
    open cliente_cur;
    loop    
        fetch cliente_cur into nombre_cliente, apellidos_cliente, fecha_creacion_cliente;
        exit when cliente_cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Cliente: ' || nombre_cliente || ' ' || apellidos_cliente || ' ' ||fecha_creacion_cliente);
    end loop;

END Buscar_Cliente;




-- creating external stored procedure

CREATE OR REPLACE PROCEDURE OBTENER_PRODUCTO_BYID 
(
  ID_PRODUCTO IN NUMBER,
  C_Cursor    OUT  SYS_REFCURSOR 
) IS

V_QUERY2   VARCHAR2 (5000);


BEGIN
 
 V_QUERY2 := '';
      
      V_QUERY2 := V_QUERY2 || 'SELECT prd.id, prd.nombre, prd.detalles, prd.precio_unitario,prd.skuid,  prd.codigo_barra
                                FROM KEVINDB.PRODUCTOS PRD
                                WHERE PRD.ID = 1
                              ';

     OPEN C_Cursor FOR (V_QUERY2);
 
END OBTENER_PRODUCTO_BYID;



