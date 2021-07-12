## SQLite CLI command
### To do a backup:
```
sqlite> .output stdout
sqlite> SELECT strftime('%Y-%m-%d %H:%M', 'now');
2021-07-12 02:32
sqlite> .output /Users/.../workspace/what-she-likes/db/backup_2021-07-12_02:32.sql
sqlite> .dump
```

<br/>

### To show colum header nicely for query result:
```
sqlite> .header on
sqlite> .mode column
```

<br/>

### Use `.width` to set column width
```
sqlite> .read scripts/person_object_preference.sql
p  object      prefer level  context                                            timestamp(UTC)  
-  ----------  ------------  -------------------------------------------------  ----------------
A  Fries       1             When talking about McDonalds, she said can not re  2021-07-12 02:05

sqlite> .width 0 0 0 65
sqlite> .read scripts/person_object_preference.sql
person      object      prefer level  context                                                            timestamp(UTC)  
----------  ----------  ------------  -----------------------------------------------------------------  ----------------
Amber       Fries       1             When talking about McDonalds, she said can not resist fries        2021-07-12 02:05                                        2021-07-12 02:05
```
