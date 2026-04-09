vehicles{
  id serial pk not null
  vehicle_no varchar(10) unique not null
  vehicle_type int fk

  created_at timestamp
  updated_at timestamp
}

vehicle_category{
  id serial pk not null
  vehicle_name varchar(10) not null
  isEV boolean
  
  created_at timestamp
  updated_at timestamp
}

parking_spot{
  id serial pk not null
  name varchar(10) not null
  isReserved 
  zone_id int fk
  parking_spot_category int fk

  created_at timestamp
  updated_at timestamp  
}

parking_spot_category{
  id serial pk not null
  name varchar(50) not null
  forEV boolean
  per_hour_pricing decimal(10,2)

  created_at timestamp
  updated_at timestamp
}

parking_zone{
  id serial pk not null
  name varchar(10) not null unique
  parking_spot int fk
  isAvailable boolean

  created_at timestamp
  updated_at timestamp
}

parking_ticket{
  id serial not null pk
  vehicle_id int fk not null
  issueTime int fk not null
  parking_spot int fk not null

  created_at timestamp
  updated_at timestamp
}

parking_session{
  id serial not null pk
  entry_time timestamp not null
  exit_time timestamp 
  vehicle_id int unique not null

  created_at timestamp
  updated_at timestamp
}
payments_records{
  id serial pk not null
  vehicle_id int fk
  parking_session int unique
  amount decimal(10,2) not null
}

// vehicles.id < parking_session.id
// parking_spot.id < vehicles.id
// parking_spot.id < parking_session.id
// payments_records.id - parking_zone.id

vehicle_category.id < vehicles.vehicle_type

parking_zone.id < parking_spot.zone_id
parking_spot_category.id < parking_spot.parking_spot_category
vehicles.id < parking_ticket.vehicle_id
parking_spot.id < parking_ticket.parking_spot
parking_ticket.id < parking_session.ticket_id
parking_session.id < payments_records.parking_session