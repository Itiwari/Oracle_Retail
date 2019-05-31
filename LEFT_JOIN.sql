spool C:\Users\itiwari\Desktop\LEFT_JOIN.txt
SELECT EMP_NAMES.name,EMP_CONTACT.contact
FROM EMP_NAMES
LEFT JOIN EMP_CONTACT
ON EMP_NAMES.id = EMP_CONTACT.id;
/
spool off;
