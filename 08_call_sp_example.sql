/*SET DEFINE OFF;
VARIABLE l_cursor refcursor;
BEGIN
   mp_p_Listar_beneficios_mpe 
    (
     p_tipoDoc     => 'DNI',
     p_NumDoc      => '12345678',
     p_tipoBeneficio      => '',
     C_Cursor        =>  l_cursor
   );
END;    

*/


DECLARE
  P_TIPODOC VARCHAR2(200);
  P_NUMDOC VARCHAR2(200);
  P_TIPOBENEFICIO VARCHAR2(200);
  C_CURSOR SYS_REFCURSOR;
BEGIN
  P_TIPODOC := 'DNI';
  P_NUMDOC := '12345678';
  P_TIPOBENEFICIO := NULL;

  MP_P_LISTAR_BENEFICIOS_MPE(
    P_TIPODOC => P_TIPODOC,
    P_NUMDOC => P_NUMDOC,
    P_TIPOBENEFICIO => P_TIPOBENEFICIO,
    C_CURSOR => C_CURSOR
  );
  /* Legacy output: 
DBMS_OUTPUT.PUT_LINE('C_CURSOR = ' || C_CURSOR);
*/ 
  C_CURSOR := C_CURSOR; --<-- Cursor
  DBMS_SQL.return_result(C_CURSOR);
--rollback; 
END; 

                                       