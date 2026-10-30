--step  1: create Customer table

CREATE TABLE Customer
(
    Customer_ID NUMBER,
    Full_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone_Number VARCHAR2(15) NOT NULL,
    Password VARCHAR2(255) NOT NULL,
    Status VARCHAR2(15) DEFAULT 'ACTIVE' NOT NULL,
    Created_Date DATE DEFAULT SYSDATE,
    LOCALITY	VARCHAR2(50) NOT NULL .

    CONSTRAINT PK_Customer PRIMARY KEY (Customer_ID),

    CONSTRAINT UK_Customer_Email UNIQUE (Email),

    CONSTRAINT UK_Customer_Phone UNIQUE (Phone_Number),

    CONSTRAINT CHK_Customer_Status
        CHECK (Status IN ('ACTIVE','INACTIVE'))
);
 
--Step 2: Create Sequence

CREATE SEQUENCE SEQ_Customer
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;



--Step 3: Create Trigger

CREATE OR REPLACE TRIGGER TRG_Customer_ID
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    IF :NEW.Customer_ID IS NULL THEN
        SELECT SEQ_Customer.NEXTVAL
        INTO :NEW.Customer_ID
        FROM Dual;
    END IF;
END;
/

 
