--step 1 : create  Delivery_Partner table
CREATE TABLE Delivery_Partner
(
    Delivery_Partner_ID NUMBER,
    Full_Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone_Number VARCHAR2(15) NOT NULL,
    Password VARCHAR2(255) NOT NULL,
    Vehicle_Type VARCHAR2(20) NOT NULL,
    Vehicle_Number VARCHAR2(20) NOT NULL,
    Availability_Status VARCHAR2(15) DEFAULT 'OFFLINE' NOT NULL,
    Status VARCHAR2(15) DEFAULT 'ACTIVE' NOT NULL,
    Created_Date DATE DEFAULT SYSDATE,

    CONSTRAINT PK_Delivery_Partner
        PRIMARY KEY (Delivery_Partner_ID),

    CONSTRAINT UK_Delivery_Email
        UNIQUE (Email),

    CONSTRAINT UK_Delivery_Phone
        UNIQUE (Phone_Number),

    CONSTRAINT UK_Vehicle_Number
        UNIQUE (Vehicle_Number),

    CONSTRAINT CHK_Availability_Status
        CHECK (Availability_Status IN ('ONLINE','OFFLINE')),

    CONSTRAINT CHK_Delivery_Status
        CHECK (Status IN ('ACTIVE','INACTIVE')),

CONSTRAINT CHK_Vehicle_Type 
CHECK (Vehicle_Type IN ('BIKE','SCOOTER'))
);

--step 2 : Create Sequence 

CREATE SEQUENCE SEQ_Delivery_Partner
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--step 3 : Create Trigger

CREATE OR REPLACE TRIGGER TRG_Delivery_Partner_ID
BEFORE INSERT ON Delivery_Partner
FOR EACH ROW
BEGIN
    IF :NEW.Delivery_Partner_ID IS NULL THEN
        SELECT SEQ_Delivery_Partner.NEXTVAL
        INTO :NEW.Delivery_Partner_ID
        FROM Dual;
    END IF;
END;
/
