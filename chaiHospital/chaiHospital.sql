patients{
  id serial unique not null pk
  name varchar(50) not null
  phone_no varchar(15) not null
  email varchar(50) unique
  age int not null
  gender enum('Male','Female','Others')

  created_at timestamp
  updated_at timestamp
}

doctors{
  id serial unique not null pk
  name varchar(50) not null
  phone_no varchar(50) not null
  g_mail varchar(50) unique not null
  specialization int not null
  joined_date date default current_date

  created_at timestamp
  updated_at timestamp
}

appointments{
  id serial unique not null pk
  appointment_date timestamp
  appointment_status varchar default "Scheduled"
  doctors_id int not null fk
  patients_id int not null fk
  
  created_at timestamp
  updated_at timestamp
}

consultantions{
  id serial unique not null pk
  disease int not null
  doctors_id int not null fk
  patients_id int not null fk
  treatement text not null

  created_at  timestamp
  updated_at timestamp
}
diseases{
  id serial not null
  patients_id int fk
  doctors_id int fk
}

tests{
  id varchar(50) not null pk
  test_type varchar(50) not null
  isPaid enum('Sucessfull','Pending')
  payment_id int fk
}

reports{
  id serial not null pk
  patients_id int not null fk
}

payments{
  payment_id serial not null pk
  patients_id int not null 
  consultant_id int not null fk
}

specilizations{
  id serial pk
  name varchar(50) not null

  created_at timestamp
  updated_at timestamp
}

specilizations.id  < doctors.specialization
doctors.id < appointments.doctors_id
patients.id < appointments.patients_id
doctors.id < consultantions.doctors_id
appointments.id < consultantions.id
patients.id < consultantions.patients_id
diseases.id < consultantions.disease
consultantions.id < tests.consultation_id
tests.id < reports.test_id
consultantions.id < payments.consultant_id
patients.id < payments.patients_id