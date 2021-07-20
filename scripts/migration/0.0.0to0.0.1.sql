-- Create new table for object_type
CREATE TABLE object_type (
	id UUID,
	parent_id UUID,
   	name VARCHAR UNIQUE NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (parent_id) REFERENCES object_type (id)
);

CREATE TRIGGER gen_UUID_object_type
AFTER INSERT ON object_type
FOR EACH ROW
WHEN (NEW.id IS NULL)
BEGIN
	UPDATE object_type SET id = (select hex( randomblob(4)) || '-' || hex( randomblob(2))
			|| '-' || '4' || substr( hex( randomblob(2)), 2) || '-'
			|| substr('AB89', 1 + (abs(random()) % 4) , 1)  ||
			substr(hex(randomblob(2)), 2) || '-' || hex(randomblob(6)) ) WHERE rowid = NEW.rowid;
END;

-- Migrate type names from table(object) to the new table(object_type)
INSERT INTO object_type (name)
SELECT DISTINCT o.type FROM object o;

-- Rename table(object) to table(to_be_deleted)
ALTER TABLE object
RENAME TO to_be_deleted;

-- Create table(object)
CREATE TABLE object (
	id UUID NOT NULL,
   	name VARCHAR UNIQUE NOT NULL,
	type_id UUID,
	PRIMARY KEY (id)
);

-- Migrate all data from table(to_be_deleted) to table(object)
INSERT INTO object (id, name, type_id)
SELECT o.id, o.name, ot.id
FROM to_be_deleted o, object_type ot
WHERE o.type = ot.name;

-- Drop table(to_be_deleted)
DROP TABLE to_be_deleted;
