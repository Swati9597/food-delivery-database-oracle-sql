--step 1 : create Restaurant table 

CREATE TABLE Restaurant
(
    Restaurant_ID NUMBER,
    Restaurant_Name VARCHAR2(100) NOT NULL,
    Owner_Name VARCHAR2(100) NOT NULL,
    Phone_Number VARCHAR2(10) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Address VARCHAR2(300) NOT NULL,
    Cuisine_Type VARCHAR2(50) NOT NULL,
    Opening_Hour NUMBER(2) NOT NULL,
    Closing_Hour NUMBER(2) NOT NULL,
    Status VARCHAR2(20) DEFAULT 'PENDING' NOT NULL,
    Admin_ID NUMBER NOT NULL,

    CONSTRAINT PK_Restaurant
        PRIMARY KEY (Restaurant_ID),

    CONSTRAINT UQ_Restaurant_Phone
        UNIQUE (Phone_Number),

    CONSTRAINT UQ_Restaurant_Email
        UNIQUE (Email),

    CONSTRAINT FK_Restaurant_Admin
        FOREIGN KEY (Admin_ID)
        REFERENCES Admin(Admin_ID),

    CONSTRAINT CHK_Opening_Hour
        CHECK (Opening_Hour BETWEEN 0 AND 23),

    CONSTRAINT CHK_Closing_Hour
        CHECK (Closing_Hour BETWEEN 0 AND 23),

    CONSTRAINT CHK_Restaurant_Status
        CHECK (Status IN ('PENDING', 'APPROVED', 'REJECTED'))
);
 
--Step 2: Create Sequence

CREATE SEQUENCE SEQ_Restaurant
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


--step 3: Create Trigger

CREATE OR REPLACE TRIGGER TRG_Restaurant_ID
BEFORE INSERT ON Restaurant
FOR EACH ROW
BEGIN
    IF :NEW.Restaurant_ID IS NULL THEN
        SELECT SEQ_Restaurant.NEXTVAL
        INTO :NEW.Restaurant_ID
        FROM Dual;
    END IF;
END;
/


 
