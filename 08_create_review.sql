--step 1 : TABLE Review

CREATE TABLE Review
(
    Review_ID NUMBER,
    Order_ID NUMBER NOT NULL,
    Rating NUMBER(1) NOT NULL,
    Review_Text VARCHAR2(500),
    Review_Date DATE DEFAULT SYSDATE,

    CONSTRAINT PK_Review
        PRIMARY KEY (Review_ID),

    CONSTRAINT FK_Review_Order
        FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),

    CONSTRAINT UK_Review_Order
        UNIQUE (Order_ID),

    CONSTRAINT CHK_Rating
        CHECK (Rating BETWEEN 1 AND 5)
);
 
---step 2 : Create Sequence
CREATE SEQUENCE SEQ_Review
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


---step 3 : Create Trigger
CREATE OR REPLACE TRIGGER TRG_Review_ID
BEFORE INSERT ON Review
FOR EACH ROW
BEGIN
    IF :NEW.Review_ID IS NULL THEN
        SELECT SEQ_Review.NEXTVAL
        INTO :NEW.Review_ID
        FROM Dual;
    END IF;
END;
/


