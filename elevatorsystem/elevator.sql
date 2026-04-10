buildings{
  id serial pk
  name varchar(50) not null
  elevator_id int fk

  createdAt timestamp
  updatedAt timestamp
}

floors{
  id serial pk
  building_id int fk
  floor_request int fk

  createdAt timestamp
  updatedAt timestamp
}

elevators{
  id serial pk
  name varchar(50) not null
  building_id int fk

  createdAt timestamp
  updatedAt timestamp
}

elevators_shaft{
  id serial pk
  name varchar(50) not null
  elevator_id int fk

  createdAt timestamp
  updatedAt timestamp
}

floor_request{
  id serial pk
  startTime timestamp
  endTime timestamp
  request_status enum('Completed','Pending','OnTheWay') default Pending
  request_time timestamp default current_timestamp

  createdAt timestamp
  updatedAt timestamp
}

ride_assignments{
  id serial pk
  elevator_id int fk
  floor_request int fk

  createdAt timestamp
  updatedAt timestamp
}

ride_logs{
  id serial pk
  elevator_id int fk
  starFloor int fk
  endFloor int fk

  startTime timestamp
  endTime timestamp

  updatedAt timestamp
  createdAt timestamp
}

elevators_status{
  id serial pk
  isWorking boolean
  elevator_id int fk

  createdAt timestamp
  updatedAt timestamp
}

maintainance{
  id serial pk
  elevator_id int fk
  isResolved boolean
  issue text not null
  maintainance_date timestamp

  createdAt timestamp
  updatedAt timestamp
}

buildings.id < floors.building_id
elevators.building_id < buildings.id
elevators.id - elevators_shaft.id
buildings.id < elevators.id
floor_request.id < ride_assignments.floor_request
elevators.id < ride_assignments.elevator_id
ride_logs.id < ride_assignments.id
ride_logs.elevator_id < elevators.id
elevators.id < elevators_status.elevator_id
elevators.id < maintainance.elevator_id