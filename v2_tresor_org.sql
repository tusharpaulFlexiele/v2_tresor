SELECT * FROM `fe_cfg_client_m`;

SET @cl=42, @old_cl=19, @ou1=243, @ou2=244;

SELECT * FROM otipy.`fe_cfg_org_unit_type_m` WHERE cl = @cl;

SELECT *  FROM otipy.fe_org_unit_m WHERE cl= @cl AND a2 = 207  ;AND ou2 = 10114 ;

SELECT DISTINCT  ou1 FROM fe_org_unit_m WHERE cl   = @cl   AND ou1 IS NOT NULL;

#BG
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl, t2.a1 a2,t1.attribute4 a3, t1.attribute5 a4,UPPER(t1.attribute4) a5, IF(STR_TO_DATE(t1.attribute7,'%m/%d/%Y') >= CURDATE(), 1,0) a6,
	t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1
FROM 
	tresor_v1.fe_adm_business_group_m t1 
	JOIN otipy.fe_cfg_org_unit_type_m t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000001')
	LEFT JOIN  otipy.fe_org_unit_m ou1 ON(ou1.c5 = t1.attribute1 AND ou1.a2 = t2.a1)
WHERE 1
	AND t1.attribute46 = @old_cl         
	AND  t1.attribute47 = 1
	AND ou1.a1 IS NULL




#LE
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
ou1,who_created,when_created,who_updated,when_updated,c5
);S
SELECT 
	@cl, t2.a1 a2,t1.attribute2 a3, t1.attribute28 a4,UPPER(t1.attribute27) a5, IF(STR_TO_DATE(t1.attribute4,'%m/%d/%Y') >= CURDATE(), 1,0) a6,
	ou1.a1 ou1,t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1
FROM 
	tresor_v1.fe_adm_legal_entity_m t1
	JOIN otipy.`fe_cfg_org_unit_type_m` t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000002')
	LEFT JOIN otipy.fe_org_unit_m ou1 ON(ou1.c5 = t1.attribute10 AND ou1.a2  =@ou1)
	LEFT JOIN  otipy.fe_org_unit_m ou2 ON(ou2.c5 = t1.attribute1 AND ou2.a2 = t2.a1)
WHERE 1
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
	AND ou2.a1 IS NULL
#group by t1.attribute1 having count(*) > 1
;






#BU
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
ou1,ou2,who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl, t2.a1 a2,t1.attribute2 a3, t1.attribute3 a4,UPPER(t1.attribute5) a5, IF(t1.attribute4='Y', 1,0) a6,
	ou2.ou1 ou1,ou2.a1 ou2, t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1
FROM 
	tresor_v1.fe_hrm_business_unit_m t1
	JOIN otipy.`fe_cfg_org_unit_type_m` t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000005')
	LEFT JOIN otipy.fe_org_unit_m ou2 ON(ou2.c5 = t1.attribute49 AND ou2.a2 = @ou2)
	LEFT JOIN  otipy.fe_org_unit_m ou5 ON(ou5.c5 = t1.attribute1 AND ou5.a2 = t2.a1)
	#LEFT JOIN  abfrlmc.fe_org_unit_m ou5 ON(ou5.a3 = t1.attribute2 AND ou5.a2 = t2.a1)  #by name
WHERE 1
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
	#AND ou2.a1 IS NOT NULL
	AND ou5.a1 IS  NULL
#group by t1.attribute1 having count(*) > 1
;




#CC
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
ou1,ou2,who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl, t2.a1 a2,t1.attribute2 a3, t1.attribute4 a4,UPPER(t1.attribute2) a5, IF(STR_TO_DATE(t1.attribute6,'%m/%d/%Y') >= CURDATE(), 1,0) a6,
	ou2.ou1 ou1,ou2.a1 ou2, t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1
FROM #;update
	tresor_v1.fe_hrm_cost_centre_m t1
	JOIN otipy.`fe_cfg_org_unit_type_m` t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000004')
	LEFT JOIN otipy.fe_org_unit_m ou2 ON(ou2.c5 = t1.attribute3 AND ou2.a2 = @ou2)
	LEFT JOIN  otipy.fe_org_unit_m ou4 ON(ou4.c5 = t1.attribute1 AND ou4.a2 = t2.a1)
	#LEFT JOIN  abfrlmc.fe_org_unit_m ou4 ON(ou4.a3 = t1.attribute2 AND ou4.a2 = t2.a1 and ou4.ou2 = ou2.a1) #by name
	#set ou4.c5 = t1.attribute1
WHERE 1
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
	AND ou2.a1 IS NOT NULL
	AND ou4.a1 IS NULL
#group by t1.attribute1 having count(*) > 1
;


