CREATE TABLE buyers (
    buyer_ID VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    address VARCHAR2(200),
    city VARCHAR2(100),
    state_name VARCHAR2(2),
    zip VARCHAR2(10),
    phone VARCHAR2(20),
    email VARCHAR2(150),
    occupation VARCHAR2(100),
    salary NUMBER(10,2),
    credit_score NUMBER(3),
    CONSTRAINT pk_buyers PRIMARY KEY (buyer_ID)
);

CREATE TABLE employees (
    emp_ID VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    address VARCHAR2(200),
    city VARCHAR2(100),
    state_name VARCHAR2(2),
    zip VARCHAR2(10),
    phone VARCHAR2(20),
    email VARCHAR2(150),
    occupation VARCHAR2(100),
    salary NUMBER(10,2),
    CONSTRAINT pk_employees PRIMARY KEY (emp_ID)
);

CREATE TABLE contractors (
    contractor_ID VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    address VARCHAR2(200),
    city VARCHAR2(100),
    state_name VARCHAR2(2),
    zip VARCHAR2(10),
    phone VARCHAR2(20),
    email VARCHAR2(150),
    employer VARCHAR2(150),
    work_specialty VARCHAR2(100),
    pay_rate NUMBER(8,2),
    CONSTRAINT pk_contractors PRIMARY KEY (contractor_ID)
);

CREATE TABLE agents (
    agent_ID VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    address VARCHAR2(200),
    city VARCHAR2(100),
    state_name VARCHAR2(2),
    zip VARCHAR2(10),
    phone VARCHAR2(20),
    email VARCHAR2(150),
    commission NUMBER(5,2),
    CONSTRAINT pk_agents PRIMARY KEY (agent_ID)
);

CREATE TABLE properties (
    parcel_num VARCHAR2(50) NOT NULL,
    address VARCHAR2(200),
    city VARCHAR2(100),
    state_name VARCHAR2(2),
    zip VARCHAR2(10),
    sq_ft NUMBER(8),
    rooms NUMBER(3),
    bath NUMBER(3),
    market_value NUMBER(12,2),
    architecture_style VARCHAR2(100),
    key_features VARCHAR2(1000),
    CONSTRAINT pk_properties PRIMARY KEY (parcel_num)
);

CREATE TABLE sales (
    sale_ID VARCHAR2(50) NOT NULL,
    buyer_ID VARCHAR2(50),
    agent_ID VARCHAR2(50),
    parcel_num VARCHAR2(50),
    purch_date DATE,
    purch_amount NUMBER(12,2),
    CONSTRAINT pk_sales PRIMARY KEY (sale_ID),
    CONSTRAINT fk_sales_buyer FOREIGN KEY (buyer_ID) REFERENCES buyers(buyer_ID),
    CONSTRAINT fk_sales_agent FOREIGN KEY (agent_ID) REFERENCES agents(agent_ID),
    CONSTRAINT fk_sales_property FOREIGN KEY (parcel_num) REFERENCES properties(parcel_num)
);

CREATE TABLE agreements (
    agreement_ID VARCHAR2(50) NOT NULL,
    contractor_ID VARCHAR2(50),
    start_date DATE,
    end_date DATE,
    contract_description VARCHAR2(1000),
);


//agents

INSERT INTO agents (
    agent_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, commission
) VALUES (
    'A001', 'Michael', 'Brooks', '147 Sycamore Ave', 'Fort Wayne', 'IN', '46815',
    '(260) 555-0789', 'm.brooks@realty.com', 6.5
);

INSERT INTO agents (
    agent_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, commission
) VALUES (
    'A002', 'Amanda', 'Foster', '258 Hickory Road', 'Carmel', 'IN', '46033',
    '(317) 555-0890', 'amanda.foster@realty.com', 7.0
);

INSERT INTO agents (
    agent_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, commission
) VALUES (
    'A003', 'James', 'Sullivan', '369 Poplar Street', 'Fishers', 'IN', '46037',
    '(317) 555-0901', 'j.sullivan@realty.com', 6.0
);


//agreements

INSERT INTO agreements (
    agreement_ID, contractor_ID, start_date, end_date, contract_description
) VALUES (
    'AG001', 'C001', TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-04-15', 'YYYY-MM-DD'),
    'Kitchen and bathroom plumbing renovation for Heritage Lane property'
);

INSERT INTO agreements (
    agreement_ID, contractor_ID, start_date, end_date, contract_description
) VALUES (
    'AG002', 'C002', TO_DATE('2024-05-25', 'YYYY-MM-DD'), TO_DATE('2024-06-10', 'YYYY-MM-DD'),
    'Electrical panel upgrade and outlet installation for Riverside Drive property'
);

INSERT INTO agreements (
    agreement_ID, contractor_ID, start_date, end_date, contract_description
) VALUES (
    'AG003', 'C003', TO_DATE('2024-07-22', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'),
    'Hardwood floor refinishing and installation for Victorian Court property'
);


//buyers

INSERT INTO buyers (
    buyer_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary, credit_score
) VALUES (
    'B001', 'Sarah', 'Mitchell', '1247 Oak Street', 'Fort Wayne', 'IN', '46805',
    '(260) 555-0123', 'sarah.mitchell@email.com', 'Software Engineer', 85000, 742
);

INSERT INTO buyers (
    buyer_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary, credit_score
) VALUES (
    'B002', 'Marcus', 'Rodriguez', '892 Pine Avenue', 'Indianapolis', 'IN', '46220',
    '(317) 555-0187', 'm.rodriguez@gmail.com', 'Marketing Manager', 67500, 689
);

INSERT INTO buyers (
    buyer_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary, credit_score
) VALUES (
    'B003', 'Emily', 'Chen', '456 Maple Drive', 'Carmel', 'IN', '46032',
    '(317) 555-0245', 'emily.chen.realtor@yahoo.com', 'Physician', 165000, 801
);

INSERT INTO buyers (
    buyer_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary, credit_score
) VALUES (
    'B004', 'David', 'Thompson', '2103 Elm Boulevard', 'Fishers', 'IN', '46038',
    '(317) 555-0334', 'dthompson@outlook.com', 'Financial Advisor', 92000, 728
);



// contractors


INSERT INTO contractors (
    contractor_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, employer, work_specialty, pay_rate
) VALUES (
    'C001', 'Tony', 'Gonzalez', '741 Ash Drive', 'Fort Wayne', 'IN', '46806',
    '(260) 555-1012', 't.gonzalez@contractors.com', 'Premier Home Services', 'Plumbing', 85
);

INSERT INTO contractors (
    contractor_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, employer, work_specialty, pay_rate
) VALUES (
    'C002', 'Rachel', 'Murphy', '852 Spruce Lane', 'Indianapolis', 'IN', '46250',
    '(317) 555-1123', 'rachel.murphy@electric.net', 'ElectriPro Inc', 'Electrical', 92
);

INSERT INTO contractors (
    contractor_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, employer, work_specialty, pay_rate
) VALUES (
    'C003', 'Kevin', 'Taylor', '963 Chestnut Road', 'Carmel', 'IN', '46074',
    '(317) 555-1234', 'k.taylor@flooring.biz', 'Taylor Flooring Co', 'Flooring', 78
);



//employees



INSERT INTO employees (
    emp_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary
) VALUES (
    'E001', 'Jennifer', 'Walsh', '789 Birch Lane', 'Fort Wayne', 'IN', '46804',
    '(260) 555-0456', 'j.walsh@company.com', 'Office Manager', 48000
);

INSERT INTO employees (
    emp_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary
) VALUES (
    'E002', 'Robert', 'Kim', '321 Cedar Court', 'Indianapolis', 'IN', '46240',
    '(317) 555-0567', 'robert.kim@company.com', 'Accountant', 65000
);

INSERT INTO employees (
    emp_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary
) VALUES (
    'E003', 'Lisa', 'Anderson', '654 Willow Street', 'Noblesville', 'IN', '46060',
    '(317) 555-0678', 'l.anderson@company.com', 'HR Director', 72000
);

// properties


INSERT INTO employees (
    emp_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary
) VALUES (
    'E001', 'Jennifer', 'Walsh', '789 Birch Lane', 'Fort Wayne', 'IN', '46804',
    '(260) 555-0456', 'j.walsh@company.com', 'Office Manager', 48000
);

INSERT INTO employees (
    emp_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary
) VALUES (
    'E002', 'Robert', 'Kim', '321 Cedar Court', 'Indianapolis', 'IN', '46240',
    '(317) 555-0567', 'robert.kim@company.com', 'Accountant', 65000
);

INSERT INTO employees (
    emp_ID, first_name, last_name, address, city, state_name, zip,
    phone, email, occupation, salary
) VALUES (
    'E003', 'Lisa', 'Anderson', '654 Willow Street', 'Noblesville', 'IN', '46060',
    '(317) 555-0678', 'l.anderson@company.com', 'HR Director', 72000
);

//sales

INSERT INTO sales (
    sale_ID, buyer_ID, agent_ID, parcel_num, purch_date, purch_amount
) VALUES (
    'S001', 'B001', 'A001', 'P001', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 275000
);

INSERT INTO sales (
    sale_ID, buyer_ID, agent_ID, parcel_num, purch_date, purch_amount
) VALUES (
    'S002', 'B002', 'A002', 'P002', TO_DATE('2024-05-22', 'YYYY-MM-DD'), 190000
);

INSERT INTO sales (
    sale_ID, buyer_ID, agent_ID, parcel_num, purch_date, purch_amount
) VALUES (
    'S003', 'B003', 'A002', 'P003', TO_DATE('2024-07-18', 'YYYY-MM-DD'), 420000
);

INSERT INTO sales (
    sale_ID, buyer_ID, agent_ID, parcel_num, purch_date, purch_amount
) VALUES (
    'S004', 'B004', 'A003', 'P004', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 355000
);