-- Sample data for QuickBite food delivery database

-- Admin
INSERT INTO Admin
(
    Full_Name,
    Email,
    Phone_Number,
    Password,
    Role
)
VALUES
(
    'Rahul Sharma',
    'rahul.sharma@quickbite.com',
    '9876543210',
    'Admin@123',
    'ADMIN'
);

-- Customer
INSERT INTO Customer
(
    Full_Name,
    Email,
    Phone_Number,
    Password,
    LOCALITY
)
VALUES
(
    'Swati Patil',
    'swati.patil@gmail.com',
    '9876543211',
    'Swati@123',
    'Kothrud'
);

INSERT INTO Customer
(
    Full_Name,
    Email,
    Phone_Number,
    Password,
    LOCALITY
)
VALUES
(
    'Priya Sharma',
    'priya.sharma@email.com',
    '9876500002',
    'Priya#153',
    'Baner'
);

-- Restaurant
INSERT INTO Restaurant
(
    Restaurant_Name,
    Owner_Name,
    Phone_Number,
    Email,
    Address,
    Cuisine_Type,
    Opening_Hour,
    Closing_Hour,
    Status,
    Admin_ID
)
VALUES
(
    'Spice Hub',
    'Rahul Sharma',
    '9876543210',
    'contact@spicehub.com',
    'FC Road',
    'North Indian',
    11,
    23,
    'APPROVED',
    1
);

INSERT INTO Restaurant
(
    Restaurant_Name,
    Owner_Name,
    Phone_Number,
    Email,
    Address,
    Cuisine_Type,
    Opening_Hour,
    Closing_Hour,
    Status,
    Admin_ID
)
VALUES
(
    'Pizza Palace',
    'Anil Sharma',
    '9823000002',
    'orders@pizzapalace.com',
    'Kothrud',
    'Italian',
    11,
    23,
    'APPROVED',
    1
);

-- Delivery Partner
INSERT INTO Delivery_Partner
(
    Full_Name,
    Email,
    Phone_Number,
    Password,
    Vehicle_Type,
    Vehicle_Number,
    Availability_Status
)
VALUES
(
    'Rohit Patil',
    'rohit.patil@gmail.com',
    '9876543233',
    'Rohit@123',
    'BIKE',
    'MH14AB1234',
    'ONLINE'
);

INSERT INTO Delivery_Partner
(
    Full_Name,
    Email,
    Phone_Number,
    Password,
    Vehicle_Type,
    Vehicle_Number,
    Availability_Status
)
VALUES
(
    'Neha Joshi',
    'neha.joshi@email.com',
    '9876500102',
    'Neha@102',
    'SCOOTER',
    'MH14CD3156',
    'ONLINE'
);

-- Menu Item
INSERT INTO Menu_Item
(
    Restaurant_ID,
    Item_Name,
    Category,
    Price
)
VALUES
(
    1,
    'Paneer Butter Masala',
    'VEG',
    320
);

INSERT INTO Menu_Item
(
    Restaurant_ID,
    Item_Name,
    Category,
    Price
)
VALUES
(
    1,
    'Butter Naan',
    'VEG',
    45
);

INSERT INTO Menu_Item
(
    Restaurant_ID,
    Item_Name,
    Category,
    Price
)
VALUES
(
    1,
    'Dal Makhani',
    'VEG',
    170
);

INSERT INTO Menu_Item
(
    Restaurant_ID,
    Item_Name,
    Category,
    Price
)
VALUES
(
    1,
    'Gulab Jamun',
    'VEG',
    90
);

-- Orders
INSERT INTO Orders
(
    Customer_ID,
    Restaurant_ID,
    Delivery_Partner_ID,
    Delivery_Locality,
    Total_Amount
)
VALUES
(
    1,
    1,
    1,
    'Kothrud',
    640
);

INSERT INTO Orders
(
    Customer_ID,
    Restaurant_ID,
    Delivery_Partner_ID,
    Delivery_Locality,
    Total_Amount
)
VALUES
(
    1,
    1,
    2,
    'Kothrud',
    580
);

-- Order Item
INSERT INTO Order_Item
(
    Order_ID,
    Menu_Item_ID,
    Quantity,
    Unit_Price,
    Sub_Total
)
VALUES
(
    1,
    1,
    2,
    320.00,
    640.00
);

INSERT INTO Order_Item
(
    Order_ID,
    Menu_Item_ID,
    Quantity,
    Unit_Price,
    Sub_Total
)
VALUES
(
    2,
    1,
    1,
    320.00,
    320.00
);

INSERT INTO Order_Item
(
    Order_ID,
    Menu_Item_ID,
    Quantity,
    Unit_Price,
    Sub_Total
)
VALUES
(
    2,
    3,
    1,
    170.00,
    170.00
);

INSERT INTO Order_Item
(
    Order_ID,
    Menu_Item_ID,
    Quantity,
    Unit_Price,
    Sub_Total
)
VALUES
(
    2,
    4,
    1,
    90.00,
    90.00
);

-- Review
INSERT INTO Review
(
    Order_ID,
    Rating,
    Review_Text
)
VALUES
(
    1,
    5,
    'The paneer butter masala was rich, flavorful and freshly prepared.'
);

INSERT INTO Review
(
    Order_ID,
    Rating,
    Review_Text
)
VALUES
(
    2,
    5,
    'Delicious food, quick delivery, and excellent service.'
);

COMMIT;