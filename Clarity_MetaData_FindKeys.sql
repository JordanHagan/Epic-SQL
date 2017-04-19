SELECT distinct CLARITY_TBL.TABLE_NAME AS Source_Table,
       CLARITY_TBL_FK.LINK_NAME,
       CLARITY_TBL_FK.IS_FKEY_LINK_YN,
       CLARITY_SOURCE_COL.COLUMN_NAME AS Source_Col,
       CLARITY_DESTNATN_TBL.TABLE_NAME AS Dest_Table,
       CLARITY_DESTNATN_COL.COLUMN_NAME AS Dest_Col

  FROM  CLARITY.CLARITY_TBL_FK CLARITY_TBL_FK
        LEFT JOIN
        CLARITY.CLARITY_COL CLARITY_SOURCE_COL
        ON CLARITY_TBL_FK.SOURCE_COLUMN_ID = CLARITY_SOURCE_COL.COLUMN_ID

        LEFT JOIN
        CLARITY.CLARITY_TBL CLARITY_TBL
        ON CLARITY_TBL.TABLE_ID = CLARITY_TBL_FK.TABLE_ID

        LEFT JOIN
        CLARITY.CLARITY_TBL CLARITY_DESTNATN_TBL
        ON CLARITY_TBL_FK.DESTNATN_TABLE_ID = CLARITY_DESTNATN_TBL.TABLE_ID

        LEFT JOIN
        CLARITY.CLARITY_COL CLARITY_DESTNATN_COL
        ON CLARITY_TBL_FK.DESTNATN_COLUMN_ID = CLARITY_DESTNATN_COL.COLUMN_ID

WHERE CLARITY_TBL.TABLE_NAME = "<insert Clarity table name here>