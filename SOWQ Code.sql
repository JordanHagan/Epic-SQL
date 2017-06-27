Select
ORD.ORDER_PROC_ID,
ORD.ORDERING_DATE, 
ORD.PROC_ID,
EAP.PROC_NAME, 
ORD.DESCRIPTION,
ORD.FUTURE_OR_STAND, 
ORD.STANDING_EXP_DATE,
SER.PROV_NAME,
LOC.DEPARTMENT_NAME

From ORDER_PROC ORD 
Left Join CLARITY_EAP EAP on ORD.PROC_ID=EAP.PROC_ID
Left Join CLARITY_SER SER on ORD.AUTHRZING_PROV_ID=SER.PROV_ID
Left Join ORDER_PROC_2 ORD2 on ORD.ORDER_PROC_ID=ORD2.ORDER_PROC_ID
Left Join CLARITY_DEP LOC on ORD2.PAT_LOC_ID=LOC.DEPARTMENT_ID

Where ORD.PROC_ID='121106271' --FOLLOW-UP PROCEDURE
And DEPARTMENT_NAME like '%CARD%' --CARDIOLOGY DEPARTMENTS