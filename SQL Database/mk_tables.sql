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