SELECT 
UCL.UCL_ID,
UCL.REVENUE_LOCATION_ID,
LOC.LOC_NAME as REVENUE_LOCATION_NAME,
UCL.SERVICE_AREA_ID,
LOC2.LOC_NAME as SERVICE_AREA_LOCATION_NAME,
PAT.PAT_ID,
PAT.PAT_NAME,
PAT.PAT_MRN_ID,
ENC.CONTACT_DATE as ENCOUNTER_CONTACT_DATE,
UCL.SERVICE_DATE_DT,
ZC1.NAME as ENCOUNTER_TYPE,
UCL.PROCEDURE_ID,
EAP.PROC_CODE,
EAP.PROC_NAME, 
EAP.PROC_CAT as PROCEDURE_CATEGORY,
UCL.DEPARTMENT_ID,
DEP.GL_PREFIX,
DEP.DEPARTMENT_NAME as DEP_ASSOC_W_CHARG,
DEP2.DEPARTMENT_NAME as DEP_COST_CENTER,
LOC4.LOC_NAME as DEPARTMENT_REVENUE_LOC,
LOC3.LOC_NAME as UCL_PLACE_OF_SERVICE_LOC, 
SER.PROV_NAME as BILLING_PROVIDER_ID

FROM 
CLARITY_UCL UCL 
Left Join CLARITY_LOC LOC on LOC.LOC_ID=UCL.REVENUE_LOCATION_ID
Left Join CLARITY_LOC LOC2 on LOC2.LOC_ID=UCL.SERVICE_AREA_ID
Left Join PATIENT PAT on PAT.PAT_ID=UCL.PATIENT_ID
Left Join PAT_ENC ENC on ENC.PAT_ENC_CSN_ID=UCL.EPT_CSN
Left Join CLARITY_EAP EAP on EAP.PROC_ID=UCL.PROCEDURE_ID
Left Join CLARITY_DEP DEP on DEP.DEPARTMENT_ID=UCL.DEPARTMENT_ID
Left Join CLARITY_LOC LOC3 on LOC3.LOC_ID=UCL.PLACE_OF_SERVICE_ID
Left Join CLARITY_SER SER on SER.PROV_ID=UCL.BILLING_PROVIDER_ID
Left Join CLARITY_DEP DEP2 on DEP2.DEPARTMENT_ID=UCL.COST_CNTR_DEPT_ID
Left Join ZC_DISP_ENC_TYPE ZC1 on ZC1.DISP_ENC_TYPE_C=ENC.ENC_TYPE_C
Left Join CLARITY_LOC LOC4 on LOC4.LOC_ID=DEP.REV_LOC_ID

WHERE
DEP.DEPARTMENT_ID = any ('1211000350031', --RADIOLOGY GENRAD RKCK 
										'1211000350014') --ORTHO RKCK
and PAT.PAT_ID not in (Select PAT_ID 
			From PATIENT_TYPE 
			Where PATIENT_TYPE_C=1214)

