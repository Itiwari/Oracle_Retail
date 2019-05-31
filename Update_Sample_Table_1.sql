spool Update_Sample_Table_1.txt
UPDATE Sample_Table_1
SET name = 'ORACLE_RETAIL'
WHERE id > 5;
SELECT * FROM Sample_Table_1;
/
spool off;
