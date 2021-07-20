-- Rename table(object) to table(to_be_deleted) and delete its trigger
ALTER TABLE object
RENAME TO to_be_deleted;

-- Create table(object)
CREATE TABLE object (
	id UUID,
   	name VARCHAR UNIQUE NOT NULL,
	type VARCHAR,
	PRIMARY KEY (id)
);

-- Migrate all data from table(to_be_deleted) to table(object)
INSERT INTO object (id, name, type)
SELECT o.id, o.name, ot.name
FROM to_be_deleted o, object_type ot
WHERE o.type_id = ot.id;

-- Drop table(to_be_deleted) and table(object_type), which should also delete their trigger
DROP TABLE to_be_deleted;
DROP TABLE object_type;
