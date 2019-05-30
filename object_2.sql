/* Defining object types */

CREATE TYPE address_typ AS OBJECT ( 
   street          VARCHAR2(30),
   city            VARCHAR2(20),
   state           CHAR(2),
   postal_code     VARCHAR2(6) );
/
CREATE TYPE employee_typ AS OBJECT (
  employee_id       NUMBER(6),
  first_name        VARCHAR2(20),
  last_name         VARCHAR2(25),
  email             VARCHAR2(25),
  phone_number      VARCHAR2(20),
  hire_date         DATE,
  job_id            VARCHAR2(10),
  salary            NUMBER(8,2),
  commission_pct    NUMBER(2,2),
  manager_id        NUMBER(6),
  department_id     NUMBER(4),
  address           address_typ,
  MAP MEMBER FUNCTION get_idno RETURN NUMBER,
  MEMBER PROCEDURE display_address ( SELF IN OUT NOCOPY employee_typ ) );
/
CREATE TYPE BODY employee_typ AS
  MAP MEMBER FUNCTION get_idno RETURN NUMBER IS
  BEGIN
    RETURN employee_id;
  END;
  MEMBER PROCEDURE display_address ( SELF IN OUT NOCOPY employee_typ ) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(first_name || ' '  || last_name);
    DBMS_OUTPUT.PUT_LINE(address.street);
    DBMS_OUTPUT.PUT_LINE(address.city || ', '  || address.state || ' ' ||
                         address.postal_code);   
  END;
END;
/
CREATE TABLE employee_tab OF employee_typ;
/* Declaring Objects */
DECLARE
  emp employee_typ; -- emp is atomically null
BEGIN
-- call the constructor for employee_typ
  emp := employee_typ(315, 'Francis', 'Logan', 'FLOGAN',
        '415.555.0100', '01-MAY-04', 'SA_MAN', 11000, .15, 101, 110, 
         address_typ('376 Mission', 'San Francisco', 'CA', '94222'));
  DBMS_OUTPUT.PUT_LINE(emp.first_name || ' ' || emp.last_name); -- display details
  emp.display_address();  -- call object method to display details
END;
/

/* Accessing object attributes */
DECLARE
  emp employee_typ;
BEGIN
  emp := employee_typ(315, 'Francis', 'Logan', 'FLOGAN',
        '415.555.0100', '01-MAY-04', 'SA_MAN', 11000, .15, 101, 110, 
         address_typ('376 Mission', 'San Francisco', 'CA', '94222'));
  DBMS_OUTPUT.PUT_LINE(emp.first_name || ' '  || emp.last_name);
  DBMS_OUTPUT.PUT_LINE(emp.address.street);
  DBMS_OUTPUT.PUT_LINE(emp.address.city || ', '  ||emp. address.state || ' ' ||
                       emp.address.postal_code);   
END;
/

/* Calling objec t constructors and methods */
DECLARE
  emp employee_typ;
BEGIN
  INSERT INTO employee_tab VALUES (employee_typ(310, 'Evers', 'Boston', 'EBOSTON',
   '617.555.0100', '01-AUG-04', 'SA_REP', 9000, .15, 101, 110, 
    address_typ('123 Main', 'San Francisco', 'CA', '94111')) );
  INSERT INTO employee_tab VALUES (employee_typ(320, 'Martha', 'Dunn', 'MDUNN',
    '650.555.0150', '30-SEP-04', 'AC_MGR', 12500, 0, 101, 110,
    address_typ('123 Broadway', 'Redwood City', 'CA', '94065')) );
END;
/
SELECT VALUE(e) from employee_tab e;

/* Accessing object methods */
DECLARE
  emp employee_typ;
BEGIN
  SELECT VALUE(e) INTO emp FROM employee_tab e WHERE e.employee_id = 310;
  emp.display_address();
END;
/
