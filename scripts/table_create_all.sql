CREATE TABLE IF NOT EXISTS person (
	id UUID PRIMARY KEY,
   	name VARCHAR UNIQUE,
	dob TEXT
);

CREATE TABLE IF NOT EXISTS object (
	id UUID PRIMARY KEY,
   	name VARCHAR UNIQUE,
	type VARCHAR,
	parent_type VARCHAR
);

CREATE TABLE IF NOT EXISTS context (
	id UUID PRIMARY KEY,
	content TEXT NOT NULL,
   	person_id UUID NOT NULL,
	object_id UUID NOT NULL,
	FOREIGN KEY (person_id) REFERENCES person (id),
	FOREIGN KEY (object_id) REFERENCES object (id)
);
