/*
 * packages has header (declaration) and body (content of scripts logic), should be created separated
 */


-- HEADER
create or replace PACKAGE PKG_QUERIES_SEARCH 
AS
    TYPE T_CURSOR IS REF CURSOR;

    PROCEDURE PRIMER_CLIENTE;
    PROCEDURE BUSCAR_CLIENTE (nombre_param in varchar2);
    FUNCTION PROXIMO_ANIVERSARIO(ID_CLIENTE IN NUMBER) RETURN NUMBER;
    PROCEDURE BUSCAR_PRODUCTO_BYNOMBRE (nombre_prd in varchar2, t_cursor OUT T_CURSOR);
END;


--BODY
create or replace PACKAGE BODY PKG_QUERIES_SEARCH 
IS

    PROCEDURE PRIMER_CLIENTE  is
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


    PROCEDURE BUSCAR_CLIENTE (nombre_param in varchar2) is
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

    END BUSCAR_CLIENTE;

    FUNCTION PROXIMO_ANIVERSARIO ( ID_CLIENTE IN NUMBER ) RETURN NUMBER 
    IS
            FECHA_ANIVERSARIO NUMBER := 10;
    BEGIN

       --FECHA_ANIVERSARIO := ID_CLIENTE + 1;

      RETURN FECHA_ANIVERSARIO * ID_CLIENTE;

    END PROXIMO_ANIVERSARIO;


    PROCEDURE BUSCAR_PRODUCTO_BYNOMBRE (
        nombre_prd in varchar2
        ,t_cursor OUT t_cursor
    )
    AS 
        prd_nombre NVARCHAR2(100);
        prd_skuid NVARCHAR2(20);
        t_record t_cursor%ROWTYPE;
    BEGIN
        obtener_producto_byid('', t_cursor);
        
        open t_cursor;
        FETCH t_cursor into t_record;
        close t_cursor;
        --exec obtener_producto_byid(nombre_prd, t_cursor);  
        
        /*loop    
            fetch t_cursor 
            into nombre_cliente, apellidos_cliente, fecha_creacion_cliente;
            exit when t_cursor%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('Cliente: ' || nombre_cliente || ' ' || apellidos_cliente || ' ' ||fecha_creacion_cliente);
        end loop;
        
        OPEN t_cursor FOR
		SELECT prd.id,prd.nombre, prd.detalles, prd.precio_unitario,prd.skuid,  prd.codigo_barra
        FROM KEVINDB.PRODUCTOS PRD
        WHERE PRD.ID = 1;
        */
    END BUSCAR_PRODUCTO_BYNOMBRE;

END PKG_QUERIES_SEARCH;