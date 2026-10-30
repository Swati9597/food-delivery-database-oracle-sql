---Step 1: Create Table Admin

CREATE TABLE Admin
(
    Admin_ID NUMBER,
    Full_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone_Number VARCHAR2(15) NOT NULL,
    Password VARCHAR2(255) NOT NULL,
    Role VARCHAR2(20) NOT NULL,
    Status VARCHAR2(15) DEFAULT 'ACTIVE' NOT NULL,
    Created_Date DATE DEFAULT SYSDATE,

    CONSTRAINT PK_Admin PRIMARY KEY (Admin_ID),

    CONSTRAINT UK_Admin_Email UNIQUE (Email),

    CONSTRAINT UK_Admin_Phone UNIQUE (Phone_Number),

    CONSTRAINT CHK_Admin_Role
        CHECK (Role = 'ADMIN'),

    CONSTRAINT CHK_Admin_Status
        CHECK (Status IN ('ACTIVE','INACTIVE'))
);
 
---Step 2: Create Sequence

CREATE SEQUENCE SEQ_Admin
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;



---Step 3: Create Trigger	

CREATE OR REPLACE TRIGGER TRG_Admin_ID
BEFORE INSERT ON Admin
FOR EACH ROW
BEGIN
    IF :NEW.Admin_ID IS NULL THEN
        SELECT SEQ_Admin.NEXTVAL
        INTO :NEW.Admin_ID
        FROM Dual;
    END IF;
END;
/
 
