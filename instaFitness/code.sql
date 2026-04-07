trainers [icon: server]{
  id serial varchar(50) pk
  name varchar(50) not null
  phone varchar(15) not null
  email varchar(50) not null

  created_at timespan
  updated_at timespan
}

clients [icon: user]{
  id serial varchar(50) pk
  name varchar(50) not null
  phone varchar(15) not null
  email varchar(50) not null
  age varchar(10) not null

  created_at timespan
  updated_at timespan
}

subscriptions [icon: star]{
  id serial varchar(50) not null
  starts_at timespan
  ends_at timespan

  clients_id int fk
  plan_id int fk

  created_at timespan
  updated_at timespan
}

payments [icon: fingerprint]{
  id serial varchar(50) pk
  isPaid enum('Sucessfull','Pending')
  paid_at timespan not null
  subscription_id int varchar(50) not null

  created_at timespan
  updated_at timespan
}

plans{
  id serial varchar(50) pk
  plan_name varcahr(50) not null
  valid_till timespan not null
  trainer_id int varchar(50) fk not null

  created_at timespan
  updated_at timespan
}

attendance[icon: hand]{
  id serial varcahr(50) pk
  isPresent varchar(50)

  session_id int varchar(50) fk
  clients_id int varchar(50) fk

  created_at timespan
  updated_at timespan
}

session[icon: timer]{
  id serial varchar(50) pk
  clients_id int varchar(50) fk
  trainer_id int varchar(50) fk
  starts_at timespan
  ends_at timespan

  created_at timespan
  updated_at timespan
}

fitness{
  id varchar(50) pk
  clients_id int varchar(50) fk
  starts_at timespan
  ends_at timespan
  height varcahr(10)
  weight varcahr(10)
  progress varchar(50)

  created_at timespan
  updated_at timespan
}

trainer_client{
  id serial varcahr(50) pk
  clients_id int varcahr(50) fk
  trainer_id int varcahr(50) fk

  starts_at timespan
  ends_at timespan

  created_at timespan
  updated_at timespan
}

trainers.id < trainer_client.trainer_id
clients.id < trainer_client.client_id
trainers.id < plans.trainer_id
clients.id < subscriptions.client_id
plans.id < subscriptions.plan_id
subscriptions.id < payments.subscription_id
session.id < attendance.session_id
clients.id < attendance.clients_id
clients.id < fitness.client_id
trainers.id < plans.trainer_id