--step 1 :  Create Table - Orders
CREATE TABLE Orders
(
    Order_ID NUMBER,
    Customer_ID NUMBER NOT NULL,
    Restaurant_ID NUMBER NOT NULL,
    Delivery_Partner_ID NUMBER,
    Order_Date_Time DATE DEFAULT SYSDATE,
    DELIVERY_LOCALITY  VARCHAR2(255) NOT NULL,
    Total_Amount NUMBER(10,2) NOT NULL,
    Order_Status VARCHAR2(20) DEFAULT 'PENDING' NOT NULL,

    CONSTRAINT PK_Orders
        PRIMARY KEY (Order_ID),

    CONSTRAINT FK_Order_Customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID),

    CONSTRAINT FK_Order_Restaurant
        FOREIGN KEY (Restaurant_ID)
        REFERENCES Restaurant(Restaurant_ID),

    CONSTRAINT FK_Order_Delivery
        FOREIGN KEY (Delivery_Partner_ID)
        REFERENCES Delivery_Partner(Delivery_Partner_ID),

    CONSTRAINT CHK_Order_Status
        CHECK (Order_Status IN
        ('PENDING',
         'PREPARING',
         'OUT FOR DELIVERY',
         'DELIVERED',
         'CANCELLED'
          ‘confirmed’)),

    CONSTRAINT CHK_Total_Amount
        CHECK (Total_Amount > 0)
);


--step 2 : Create Sequence
CREATE SEQUENCE SEQ_Orders
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

--step 3 : Create Trigger
CREATE OR REPLACE TRIGGER TRG_Orders_ID
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF :NEW.Order_ID IS NULL THEN
        SELECT SEQ_Orders.NEXTVAL
        INTO :NEW.Order_ID
        FROM Dual;
    END IF;
END;
/
 
