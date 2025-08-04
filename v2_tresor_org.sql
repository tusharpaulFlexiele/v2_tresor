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


#Department  -- missing  1 row it old table
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
ou1,ou2,ou5,who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl, t2.a1 a2,t1.attribute2 a3, t1.attribute6 a4,UPPER(t1.attribute2) a5, IF(STR_TO_DATE(t1.attribute4,'%m/%d/%Y') >= CURDATE(), 1,0) a6,
	ou2.ou1 ou1,ou2.a1 ou2,ou5.a1 ou5, t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1     
FROM #;update
	tresor_v1.fe_hrm_department_m t1
	JOIN otipy.`fe_cfg_org_unit_type_m` t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000006')
	LEFT JOIN otipy.fe_org_unit_m ou2 ON(ou2.c5 = t1.attribute5 AND ou2.a2 = @ou2)
	JOIN otipy.`fe_cfg_org_unit_type_m` oum5 ON(oum5.cl = @cl AND oum5.a4 = 'OUM0000005')
	LEFT JOIN otipy.fe_org_unit_m ou5 ON(ou5.c5 = t1.attribute40 AND ou5.a2 = oum5.a1 AND ou5.ou2=ou2.a1)
	LEFT JOIN  otipy.fe_org_unit_m ou6 ON(ou6.c5 = t1.attribute1 AND ou6.a2 = t2.a1)
	#LEFT JOIN  abfrlmc.fe_org_unit_m ou6 ON(ou6.a3 = t1.attribute2 AND ou6.a2 = t2.a1 and ou6.ou2 = ou2.a1) #by name
	#set ou6.c5 = t1.attribute1
WHERE 1
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
	AND ou2.a1 IS NOT NULL
	AND ou6.a1 IS NULL
	
#group by t1.attribute1 having count(*) > 1
;



#sub-department  -- no values in old table and no old table exist in tresor_v1
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
ou1,ou2,ou5,ou6,who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl, t2.a1 a2,t1.attribute2 a3, t1.attribute3 a4,UPPER(t1.attribute2) a5, IF(STR_TO_DATE(t1.attribute5,'%m/%d/%Y') >= CURDATE(), 1,0) a6,
	ou6.ou1 ou1,ou6.a1 ou2,ou6.ou5 ou5,ou6.a1 ou6, t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1
FROM# ;update
	tresor_v1.fe_hrm_division_m t1
	JOIN otipy.`fe_cfg_org_unit_type_m` t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000007')
	JOIN otipy.`fe_cfg_org_unit_type_m` oum6 ON(oum6.cl = @cl AND oum6.a4 = 'OUM0000006')
	LEFT JOIN otipy.fe_org_unit_m ou6 ON(ou6.c5 = t1.attribute7 AND ou6.a2 = oum6.a1)
	LEFT JOIN otipy.fe_org_unit_m ou7 ON(ou7.c5 = t1.attribute1 AND ou7.a2 = t2.a1)
	#LEFT JOIN abfrlmc.fe_org_unit_m ou7 ON(ou7.a3 = t1.attribute2 AND ou7.a2 = t2.a1 AND ou7.ou6 = ou6.a1) #by name
	#set ou7.c5 = t1.attribute1
WHERE 1
	#AND IFNULL(t1.attribute7,0) > 0
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
	AND ou7.a1 IS   NULL
#group by t1.attribute1 having count(*) > 1



#Location
INSERT INTO otipy.fe_org_unit_m(
cl,a2,a3,a4,a5,a6,
ou1,ou2,who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl, t2.a1 a2,t1.attribute4 a3, t1.attribute10 a4,UPPER(t1.attribute4) a5, IF(STR_TO_DATE(t1.attribute17,'%m/%d/%Y') >= CURDATE(), 1,0) a6,
	ou2.ou1 ou1,ou2.a1 ou2, t1.who_created,t1.when_created,t1.who_updated,t1.when_updated,t1.attribute1
FROM #;update
	tresor_v1.fe_hrm_location_m t1
	JOIN otipy.`fe_cfg_org_unit_type_m` t2 ON(t2.cl = @cl AND t2.a4 = 'OUM0000009')
	LEFT JOIN otipy.fe_org_unit_m ou2 ON(ou2.c5 = t1.attribute49 AND ou2.a2 = @ou2)
	LEFT JOIN  otipy.fe_org_unit_m ou9 ON(ou9.c5 = t1.attribute1 AND ou9.a2 = t2.a1)
	#LEFT JOIN  abfrlmc.fe_org_unit_m ou9 ON(ou9.a3 = t1.attribute4 AND ou9.a2 = t2.a1 and ou9.ou2 = ou2.a1) #by name
	#set ou9.c5 = t1.attribute1
WHERE 1
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
	AND ou2.a1 IS NOT NULL
	AND ou9.a1 IS  NULL
#group by t1.attribute1 having count(*) > 1
;





INSERT INTO fe_org_unit_detail_m(
cl,a2,a3,a4,a5,a6,a9,a11,a13,a14,a15,a16,a18,
c1,c2,c3,c4,c6,c7,c8,c9,c10,
who_created,when_created,who_updated,when_updated,c5
);
SELECT 
	@cl,ou9.a1 a2,cont2.a1 a3, st.a1 a4, t1.attribute14 a5, t1.attribute18 a6,
	CASE t1.attribute6 
		WHEN 1 THEN 1
		WHEN 2 THEN 2
		WHEN 3 THEN 3
		ELSE NULL
	END a9,
	CONCAT(IFNULL(t1.attribute8,''),' ,',IFNULL(t1.attribute9,'')) a11, IF(IFNULL(t1.attribute23,0)>0,'1111',0) a13,'1111' a14,'1111' a15, t1.c_attribute7 a16,NULL a18,
	t1.c_attribute3,t1.c_attribute4,t1.c_attribute5,t1.c_attribute6,t1.c_attribute7,t1.c_attribute8,t1.c_attribute9,t1.c_attribute10,t1.c_attribute11,
	t1.who_created,t1.when_created,t1.who_updated,t1.when_updated	, t1.attribute1
FROM 
	tresor_v1.fe_hrm_location_m t1
	LEFT JOIN otipy.fe_org_unit_m ou9 ON(ou9.c5 = t1.attribute1 AND ou9.a2 = 251)
	LEFT JOIN tresor_v1.`fe_adm_country_m` cont ON(cont.attribute1 = t1.attribute21)
	LEFT JOIN otipy.`fe_glb_country_g` cont2 ON(cont2.a2 = cont.attribute3)
	LEFT JOIN otipy.`fe_glb_state_g` st ON(st.a4 = t1.attribute16 AND st.a2 = cont2.a1)
	LEFT JOIN otipy.`fe_cfg_locale_m` lc ON(lc.a3 = t1.attribute32)
WHERE 1
	AND t1.attribute46 = @old_cl
	AND  t1.attribute47 = 1
#group by t1.attribute1 having count(*) > 1
;



