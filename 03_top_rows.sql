-- indicator goes in where clause
        select
              BenefCome.C_DESC_CORTA_BENE as Code
        FROM TRON2000.SEGMENTO_BENEFICIO SegBen
		where 1 = 1 --this is only for code formatting
        and ROWNUM <= 10
