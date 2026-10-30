--step 1 :  Order_ Item table.

CREATE TABLE Order_Item
(
    Order_Item_ID NUMBER,
    Order_ID NUMBER NOT NULL,
    Menu_Item_ID NUMBER NOT NULL,
    Quantity NUMBER NOT NULL,
    Unit_Price NUMBER(8,2) NOT NULL,
    Sub_Total NUMBER(10,2) NOT NULL,

    CONSTRAINT PK_Order_Item
        PRIMARY KEY (Order_Item_ID),

    CONSTRAINT FK_OrderItem_Order
        FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID),

    CONSTRAINT FK_OrderItem_Menu
        FOREIGN KEY (Menu_Item_ID)
        REFERENCES Menu_Item(Menu_Item_ID),

    CONSTRAINT CHK_Quantity
        CHECK (Quantity > 0),

    CONSTRAINT CHK_Unit_Price
        CHECK (Unit_Price > 0),

    CONSTRAINT CHK_Sub_Total
        CHECK (Sub_Total > 0)
);

--step 2 : Create Sequence
CREATE SEQUENCE SEQ_Order_Item
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

---step 3: Create Trigger
CREATE OR REPLACE TRIGGER TRG_Order_Item_ID
BEFORE INSERT ON Order_Item
FOR EACH ROW
BEGIN
    IF :NEW.Order_Item_ID IS NULL THEN
        SELECT SEQ_Order_Item.NEXTVAL
        INTO :NEW.Order_Item_ID
        FROM DUAL;
    END IF;
END;
/
 
