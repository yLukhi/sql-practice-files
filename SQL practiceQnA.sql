SELECT first_name, last_name, gender 
FROM patients
WHERE gender == 'M'
-- 
SELECT first_name, last_name 
FROM patients
WHERE allergies IS NULL;
-- 
SELECT first_name
FROM patients
WHERE first_name  LIKE 'C%';
-- 
SELECT first_name, last_name
FROM patients
WHERE weightt between 100 AND  120 ;
-- 
UPDATE 
	patients
SET 
	allergies = 'NKA'
WHERE 
	allergies IS NULL;
-- 
SELECT
concat  
	(first_name,' ',last_name) AS full_name
FROM 
	patients;
-- 
SELECT
	first_name,
    last_name,
    province_name
FROM patients
JOIN province_names ON province_names.province_id = patients.province_id;
-- 
SELECT
	count(*) AS total_patients
FROM patients
WHERE year(birth_date) = 2010;
-- 
SELECT
	first_name,
    last_name,
    max(height) AS height
FROM patients
-- 
SELECT * 
FROM patients
WHERE patient_id IN (1,45,534,879,1000) ;
-- 
SELECT count(*) AS total_admissions 
FROM admissions;
-- 
SELECT *
FROM admissions
WHERE admission_date IS discharge_date ;
-- 
SELECT 
	patient_id,
    count(*) AS tota_admissions
FROM admissions
WHERE patient_id = 579 ;
-- 
SELECT 
    distinct(city)
FROM patients
WHERE province_id = 'NS' ;
-- 
SELECT 
    first_name,
    last_name,
    birth_date
FROM patients
WHERE height > 160 AND weightt > 70 ;
-- 
SELECT 
    first_name,
    last_name,
    allergies
FROM patients
WHERE 
	city IS 'Hamilton' 
	AND allergies IS NOT NULL ;
-- 
SELECT 
    distinct(city)
FROM patients
WHERE 
	city LIKE 'a%'
    OR city LIKE 'e%'
    OR city LIKE 'i%'
    OR city LIKE 'o%'
    OR city LIKE 'u%'
ORDER BY city
-- 
SELECT distinct(year(birth_date))
FROM patients
ORDER BY birth_date ASC
-- 
SELECT 
	distinct(year(birth_date)) AS birth_year
FROM patients
ORDER BY birth_date;
-- 
SELECT (first_name)
FROM patients
GROUP BY first_name
HAVING count(first_name) = 1
-- 
SELECT
  patient_id,
  first_name
FROM patients
WHERE first_name LIKE 's____%s'
-- 
SELECT
  patient_id,
  first_name
FROM patients
WHERE
  first_name LIKE 's%'
  AND first_name LIKE '%s'
  AND len(first_name) >= 6;
--   
SELECT
  patient_id,
  first_name
FROM patients
WHERE
  first_name LIKE 's%s'
  AND len(first_name) >= 6;
--   
SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
  );
--   
SELECT
  patients.patient_id,
  first_name,
  last_name
FROM patients
JOIN admissions ON admissions.patient_id = patients.patient_id
WHERE diagnosis = 'Dementia';
-- 
SELECT
  first_name
FROM patients
ORDER BY
  len(first_name),
  first_name
-- 
SELECT 
	(SELECT count(*) FROM patients WHERE gender='M') AS total_male,
    (SELECT count(*) FROM patients WHERE gender='F') AS total_female
-- 
SELECT
  first_name,
  last_name,
  allergies
FROM patients
WHERE
  allergies = 'Penicillin'
  OR allergies = 'Morphine'
ORDER BY
  allergies,
  first_name,
  last_name
--   
SELECT
  first_name,
  last_name,
  allergies
FROM patients
WHERE
  allergies IN ('Penicillin', 'Morphine')
ORDER BY
  allergies,
  first_name,
  last_name;
--   
SELECT
  patient_id,
  diagnosis
FROM admissions
GROUP BY
  patient_id,
  diagnosis
HAVING count (*) > 1;
-- 
SELECT
  city,
  count(*) AS num_patients
FROM patients
GROUP BY city
ORDER BY
  num_patients DESC,
  city ASC
-- 
SELECT first_name, last_name, 'Patient' AS rolee FROM patients
union all
SELECT first_name, last_name, 'Doctor' FROM doctors
-- 
SELECT
  allergies,
  count(*) AS total_diagnosis
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY total_diagnosis DESC
-- 
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  year(birth_date) >= 1970
  AND year(birth_date) <= 1979
ORDER BY birth_date ASC
-- 
SELECT
  first_name,
  last_name,
  birth_date
FROM patients
WHERE
  YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date ASC;
-- 
SELECT concat(upper(last_name), ',', lower(first_name)) AS full_name
FROM patients
ORDER BY first_name DESC;
-- 
------
------ doc format karvanu baki che
------
SELECT
  province_id,
  ceil(sum(height)) as heightt
FROM patients
group by province_id
having sum(height) >= 7000
--
select (max(weight) - min(weight)) as weight_delta 
from patients
where last_name is 'Maroni'
-- 
SELECT
	day(admission_date) as day_number,
	count(*) as number_of_admission
FROM admissions
group by day_number
order by number_of_admission desc
-- 
SELECT *
FROM admissions
WHERE patient_id = 542
GROUP BY patient_id
HAVING
  admission_date = MAX(admission_date);
-- 
SELECT
  patient_id,
  attending_doctor_id,
  diagnosis
FROM admissions
where
  (
    (attending_doctor_id in (1, 5, 19))
    and (patient_id % 2 != 0)
  )
  or (
    (attending_doctor_id like '%2%')
    and (len(patient_id) = 3)
  )
-- 
SELECT
  first_name,
  last_name,
  count(*) as admissons_total
FROM doctors
join admissions on admissions.attending_doctor_id=doctors.doctor_id
group by doctor_id
-- 
SELECT
  first_name,
  last_name,
  count(*) as admissions_total
from admissions a
join doctors ph on ph.doctor_id = a.attending_doctor_id
group by attending_doctor_id
-- 
SELECT
  first_name,
  last_name,
  count(*)
from
  doctors p,
  admissions a
where
  a.attending_doctor_id = p.doctor_id
group by p.doctor_id;
-- 
select
  doctor_id,
  first_name || ' ' || last_name as full_name,
  min(admission_date) as first_admission_date,
  max(admission_date) as last_admission_date
from admissions a
  join doctors ph on a.attending_doctor_id = ph.doctor_id
group by doctor_id;
-- 
SELECT
  doctor_id,
  concat(first_name, ' ', last_name) as full_name,
  min(admission_date) as first_admission,
  max(admission_date) as last_admission
FROM admissions a
join doctors ph on a.attending_doctor_id = ph.doctor_id 
group by doctor_id
-- 
SELECT pa.province_name, count(*) as total_amount_patients
FROM patients p
join province_names pa on p.province_id=pa.province_id
group by pa.province_name
order by total_amount_patients desc
-- 
SELECT
  province_name,
  COUNT(*) as patient_count
FROM patients pa
  join province_names pr on pr.province_id = pa.province_id
group by pr.province_id
order by patient_count desc;
-- 
