CREATE DATABASE soundgood;
\c soundgood

-- stronk tables

CREATE TABLE public.instrument_stock(
  id SERIAL NOT NULL,
  brand VARCHAR(350) NOT NULL,
  type VARCHAR(350) NOT NULL,
  instrument VARCHAR(350) NOT NULL,
  price FLOAT(10) NOT NULL,
  current_stock INT NOT NULL,
  PRIMARY KEY(id)
);


CREATE TABLE public.person(
  id SERIAL NOT NULL,
  full_name VARCHAR(350) NOT NULL,
  age INT NOT NULL,
  ssn CHAR(13) NOT NULL,
  address VARCHAR(350) NOT NULL,
  phone VARCHAR(350) NOT NULL,
  email VARCHAR(350) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE public.lesson_type(
  id SERIAL NOT NULL,
  name VARCHAR(350) NOT NULL,
  skill_level VARCHAR(350) NOT NULL,
  price FLOAT(10) NOT NULL,
  extra_day_charge FLOAT(10) NOT NULL,
  is_ensamble BIT(1) NOT NULL,
  PRIMARY KEY(id)
);

-- non-stronk tables

CREATE TABLE public.student(
  id SERIAL NOT NULL,
  sibling_discount FLOAT(10) NOT NULL,
  monthly_debt FLOAT(10) NOT NULL,
  parent_phone VARCHAR(350) NOT NULL,
  parent_email VARCHAR(350) NOT NULL,
  person_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(person_id) REFERENCES person(id) ON DELETE RESTRICT
);

CREATE TABLE rented_instrument(
  id SERIAL NOT NULL,
  lease_period_start DATE NOT NULL,
  lease_period_end DATE NOT NULL,
  student_id int NOT NULL,
  instrument_stock_id int NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE RESTRICT,
  FOREIGN KEY(instrument_stock_id) REFERENCES instrument_stock(id) ON DELETE RESTRICT
);

CREATE TABLE public.student_relation(
  student1_id INT NOT NULL,
  student2_id INT NOT NULL,
  PRIMARY KEY(student1_id, student2_id),
  FOREIGN KEY(student1_id) REFERENCES student(id) ON DELETE CASCADE,
  FOREIGN KEY(student2_id) REFERENCES student(id) ON DELETE CASCADE
);

CREATE TABLE public.instructor(
  id SERIAL NOT NULL,
  person_id INT NOT NULL,
  pay_pre_cut FLOAT(10) NOT NULL,
  instructor_cut FLOAT(10) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(person_id) REFERENCES person(id) ON DELETE RESTRICT
);

CREATE TABLE public.available_timeslot(
  instructor_id INT NOT NULL,
  start_time TIMESTAMP(6) NOT NULL,
  end_time TIMESTAMP(6) NOT NULL,
  PRIMARY KEY(instructor_id, start_time, end_time),
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);

CREATE TABLE public.instructor_instrument(
  instructor_id INT NOT NULL,
  instrument VARCHAR(350) NOT NULL,
  PRIMARY KEY(instructor_id, instrument),
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE CASCADE
);

CREATE TABLE public.enrollment_form (
  id SERIAL NOT NULL,
  person_id INT NOT NULL,
  lesson_type_id INT NOT NULL,
  keep_if_rejected BIT(1) NOT NULL,
  accepted_into_school BIT(1),
  PRIMARY KEY(id),
  FOREIGN KEY(person_id) REFERENCES person(id) ON DELETE CASCADE,
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_type(id) ON DELETE RESTRICT
);

CREATE TABLE public.place_offer(
  enrollment_form_id INT NOT NULL,
  accepted BIT(1) NOT NULL,
  PRIMARY KEY(enrollment_form_id),
  FOREIGN KEY(enrollment_form_id) REFERENCES enrollment_form(id) ON DELETE CASCADE
);

CREATE TABLE public.audition(
  enrollment_form_id INT NOT NULL,
  start_time TIMESTAMP(6) NOT NULL,
  passed BIT(1),
  address VARCHAR(350) NOT NULL,
  PRIMARY KEY(enrollment_form_id),
  FOREIGN KEY(enrollment_form_id) REFERENCES enrollment_form(id) ON DELETE CASCADE
);

-- lessons

CREATE TABLE public.individual_lesson(
  id SERIAL NOT NULL,
  start_time TIMESTAMP(6) NOT NULL,
  address VARCHAR(350) NOT NULL,
  student_id INT NOT NULL,
  lesson_type_id INT NOT NULL,
  instructor_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE RESTRICT,
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_type(id) ON DELETE RESTRICT,
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE RESTRICT
);

CREATE TABLE public.nonindividual_lesson(
  id SERIAL NOT NULL,
  min_attendees INT NOT NULL,
  max_attendees INT NOT NULL,
  address VARCHAR(350) NOT NULL,
  lesson_type_id INT NOT NULL,
  instructor_id INT NOT NULL,
  start_time TIMESTAMP(6) NOT NULL,
  end_time TIMESTAMP(6) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(lesson_type_id) REFERENCES lesson_type(id) ON DELETE RESTRICT,
  FOREIGN KEY(instructor_id) REFERENCES instructor(id) ON DELETE RESTRICT
);

CREATE TABLE public.student_nonindividual_lesson (
  student_id INT NOT NULL,
  nonindividual_lesson_id INT NOT NULL,
  PRIMARY KEY(student_id, nonindividual_lesson_id),
  FOREIGN KEY(student_id) REFERENCES student(id) ON DELETE CASCADE,
  FOREIGN KEY(nonindividual_lesson_id) REFERENCES nonindividual_lesson(id) ON DELETE RESTRICT
);


























--
