
UPDATE dbo.Real_Estate
SET Residential_Type = 'NA'
WHERE Residential_Type IS NULL;

UPDATE dbo.Real_Estate
SET Non_Use_Code = 'NA'
WHERE Non_Use_Code IS NULL;

UPDATE dbo.Real_Estate
SET Assessor_Remarks = 'NA'
WHERE Assessor_Remarks IS NULL;

UPDATE dbo.Real_Estate
SET OPM_remarks = 'NA'
WHERE OPM_remarks IS NULL;

UPDATE dbo.Real_Estate
SET Location = 'NA'
WHERE Location IS NULL;

--convertir en mayuscula 

UPDATE dbo.Real_Estate
SET Residential_Type = UPPER(Residential_Type)

UPDATE dbo.Real_Estate
SET Non_Use_Code = UPPER(Non_Use_Code)

UPDATE dbo.Real_Estate
SET Assessor_Remarks = UPPER(Assessor_Remarks)

UPDATE dbo.Real_Estate
SET OPM_remarks = UPPER(OPM_remarks)

UPDATE dbo.Real_Estate
SET Location = UPPER(Location)

UPDATE dbo.Real_Estate
SET Town = UPPER(Town) 

--Actualizar fecha a formato iso 

UPDATE dbo.Real_Estate
SET Date_Recorded = FORMAT(Date_Recorded, 'yyyy-MM-dd');
