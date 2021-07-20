SELECT p.name as 'person', o.name 'target', ot.name as 'type', c.like as 'prefer level',
c.content as 'context', c.timestamp as 'timestamp(UTC)'
FROM person p, object o, object_type ot, context c
WHERE p.id=c.person_id AND o.id=c.object_id AND o.type_id=ot.id
AND p.id='6b82e425-ef21-45f2-8aea-7fd8f83f9815'
ORDER BY c.timestamp;
