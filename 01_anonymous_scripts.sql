-- select query
SELECT prd.id,prd.nombre, prd.detalles, prd.precio_unitario,prd.skuid,  prd.codigo_barra

FROM KEVINDB.PRODUCTOS PRD
WHERE PRD.ID = 1

-- fetch data from stored procedure and print
DECLARE
    TYPE T_CURSOR IS REF CURSOR;

    ROW_CURSOR T_CURSOR%ROWTYPE; 
BEGIN
    loop    
        fetch t_cursor 
        into nombre_cliente, apellidos_cliente, fecha_creacion_cliente;
        exit when t_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || nombre_cliente || ' ' || apellidos_cliente || ' ' ||fecha_creacion_cliente);
    end loop;

    OPEN comp_cur; 
    FETCH comp_cur 
    INTO ROW_CURSOR;

END


-- fetch data from cursor
DECLARE
VARIABLE l_cursor REFCURSOR;
T_CURSOR SYS_REFCURSOR;
BEGIN
  
   mp_p_Listar_beneficios_mpe 
    (
     p_tipoDoc     => 'DNI',
     p_NumDoc      => '12345678',
     p_tipoBeneficio      => '',
     C_Cursor        =>  T_CURSOR
   )

    :l_cursor := T_CURSOR;

END;

PRINT l_cursor