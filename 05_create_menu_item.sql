--step 1 : rcreate Menu_Item table
CREATE TABLE Menu_Item
(
    Menu_Item_ID NUMBER,
    Restaurant_ID NUMBER NOT NULL,
    Item_Name VARCHAR2(100) NOT NULL,
    Category VARCHAR2(20) NOT NULL,
    Price NUMBER(8,2) NOT NULL,
    Availability VARCHAR2(15) DEFAULT 'AVAILABLE' NOT NULL,
    Created_Date DATE DEFAULT SYSDATE,

    CONSTRAINT PK_Menu_Item
        PRIMARY KEY (Menu_Item_ID),

    CONSTRAINT FK_Menu_Restaurant
        FOREIGN KEY (Restaurant_ID)
        REFERENCES Restaurant(Restaurant_ID),

    CONSTRAINT CHK_Menu_Category
        CHECK (Category IN ('VEG','NON-VEG','BEVERAGE')),

    CONSTRAINT CHK_Menu_Availability
        CHECK (Availability IN ('AVAILABLE','UNAVAILABLE')),

    CONSTRAINT CHK_Menu_Price
        CHECK (Price > 0)
);
 
---step 2 Create Sequence
CREATE SEQUENCE SEQ_Menu_Item
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


--step 3 Create Trigger

CREATE OR REPLACE TRIGGER TRG_Menu_Item_ID
BEFORE INSERT ON Menu_Item
FOR EACH ROW
BEGIN
    IF :NEW.Menu_Item_ID IS NULL THEN
        SELECT SEQ_Menu_Item.NEXTVAL
        INTO :NEW.Menu_Item_ID
        FROM Dual;
    END IF;
END;
/


