-- 1.1
CREATE VIEW total_instruments_per_month AS
SELECT * FROM
(
  SELECT 'januari' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-01-01' AND lease_period_start < '2020-02-01')
  OR (lease_period_end >= '2020-01-01' AND lease_period_end < '2020-02-01')
  OR (lease_period_start < '2020-01-01' AND lease_period_end >= '2020-02-01')

  UNION ALL

  SELECT 'februari' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-02-01' AND lease_period_start < '2020-03-01')
  OR (lease_period_end >= '2020-02-01' AND lease_period_end < '2020-03-01')
  OR (lease_period_start < '2020-02-01' AND lease_period_end >= '2020-03-01')

  UNION ALL

  SELECT 'mars' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-03-01' AND lease_period_start < '2020-04-01')
  OR (lease_period_end >= '2020-03-01' AND lease_period_end < '2020-04-01')
  OR (lease_period_start < '2020-03-01' AND lease_period_end >= '2020-04-01')

  UNION ALL

  SELECT 'april' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-04-01' AND lease_period_start < '2020-05-01')
  OR (lease_period_end >= '2020-04-01' AND lease_period_end < '2020-05-01')
  OR (lease_period_start < '2020-04-01' AND lease_period_end >= '2020-05-01')

  UNION ALL

  SELECT 'maj' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-05-01' AND lease_period_start < '2020-06-01')
  OR (lease_period_end >= '2020-05-01' AND lease_period_end < '2020-06-01')
  OR (lease_period_start < '2020-05-01' AND lease_period_end >= '2020-06-01')

  UNION ALL

  SELECT 'juni' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-06-01' AND lease_period_start < '2020-07-01')
  OR (lease_period_end >= '2020-06-01' AND lease_period_end < '2020-07-01')
  OR (lease_period_start < '2020-06-01' AND lease_period_end >= '2020-07-01')

  UNION ALL

  SELECT 'juli' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-07-01' AND lease_period_start < '2020-08-01')
  OR (lease_period_end >= '2020-07-01' AND lease_period_end < '2020-08-01')
  OR (lease_period_start < '2020-07-01' AND lease_period_end >= '2020-08-01')

  UNION ALL

  SELECT 'augusti' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-08-01' AND lease_period_start < '2020-09-01')
  OR (lease_period_end >= '2020-08-01' AND lease_period_end < '2020-09-01')
  OR (lease_period_start < '2020-08-01' AND lease_period_end >= '2020-09-01')

  UNION ALL

  SELECT 'september' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-09-01' AND lease_period_start < '2020-10-01')
  OR (lease_period_end >= '2020-09-01' AND lease_period_end < '2020-10-01')
  OR (lease_period_start < '2020-09-01' AND lease_period_end >= '2020-10-01')

  UNION ALL

  SELECT 'oktober' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-10-01' AND lease_period_start < '2020-11-01')
  OR (lease_period_end >= '2020-10-01' AND lease_period_end < '2020-11-01')
  OR (lease_period_start < '2020-10-01' AND lease_period_end >= '2020-11-01')

  UNION ALL

  SELECT 'november' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-11-01' AND lease_period_start < '2020-12-01')
  OR (lease_period_end >= '2020-11-01' AND lease_period_end < '2020-12-01')
  OR (lease_period_start < '2020-11-01' AND lease_period_end >= '2020-12-01')

  UNION ALL

  SELECT 'december' as month, 'all instruments' as instrument, COUNT(*) FROM rented_instrument
  WHERE (lease_period_start >= '2020-12-01' AND lease_period_start < '2021-01-01')
  OR (lease_period_end >= '2020-12-01' AND lease_period_end < '2021-01-01')
  OR (lease_period_start < '2020-12-01' AND lease_period_end >= '2021-01-01')
)as foo

UNION ALL
-- del två av 1.1
SELECT * FROM
(
  SELECT 'januari' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-01-01' AND lease_period_start < '2020-02-01')
  OR (lease_period_end >= '2020-01-01' AND lease_period_end < '2020-02-01')
  OR (lease_period_start < '2020-01-01' AND lease_period_end >= '2020-02-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'februari' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-02-01' AND lease_period_start < '2020-03-01')
  OR (lease_period_end >= '2020-02-01' AND lease_period_end < '2020-03-01')
  OR (lease_period_start < '2020-02-01' AND lease_period_end >= '2020-03-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'mars' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-03-01' AND lease_period_start < '2020-04-01')
  OR (lease_period_end >= '2020-03-01' AND lease_period_end < '2020-04-01')
  OR (lease_period_start < '2020-03-01' AND lease_period_end >= '2020-04-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'april' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-04-01' AND lease_period_start < '2020-05-01')
  OR (lease_period_end >= '2020-04-01' AND lease_period_end < '2020-05-01')
  OR (lease_period_start < '2020-04-01' AND lease_period_end >= '2020-05-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'maj' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-05-01' AND lease_period_start < '2020-06-01')
  OR (lease_period_end >= '2020-05-01' AND lease_period_end < '2020-06-01')
  OR (lease_period_start < '2020-05-01' AND lease_period_end >= '2020-06-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'juni' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-06-01' AND lease_period_start < '2020-07-01')
  OR (lease_period_end >= '2020-06-01' AND lease_period_end < '2020-07-01')
  OR (lease_period_start < '2020-06-01' AND lease_period_end >= '2020-07-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'juli' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-07-01' AND lease_period_start < '2020-08-01')
  OR (lease_period_end >= '2020-07-01' AND lease_period_end < '2020-08-01')
  OR (lease_period_start < '2020-07-01' AND lease_period_end >= '2020-08-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'augusti' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-08-01' AND lease_period_start < '2020-09-01')
  OR (lease_period_end >= '2020-08-01' AND lease_period_end < '2020-09-01')
  OR (lease_period_start < '2020-08-01' AND lease_period_end >= '2020-09-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'september' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-09-01' AND lease_period_start < '2020-10-01')
  OR (lease_period_end >= '2020-09-01' AND lease_period_end < '2020-10-01')
  OR (lease_period_start < '2020-09-01' AND lease_period_end >= '2020-10-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'oktober' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-10-01' AND lease_period_start < '2020-11-01')
  OR (lease_period_end >= '2020-10-01' AND lease_period_end < '2020-11-01')
  OR (lease_period_start < '2020-10-01' AND lease_period_end >= '2020-11-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'november' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-11-01' AND lease_period_start < '2020-12-01')
  OR (lease_period_end >= '2020-11-01' AND lease_period_end < '2020-12-01')
  OR (lease_period_start < '2020-11-01' AND lease_period_end >= '2020-12-01')
  GROUP BY(s.instrument)

  UNION ALL

  SELECT 'december' as month, s.instrument,
  COUNT (s.instrument) AS count
  FROM rented_instrument AS r INNER JOIN instrument_stock as s
  ON r.instrument_stock_id = s.id
  WHERE (lease_period_start >= '2020-12-01' AND lease_period_start < '2021-01-01')
  OR (lease_period_end >= '2020-12-01' AND lease_period_end < '2021-01-01')
  OR (lease_period_start < '2020-12-01' AND lease_period_end >= '2021-01-01')
  GROUP BY(s.instrument)
  ORDER BY (count) DESC

)as foo2

-- actually get query 1.1
SELECT * FROM total_instruments_per_month;

-- 1.2

select instrument, sum(i.count)/12 as average
from total_instruments_per_month as i
GROUP BY(i.instrument)

-- 1.3
-- del 1
SELECT * FROM
(


  SELECT
  CASE
    WHEN bob.month = 1 THEN 'januari'
    WHEN bob.month = 2 THEN 'februari'
    WHEN bob.month = 3 THEN 'mars'
    WHEN bob.month = 4 THEN 'april'
    WHEN bob.month = 5 THEN 'maj'
    WHEN bob.month = 6 THEN 'juni'
    WHEN bob.month = 7 THEN 'juli'
    WHEN bob.month = 8 THEN 'augusti'
    WHEN bob.month = 9 THEN 'september'
    WHEN bob.month = 10 THEN 'oktober'
    WHEN bob.month = 11 THEN 'november'
    WHEN bob.month = 12 THEN 'december'
  END as month
  , 'all lessons' as lesson, SUM(count) as sum FROM
  (

  SELECT DATE_PART('month', start_time) as month,
  COUNT(*) FROM individual_lesson as ind
  WHERE DATE_PART('year', ind.start_time) = '2020'
  GROUP BY(ind.start_time)

  UNION ALL

  SELECT DATE_PART('month', start_time) as month,
  COUNT(*) FROM nonindividual_lesson as non
  WHERE DATE_PART('year', non.start_time) = '2020'
  GROUP BY(non.start_time)

  )as bob
  GROUP BY(bob.month)
  ORDER BY(bob.month)

)as foo1
-- del 2

UNION ALL

SELECT * FROM
(


  SELECT foo.month, foo.lesson, SUM(foo.count) AS sum FROM (

  SELECT 'januari' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-01-01' AND ind.start_time < '2020-02-01')

  UNION ALL

  SELECT 'januari' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-01-01' AND non.start_time < '2020-02-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'februari' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-02-01' AND ind.start_time < '2020-03-01')

  UNION ALL

  SELECT 'februari' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-02-01' AND non.start_time < '2020-03-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'mars' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-03-01' AND ind.start_time < '2020-04-01')

  UNION ALL

  SELECT 'mars' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-03-01' AND non.start_time < '2020-04-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'april' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-04-01' AND ind.start_time < '2020-05-01')

  UNION ALL

  SELECT 'april' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-04-01' AND non.start_time < '2020-05-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'maj' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-05-01' AND ind.start_time < '2020-06-01')

  UNION ALL

  SELECT 'maj' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-05-01' AND non.start_time < '2020-06-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'juni' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-06-01' AND ind.start_time < '2020-07-01')

  UNION ALL

  SELECT 'juni' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-06-01' AND non.start_time < '2020-07-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'juli' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-07-01' AND ind.start_time < '2020-08-01')

  UNION ALL

  SELECT 'juli' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-07-01' AND non.start_time < '2020-08-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'augusti' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-08-01' AND ind.start_time < '2020-09-01')

  UNION ALL

  SELECT 'augusti' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-08-01' AND non.start_time < '2020-09-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'september' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-09-01' AND ind.start_time < '2020-10-01')

  UNION ALL

  SELECT 'september' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-09-01' AND non.start_time < '2020-10-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'oktober' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-10-01' AND ind.start_time < '2020-11-01')

  UNION ALL

  SELECT 'oktober' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-10-01' AND non.start_time < '2020-11-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'november' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-11-01' AND ind.start_time < '2020-12-01')

  UNION ALL

  SELECT 'november' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-11-01' AND non.start_time < '2020-12-01')
  GROUP BY(type.is_ensamble)

  UNION ALL

  SELECT 'december' as month, 'individual lesson' as lesson,
  COUNT (*) AS count
  FROM individual_lesson AS ind INNER JOIN lesson_type as type
  ON ind.lesson_type_id = type.id
  WHERE (ind.start_time >= '2020-12-01' AND ind.start_time < '2021-01-01')

  UNION ALL

  SELECT 'december' as month,
  CASE
    WHEN type.is_ensamble = '1' THEN 'ensamble'
    WHEN type.is_ensamble = '0' THEN 'group lesson'
  END as lesson, COUNT(*) AS count
  FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
  ON non.lesson_type_id = type.id
  WHERE (non.start_time >= '2020-12-01' AND non.start_time < '2021-01-01')
  GROUP BY(type.is_ensamble)

  )as foo
  GROUP BY(foo.month, foo.lesson)
  ORDER BY(month)

)as foo2
-- 1.4
-- del 1

SELECT 'all lessons' AS lesson, AVG(bob.count) AS average FROM
(

SELECT foo.month, SUM(foo.count) as count FROM
(
  SELECT 'januari' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-01-01' AND start_time < '2020-02-01')

  UNION ALL

  SELECT 'januari' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-01-01' AND start_time < '2020-02-01')

  UNION ALL

  SELECT 'februari' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-02-01' AND start_time < '2020-03-01')

  UNION ALL

  SELECT 'februari' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-02-01' AND start_time < '2020-03-01')

  UNION ALL

  SELECT 'mars' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-02-01' AND start_time < '2020-03-01')

  UNION ALL

  SELECT 'mars' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-03-01' AND start_time < '2020-04-01')

  UNION ALL

  SELECT 'april' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-04-01' AND start_time < '2020-05-01')

  UNION ALL

  SELECT 'april' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-04-01' AND start_time < '2020-05-01')

  UNION ALL

  SELECT 'maj' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-05-01' AND start_time < '2020-06-01')

  UNION ALL

  SELECT 'maj' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-05-01' AND start_time < '2020-06-01')

  UNION ALL

  SELECT 'juni' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-06-01' AND start_time < '2020-07-01')

  UNION ALL

  SELECT 'juni' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-06-01' AND start_time < '2020-07-01')

  UNION ALL

  SELECT 'juli' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-07-01' AND start_time < '2020-08-01')

  UNION ALL

  SELECT 'juli' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-07-01' AND start_time < '2020-08-01')

  UNION ALL

  SELECT 'augusti' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-08-01' AND start_time < '2020-09-01')

  UNION ALL

  SELECT 'augusti' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-08-01' AND start_time < '2020-09-01')

  UNION ALL

  SELECT 'september' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-09-01' AND start_time < '2020-10-01')

  UNION ALL

  SELECT 'september' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-09-01' AND start_time < '2020-10-01')

  UNION ALL

  SELECT 'oktober' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-10-01' AND start_time < '2020-11-01')

  UNION ALL

  SELECT 'oktober' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-10-01' AND start_time < '2020-11-01')

  UNION ALL

  SELECT 'november' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-11-01' AND start_time < '2020-12-01')

  UNION ALL

  SELECT 'november' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-11-01' AND start_time < '2020-12-01')

  UNION ALL

  SELECT 'december' as month, COUNT(*) FROM individual_lesson
  WHERE (start_time >= '2020-12-01' AND start_time < '2021-01-01')

  UNION ALL

  SELECT 'december' as month, COUNT(*) FROM nonindividual_lesson
  WHERE (start_time >= '2020-12-01' AND start_time < '2021-01-01')
) as foo
GROUP BY(foo.month)

)as bob

UNION ALL

-- del 2
SELECT lesson, cast(SUM(sum) as decimal)/12 AS average FROM
(

SELECT foo.month, foo.lesson, SUM(foo.count) AS sum FROM (

SELECT 'januari' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-01-01' AND ind.start_time < '2020-02-01')
UNION ALL
SELECT 'januari' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-01-01' AND non.start_time < '2020-02-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'januari' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-01-01' AND non.start_time < '2020-02-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'februari' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-02-01' AND ind.start_time < '2020-03-01')
UNION ALL
SELECT 'februari' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-02-01' AND non.start_time < '2020-03-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'februari' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-02-01' AND non.start_time < '2020-03-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'mars' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-03-01' AND ind.start_time < '2020-04-01')
UNION ALL
SELECT 'mars' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-03-01' AND non.start_time < '2020-04-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'mars' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-03-01' AND non.start_time < '2020-04-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'april' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-04-01' AND ind.start_time < '2020-05-01')
UNION ALL
SELECT 'april' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-04-01' AND non.start_time < '2020-05-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'april' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-04-01' AND non.start_time < '2020-05-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'maj' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-05-01' AND ind.start_time < '2020-06-01')
UNION ALL
SELECT 'maj' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-05-01' AND non.start_time < '2020-06-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'maj' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-05-01' AND non.start_time < '2020-06-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'juni' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-06-01' AND ind.start_time < '2020-07-01')
UNION ALL
SELECT 'juni' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-06-01' AND non.start_time < '2020-07-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'juni' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-06-01' AND non.start_time < '2020-07-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'juli' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-07-01' AND ind.start_time < '2020-08-01')
UNION ALL
SELECT 'juli' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-07-01' AND non.start_time < '2020-08-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'juli' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-07-01' AND non.start_time < '2020-08-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'augusti' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-08-01' AND ind.start_time < '2020-09-01')
UNION ALL
SELECT 'augusti' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-08-01' AND non.start_time < '2020-09-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'augusti' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-08-01' AND non.start_time < '2020-09-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'september' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-09-01' AND ind.start_time < '2020-10-01')
UNION ALL
SELECT 'september' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-09-01' AND non.start_time < '2020-10-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'september' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-09-01' AND non.start_time < '2020-10-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'oktober' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-10-01' AND ind.start_time < '2020-11-01')
UNION ALL
SELECT 'oktober' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-10-01' AND non.start_time < '2020-11-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'oktober' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-10-01' AND non.start_time < '2020-11-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'november' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-11-01' AND ind.start_time < '2020-12-01')
UNION ALL
SELECT 'november' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-11-01' AND non.start_time < '2020-12-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'november' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-11-01' AND non.start_time < '2020-12-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

UNION ALL

SELECT 'december' as month, 'individual lesson' as lesson,
COUNT (*) AS count
FROM individual_lesson AS ind INNER JOIN lesson_type as type
ON ind.lesson_type_id = type.id
WHERE (ind.start_time >= '2020-12-01' AND ind.start_time < '2021-01-01')
UNION ALL
SELECT 'december' as month, 'group lesson' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-12-01' AND non.start_time < '2021-01-01') and type.is_ensamble = '0'
GROUP BY(type.is_ensamble)
UNION ALL
SELECT 'december' as month, 'ensemble' as lesson, COUNT(*) AS count
FROM nonindividual_lesson AS non INNER JOIN lesson_type as type
ON non.lesson_type_id = type.id
WHERE (non.start_time >= '2020-12-01' AND non.start_time < '2021-01-01') and type.is_ensamble = '1'
GROUP BY(type.is_ensamble)

)as foo
GROUP BY(foo.month, foo.lesson)


) as bob
GROUP BY(lesson)

-- 1.5
SELECT * FROM
(

  SELECT * FROM

  (

  SELECT cast(foo.inst_id as varchar(350)) AS inst_id_given_more_than_x, COUNT(foo.inst_id) AS count FROM

  (

  SELECT inst.id as inst_id, ind.id as other_id FROM instructor AS inst
  INNER JOIN individual_lesson AS ind
  ON inst.id = ind.instructor_id
  WHERE DATE_PART('year', ind.start_time) = DATE_PART('year', current_date - interval '1 month')
  AND DATE_PART('month', ind.start_time) = DATE_PART('month', current_date - interval '1 month')
  AND ind.start_time <= current_date

  UNION ALL

  SELECT inst.id as inst_id, non.id as other_id FROM instructor AS inst
  INNER JOIN nonindividual_lesson AS non
  ON inst.id = non.instructor_id
  WHERE DATE_PART('year', non.start_time) = DATE_PART('year', current_date - interval '1 month')
  AND DATE_PART('month', non.start_time) = DATE_PART('month', current_date - interval '1 month')
  AND non.start_time <= current_date

  )as foo

  GROUP BY foo.inst_id

  ) AS boo
  WHERE boo.count > 2 -- CHANGE THIS TO SET HOW LIMIT FOR INSTRUCTOR TO POP UP IN LIST

)AS bob


UNION ALL
SELECT 'top 3 instructors last month' as int_id_given_more_than_x, 0 as count
UNION ALL

SELECT * FROM
(

  SELECT * FROM

  (

  SELECT cast(foo.inst_id as varchar(350)) AS top_three_instructors, COUNT(foo.inst_id) AS count FROM

  (

  SELECT inst.id as inst_id, ind.id as other_id FROM instructor AS inst
  INNER JOIN individual_lesson AS ind
  ON inst.id = ind.instructor_id
  WHERE DATE_PART('year', ind.start_time) = DATE_PART('year', current_date)
  AND DATE_PART('month', ind.start_time) = DATE_PART('month', current_date)

  UNION ALL

  SELECT inst.id as inst_id, non.id as other_id FROM instructor AS inst
  INNER JOIN nonindividual_lesson AS non
  ON inst.id = non.instructor_id
  WHERE DATE_PART('year', non.start_time) = DATE_PART('year', current_date - interval '1 month')
  AND DATE_PART('month', non.start_time) = DATE_PART('month', current_date - interval '1 month')

  )as foo

  GROUP BY foo.inst_id

  ) AS boo
  WHERE boo.count > 0 -- KEEP AT 0 TO SHOW TOP 3

  LIMIT 3

)as boba



-- 2.1
SELECT ens.id, extract(isodow from ens.start_time) as weekday, ens.start_time, type.name as genre,

CASE
  WHEN ens.max_attendees - COUNT(sn.student_id) <= 0 THEN 'fully booked'
  WHEN ens.max_attendees - COUNT(sn.student_id) = 1 OR ens.max_attendees - COUNT(sn.student_id) = 2 THEN '1 or 2 seats left'
  WHEN ens.max_attendees - COUNT(sn.student_id) > 2 THEN 'more than 2 seats left'
END seats

FROM nonindividual_lesson AS ens
INNER JOIN lesson_type AS type ON ens.lesson_type_id = type.id
LEFT JOIN student_nonindividual_lesson AS sn ON sn.nonindividual_lesson_id = ens.id

WHERE type.is_ensamble = '1' AND
ens.start_time >= cast(current_date + make_interval(days => cast(7-extract(isodow from current_date) as int) + 1) as DATE) AND
ens.start_time <= cast(current_date + make_interval(days => cast(7-extract(isodow from current_date) as int) + 7) as DATE)
GROUP BY (ens.id, type.name)
ORDER BY(extract(isodow from ens.start_time), type.name)

-- 2.2

SELECT id, type, instrument, price, available, rented, MIN(next_group_lesson) FROM
(

SELECT stock.id, stock.type, stock.instrument, stock.price,
stock.current_stock AS available, COUNT(DISTINCT ri.id) AS rented,

CASE
  WHEN non.start_time >= now() THEN cast(non.start_time as varchar(350))
  ELSE 'no upcoming group lessons'
END next_group_lesson

FROM instrument_stock AS stock
INNER JOIN lesson_type as type
ON stock.instrument = type.name
LEFT JOIN nonindividual_lesson AS non
ON non.lesson_type_id = type.id
LEFT JOIN rented_instrument AS ri
ON ri.instrument_stock_id = stock.id
WHERE type.is_ensamble = '0' OR non IS NULL
GROUP BY(stock.id, non.start_time)
ORDER BY price ASC

)as foo
GROUP BY(foo.id, foo.type, foo.instrument, foo.price, foo.available, foo.rented)
ORDER BY price ASC

