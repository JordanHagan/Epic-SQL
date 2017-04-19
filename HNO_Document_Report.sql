SELECT LOC.LOC_NAME, PE.PAT_ID, PE.PAT_ENC_CSN_ID, HNO.NOTE_ID, IP_NOTE_TYPE_C, ZC1.NAME as IPNoteName, HNO.NOTE_TYPE_NOADD_C, HNO.NOTE_DESC
FROM PAT_ENC_HSP PE 
LEFT OUTER JOIN HNO_INFO HNO ON PE.PAT_ENC_CSN_ID = HNO.PAT_ENC_CSN_ID 
LEFT OUTER JOIN CLARITY_DEP DEP ON PE.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
LEFT OUTER JOIN ZC_NOTE_TYPE_IP ZC1 ON HNO.IP_NOTE_TYPE_C = ZC1.TYPE_IP_C 
Left Outer Join CLARITY_LOC LOC
on DEP.REV_LOC_ID=LOC.LOC_ID
WHERE DEP.REV_LOC_ID IN ('12434259','12434258') 


SELECT PE.PAT_ID, PE.PAT_ENC_CSN_ID, HNO.NOTE_ID, IP_NOTE_TYPE_C, TY.Name as NOTE_TYPE,  PU.Name as NOTE_PURPOSE, SER.PROV_NAME, LOC.LOC_NAME
FROM PAT_ENC_HSP PE 
LEFT OUTER JOIN HNO_INFO HNO ON PE.PAT_ENC_CSN_ID = HNO.PAT_ENC_CSN_ID 
LEFT OUTER JOIN CLARITY_DEP DEP ON PE.DEPARTMENT_ID = DEP.DEPARTMENT_ID 
Left Outer Join IP_NOTE IP
on HNO.NOTE_ID= IP.NOTE_ID
Inner Join ZC_NOTE_PURPOSE PU
On IP.NOTE_PURPOSE_C=PU.NOTE_PURPOSE_C
Inner Join ZC_NOTE_TYPE_IP TY
On IP. TYPE_IP_C=TY.TYPE_IP_C
Inner Join CLARITY_SER SER
On IP.NOTE_PROVIDER_ID=SER.PROV_ID
Inner Join (Select LOC_ID, LOC_NAME
From CLARITY_LOC
Where LOC_ID  IN ('12434259','12434258') ) as LOC
on DEP.REV_LOC_ID=LOC.LOC_ID
