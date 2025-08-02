SELECT * FROM fe_cfg_org_unit_type_m t2 WHERE t2.cl=42 









SELECT * FROM fe_org_unit_m ou1 JOIN `fe_cfg_org_unit_type_m` t1 ON (t1.a1 = ou1.a2)  WHERE ou1.cl=42 AND t1.a4 ='OUM0000001'