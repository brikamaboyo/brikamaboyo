
CREATE TABLE BANK(
	bank_code INTEGER,
	bank_name VARCHAR(40),
	bank_headquater VARCHAR(40),
	CONSTRAINT bank_code_pk PRIMARY KEY(bank_code)
	
);

-- KEEPS DIFFERENT BRANCHES OF A BANK
CREATE TABLE BANKBRANCH(
	bank_branch_code INTEGER,
	bank_code INTEGER,
	bank_branch_address VARCHAR(40),
	bank_branch_phone VARCHAR(40),
	bank_branch_email VARCHAR(40),
	CONSTRAINT bank_pk PRIMARY KEY(bank_branch_code),
	CONSTRAINT bankbranch_bank_fk FOREIGN KEY(bank_code) REFERENCES BANK(bank_code)
);

-- DIFFERENT QUALIFICATIONS THAT MIGHT BE POSSESSED BY A CONTRACTOR
CREATE TABLE QUALIFICATION(
	qualification_code INTEGER IDENTITY(1,1),
	qualification_name  VARCHAR(40),
	CONSTRAINT qualification_code_pk PRIMARY KEY(qualification_code)
);

CREATE TABLE REGION (
 region_code INTEGER,
 region_name VARCHAR(40),
 CONSTRAINT region_pk PRIMARY KEY (region_code)
);

-- DIFFERENT TYPES OF DOCUMENTS THAT MIGHT BE PRESENTED FOR IDENTIFICATION BY CONTRACTORS
CREATE TABLE DOCUMENT(
	document_code INTEGER IDENTITY(100,1),
	document_name VARCHAR(40),
	CONSTRAINT document_pk PRIMARY KEY(document_code)
);

-- KEEPS ALL THE CONTRACT TYPES THAT ARE AVAILABE IN WAEC 
CREATE TABLE CONTRACT (
	contract_code INTEGER IDENTITY(1,1),
	contract_type VARCHAR(40),
	CONSTRAINT contract_pk PRIMARY KEY(contract_code)
);

CREATE TABLE SCHOOL(
	scl_code VARCHAR(10),
	scl_name VARCHAR(40),
	sch_level VARCHAR(40),
	scl_region INTEGER,
	CONSTRAINT junsch_pk PRIMARY KEY(scl_code),
	CONSTRAINT sch_region_fk FOREIGN KEY(scl_region) REFERENCES REGION(region_code)
);

CREATE TABLE CONTRACTOR(
	contractor_code INTEGER, 
	contract_code INTEGER,
	first_name VARCHAR(40),
	middle_name VARCHAR(40),
	last_name VARCHAR(40),
	dob DATE,
	photo VARBINARY(MAX),
	registration_date DATE ,
	nationality VARCHAR(40),
	document INTEGER,
	phone VARCHAR(20), -- newly added
	address VARCHAR(20), -- newly added 
	status VARCHAR(40), --ACTIVE OR INACTIVE
	field_of_study VARCHAR(40),
	contractor_region INTEGER,
	CONSTRAINT contractor_pk PRIMARY KEY(contractor_code),
	CONSTRAINT contract_detail_fk FOREIGN KEY(contract_code) REFERENCES CONTRACT(contract_code),
	CONSTRAINT contractor_document_fk FOREIGN KEY(document) REFERENCES DOCUMENT(document_code),
	CONSTRAINT contractor_region_fk FOREIGN KEY(contractor_region) REFERENCES REGION(region_code)
);

CREATE TABLE CONTRACTORBANK(
	contractor_bank INTEGER,
	contractor INTEGER,
	account_Number VARCHAR(40),
	account_name VARCHAR(40),
	bban VARCHAR(40),
	CONSTRAINT contrabank_pk PRIMARY KEY(contractor_bank, contractor, account_Number),
	CONSTRAINT contractor_bank_fk FOREIGN KEY(contractor_bank) REFERENCES BANK(bank_code),
	CONSTRAINT contrabank_contractor_INTEGER_fk FOREIGN KEY(contractor) REFERENCES CONTRACTOR(contractor_code)
);

--KEEPS CONTRACTOR QUALIFICATIONS
CREATE TABLE CONTRACTORQUALIFICATION(
	contra_qual_code INTEGER,
	contractor_id INTEGER,
	qualification_date DATE,
	description VARCHAR(300),
	CONSTRAINT contractor_qual_pk PRIMARY KEY(contra_qual_code, contractor_id),
	CONSTRAINT contra_qual_fk FOREIGN KEY(contra_qual_code) REFERENCES QUALIFICATION(qualification_code),
	CONSTRAINT contractor_id_fk FOREIGN KEY(contractor_id) REFERENCES CONTRACTOR(contractor_code)
);

CREATE TABLE CONTRACTORSCHOOL(
	contractor_code INTEGER,
	contractor_sch VARCHAR(10),
	contracotr_subject VARCHAR(10), -- newly added 
	join_date DATE,
	status VARCHAR(20), -- this indentified whether the school is current or previous
	CONSTRAINT contractor_school_pk PRIMARY KEY(contractor_code, contractor_sch),
	CONSTRAINT contractor_school_fk FOREIGN KEY(contractor_sch) REFERENCES SCHOOL(scl_code),
	CONSTRAINT contractor_code_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code)
);

CREATE TABLE CONTRACTORTUTORIALCLASS(
	contractorID INTEGER,
	schoolID VARCHAR(10),
	start_date DATE, 
	status VARCHAR(10), -- whether current or previous
	CONSTRAINT tutorial_class_pk PRIMARY KEY(contractorID, schoolID),
	CONSTRAINT tutorial_class_contractor FOREIGN KEY(contractorID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT tutorial_class_sch FOREIGN KEY(schoolID) REFERENCES SCHOOL(scl_code)
);
CREATE TABLE EXAMDIET(
	diet_code VARCHAR(10),
	dietName VARCHAR(20),
	CONSTRAINT examDiet_dietCode_pk PRIMARY KEY(diet_code),
);
CREATE TABLE EXAMCATEGORY(
	exam_category_code VARCHAR(10),
	exam_category_name VARCHAR(100), -- WASSCE, GABECE OR NAT
	diet_code VARCHAR(10), -- INDICATES THE TIME OF THE EXAM 
	CONSTRAINT examCategory_pk PRIMARY KEY(exam_category_code),
	CONSTRAINT examCategoryDiet_fk FOREIGN KEY(diet_code) REFERENCES EXAMDIET(diet_code),
);

CREATE TABLE BLACKLIST(
	contractor_code INTEGER,
	dates DATE,
	description VARCHAR(500),
	CONSTRAINT blacklist_examiner_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code)
);

--NOW I AM COMING TO SPECIFY TABLES FOR SUBJECTS AND EXAMS

CREATE TABLE SUBJECT(
	subject_code VARCHAR(10),
	subject_name VARCHAR(60),
	exam_category_code VARCHAR(10),
	iscore_subject VARCHAR(5),
	CONSTRAINT cabecesubject_pk PRIMARY KEY(subject_code, exam_category_code),
	CONSTRAINT SUBJECT_exam_category_code_fk FOREIGN KEY(exam_category_code) REFERENCES EXAMCATEGORY(exam_category_code)
);

-- THIS TABLE RECORDS ALL THE SUBJECT PAPERS AND THEIR RATES
CREATE TABLE SUBJECTPAPER( 
	subject_paper_code VARCHAR(10), -- THEORY, ESSAY ETC
	subject_code VARCHAR(10), -- THE EXAM SUBJECT
	exam_category_code VARCHAR(10), -- SUBJECT LEVEL (GABECE, WASSCE OR NAT)
	subject_paper_rate DECIMAL(8,2),
	CONSTRAINT gsub_paper_pk PRIMARY KEY(subject_paper_code),
	CONSTRAINT gsub_paper_fk FOREIGN KEY(subject_code, exam_category_code) REFERENCES SUBJECT(subject_code, exam_category_code),
);


CREATE TABLE COURSEWORK(
	subject_id VARCHAR(10),
	Cwrok_exam_category VARCHAR(10), --THIS INDICATE IF PRACTICAL IS FOR WASSCE OR GABECE
	Cwork_name VARCHAR(20),
	courseword_rate DECIMAL(8,2),
	remarks VARCHAR(500),
	CONSTRAINT coursework_pk PRIMARY KEY(Cwork_name),
	CONSTRAINT coursework_subject_fk FOREIGN KEY(subject_id, Cwrok_exam_category) REFERENCES SUBJECT(subject_code, exam_category_code),
	CONSTRAINT courseWork_SubjectLevel_fk FOREIGN KEY(Cwrok_exam_category) REFERENCES EXAMCATEGORY(exam_category_code),
);

CREATE TABLE PRACTICAL(
	subject_id VARCHAR(10),
	exam_category_code VARCHAR(10), --THIS INDICATE IF PRACTICAL IS FOR WASSCE OR GABECE
	practical_name VARCHAR(20),
	practical_rate DECIMAL(8,2),
	remarks VARCHAR(500),
	CONSTRAINT practical_work_pk PRIMARY KEY(practical_name),
	CONSTRAINT practical_work_subject_fk FOREIGN KEY(subject_id, exam_category_code) REFERENCES SUBJECT(subject_code, exam_category_code)
);

CREATE TABLE ORAL(
	oral_subject VARCHAR(10),
	oral_exam_category VARCHAR(10),
	oral_exam_diet VARCHAR(10),
	oral_description VARCHAR(50),
	CONSTRAINT oral_oralSubject_pk PRIMARY KEY(oral_subject),
	CONSTRAINT oralSubject_subject FOREIGN KEY(oral_subject, oral_exam_category) REFERENCES SUBJECT(subject_code, exam_category_code),
	CONSTRAINT oral_category_fk FOREIGN KEY(oral_exam_category) REFERENCES EXAMCATEGORY(exam_category_code),
	CONSTRAINT oral_OralExamDiet_fk FOREIGN KEY(oral_exam_diet) REFERENCES EXAMDIET(diet_code),
);

--ALLOCATE COURSEWORK TO A CONTRACTOR
CREATE TABLE COURSEWORKALLOCATION(
	SN INTEGER,
	contractor_code INTEGER,
	Cwork_name VARCHAR(10),
	number_of_works INTEGER,
	dates DATE,
	CONSTRAINT courseWorkAllocation_SN_pk PRIMARY KEY(SN),
	CONSTRAINT courseWorkAllocation_Contractor_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT courseWork_courseName_fk FOREIGN KEY(Cwork_name) REFERENCES COURSEWORK(Cwork_name),
);

--ALLOCATE PRACTICAL TO A CONTRACTOR
CREATE TABLE PRACTICALALLOCATION(
	SN INTEGER,
	contractor_code INTEGER,
	practical_name VARCHAR(10),
	number_of_works INTEGER,
	dates DATE,
	CONSTRAINT practicalAllocation_SN_pk PRIMARY KEY(SN),
	CONSTRAINT practicalAllocation_Contractor_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT practical_courseName_fk FOREIGN KEY(practical_name) REFERENCES PRACTICAL(practical_name),
);

--ALLOCATE ORAL TO A CONTRACTOR
CREATE TABLE ORALALLOCATION(
	SN INTEGER,
	contractor_code INTEGER,
	oral_subject VARCHAR(10),
	number_of_works INTEGER,
	dates DATE,
	CONSTRAINT courseWorkAllocation_SN_pk PRIMARY KEY(SN),
	CONSTRAINT courseWorkAllocation_Contractor_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT courseWork_courseName_fk FOREIGN KEY(oral_subject) REFERENCES ORAL(oral_subject),
);

CREATE TABLE EXAMCENTER(
	region_code INTEGER,
	centre_NUMBER VARCHAR(10),
	centre_name VARCHAR(40),
	centre_type VARCHAR(40), -- IDENTIFIED IF THE CENTER IS FOR (NAT, WASSCE OR GABECE)
	centre_address VARCHAR(40), -- SOME CENTERS CAN BE USED FOR BOTH GABECE AND WASSCE
	contact_person VARCHAR(40),
	phone VARCHAR(40),
	email VARCHAR(40),
	CONSTRAINT examcenter_pk PRIMARY KEY(centre_NUMBER),
	CONSTRAINT examcenter_region_fk FOREIGN KEY(region_code) REFERENCES REGION(region_code)
	-- A REFERENCE TO EXAM CATEGORY SHOULD BE ADDED HERE  FOR centre_type
);

-- SCRIPT ALLOCATION TO EXAMINERS FOR MARKING
CREATE TABLE SCRIPTALLOCATION( 
	center_code VARCHAR(10),
	subjectCode VARCHAR(10),
	subject_level VARCHAR(10),
	examinerID INTEGER,
	subjectPaperCode VARCHAR(10),
	numOfScript INTEGER,
	numberOfScriptMarked INTEGER,
	allocatioction_date DATE,
	CONSTRAINT seniorScriptMarking_pk PRIMARY KEY(center_code, subjectCode, examinerID),
	CONSTRAINT schoolid_fk FOREIGN KEY(center_code) REFERENCES EXAMCENTER(centre_NUMBER),
	CONSTRAINT subjectMarked_fk FOREIGN KEY(subjectCode, subject_level) REFERENCES SUBJECT(subject_code, exam_category_code),
	CONSTRAINT gScript_examiner_fk FOREIGN KEY(examinerID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT gScriptAllocation_examPaperCode_fk FOREIGN KEY(subjectPaperCode) REFERENCES SUBJECTPAPER(subject_paper_code),

);

-- ALLOWANCE PAYMENT TO DIFFERENT CONTRACTORS BASED ON THE LOCATION AND STATUS

CREATE TABLE TOWNSTATUS(
	status_code INTEGER,
	town_description VARCHAR(40), --
	CONSTRAINT townstatus_pk PRIMARY KEY(status_code)
);

CREATE TABLE TOWN(
	town_code INTEGER,
	town_name VARCHAR(40),
	town_location INTEGER,
	CONSTRAINT town_town_code_pk PRIMARY KEY(town_code),
	CONSTRAINT townLocation_fk FOREIGN KEY(town_location) REFERENCES TOWNSTATUS(status_code)
);
			

CREATE TABLE TRANSPORTFARE(
	towncode INTEGER,
	townStatusCode INTEGER,
	fareRate DECIMAL(8,2),
	CONSTRAINT transportfare_pk PRIMARY KEY(towncode, townStatusCode, fareRate),
	CONSTRAINT townstatus_code_fk FOREIGN KEY(townStatusCode) REFERENCES TOWNSTATUS(status_code),
	CONSTRAINT TransportFare_townCode_fk FOREIGN KEY(towncode) REFERENCES TOWN(town_code),
);

CREATE TABLE VEHICLE(
	vehicle_code INTEGER,
	vehicle_type VARCHAR(40),
	CONSTRAINT vehicle_pk PRIMARY KEY(vehicle_code)
);

CREATE TABLE EVIHECLEREGISTRATION(
	vehicle_code INTEGER,
	insurance VARCHAR(20),
	licence VARCHAR(20),
	vehicleNumber VARCHAR(20),
	contractor_code INTEGER,
	CONSTRAINT eVihecleReg_contractor_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT eVihecleReg_vehicleCode_fk FOREIGN KEY(vehicle_code) REFERENCES VEHICLE(vehicle_code),
);

--CREATE TABLE OVERNIGHT(
	--town_code INTEGER,
	--townStatus INTEGER,
--	overnight_rate DECIMAL(8,2),
--	fareRate DECIMAL(8,2),
	--CONSTRAINT townForOvernightAllowance FOREIGN KEY(town_code) REFERENCES TOWN(town_code),
	--CONSTRAINT townStatus_forOvernight FOREIGN KEY(townStatus) REFERENCES TOWNSTATUS(status_code)
--);

CREATE TABLE OVERNIGHTALLOWANCE(
	townCode INTEGER, 
	townStatusCode INTEGER,
	contractor_code INTEGER,
	overnight_rate DECIMAL(8,2),
	startDate DATE,
	endDate DATE,
	amountEarned DECIMAL(8,2),
	CONSTRAINT townForOvernightAllowance_fk FOREIGN KEY(townCode) REFERENCES TOWN(town_code),
	CONSTRAINT townStatus_forOvernight_fk FOREIGN KEY(townStatusCode) REFERENCES TOWNSTATUS(status_code),
	CONSTRAINT contractor_overnightAllowance_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code),
);

CREATE TABLE VEHICLEREFUND(
	towncode INTEGER, -- specifies the town
	townStatusCode INTEGER, --urban or rural
	vehicleCode INTEGER,
	vehicleNumber VARCHAR(20), -- IDENTIFIES THE VEHICLE ITSELF
	contractor_code INTEGER,
	startDate DATE,
	endDate DATE,
	amountEarned DECIMAL(8,2),
	--vehicle_refund_rate DECIMAL(8,2), -- THE RATE FOR REFUNDING THE VEHICLE USED 
	CONSTRAINT vehicle_refund_pk PRIMARY KEY(towncode, townStatusCode, vehicleCode),
	CONSTRAINT towncode_fk FOREIGN KEY(towncode) REFERENCES TOWN(town_code),
	CONSTRAINT townstatus_vehicle_fk FOREIGN KEY(townStatusCode) REFERENCES TOWNSTATUS(status_code),
	CONSTRAINT vehicle_code_fk FOREIGN KEY(vehicleCode) REFERENCES VEHICLE(vehicle_code),
	CONSTRAINT contractor_vehicleRefund_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code),
);

CREATE TABLE TRANSPORTREFUND(
	townCode INTEGER,
	townStatusCode INTEGER,
	--vehicleNumber VARCHAR(20),
	startDate DATE, 
	endDate DATE,
	amount_earned DECIMAL(8,2),
	CONSTRAINT townstatus_transport_fk FOREIGN KEY(townStatusCode) REFERENCES TOWNSTATUS(status_code),
	CONSTRAINT TransportRefund_towncode_fk FOREIGN KEY(townCode) REFERENCES TOWN(town_code),

);

--TABLES TO CAPTURE DIFFRENT MEETINGS AND ENTITLEMENT FOR EACH
CREATE TABLE MEETINGS(
	meeting_code INTEGER,
	meeting_type VARCHAR(40), -- DIFFERENT TYPES OF MEETINGS (VETTING, COORDIANTION, REPORT)
	exam_category_code VARCHAR(10), -- TALS ABOUT THE TYPE OF EXAM (GABECE, WASSCE ETC)
	meeting_rate DECIMAL(8,2),
	lunch_allowance DECIMAL(8,2),  -- LUNCH ALLOWANCE
	refreshment DECIMAL(8,2), -- REFRESHMENT ALLOWANCE 
	CONSTRAINT meeting_meetingCode_pk PRIMARY KEY(meeting_code),
	CONSTRAINT meeting_exam_category_code FOREIGN KEY(exam_category_code) REFERENCES EXAMCATEGORY(exam_category_code),
);

--INSERT INTO MEETINGS VALUES(1, 'COORDINATION MEETING', 'WASSCE', 103.01,);

CREATE TABLE MEETINGDETAILS( -- THIS WILL CAPTURE ALL TYPES OF MEETINGS -- VETTING AND COORDINATION MEETINGS AND REPORT
	MSN INTEGER,	 -- MEETING SERIAL NUMBER				 
	meeting_code INTEGER,
	mStart_Date DATE,
	mEnd_date DATE,
	exam_category_code VARCHAR(10),
	subject_code VARCHAR(10),
	CONSTRAINT meetingDetails_pk PRIMARY KEY(MSN),
	CONSTRAINT meetingDetails_meetingCode_fk FOREIGN KEY(meeting_code) REFERENCES MEETINGS(meeting_code),
	CONSTRAINT meeting_examCategory_fk FOREIGN KEY(exam_category_code) REFERENCES EXAMCATEGORY(exam_category_code),
	CONSTRAINT meeting_subjectCode_fk FOREIGN KEY(subject_code, exam_category_code) REFERENCES SUBJECT (subject_code, exam_category_code),
	);
	
CREATE TABLE MEETINGATTENDANCE( 
	meeting_code INTEGER,	
	contractor_code INTEGER, -- THIS IDENTIFIED THE ID OR CODE ASSIGNED TO THE CONTRACTOR 
	time_in datetime,
	time_out datetime,
	CONSTRAINT meeting_attendance_fk FOREIGN KEY(meeting_code) REFERENCES MEETINGDETAILS(MSN),
); -- NOTE: WE WILL BE ABLE TO CALCULATE THE ENTITLEMENT OF EACH PARTICIPANT AND THEIR LUNCH AND REFRESHMENT 

--INVIGILATION 
CREATE TABLE INVIGILATION(
	centerNo VARCHAR(10),
	invigilator_code INTEGER,
	subject_paper_code VARCHAR(10),
	invigilation_Date DATE,
	amountEarned DECIMAL(8,2),
	CONSTRAINT contractor_invigilation_fk FOREIGN KEY(invigilator_code) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT invigilator_centerNo_fk FOREIGN KEY(centerNo) REFERENCES EXAMCENTER(centre_NUMBER),
	CONSTRAINT INVIGILATOR_subjectPaperCode_fk FOREIGN KEY(subject_paper_code) REFERENCES SUBJECTPAPER(subject_paper_code),
);

CREATE TABLE REPORTRATE(
	report_rate_code VARCHAR(10), 
	report_description VARCHAR(20),
	report_rate DECIMAL(8,2),
	CONSTRAINT reportRateCode_pk PRIMARY KEY(report_rate_code),
	
);
CREATE TABLE REPORT(
	contractor_code INTEGER,
	diet_code VARCHAR(10),
	subject_paper_code VARCHAR(10),
	exam_category_code VARCHAR(10),
	report_rate_code VARCHAR(10),
	
);

CREATE TABLE SUPERVISION(
	centerNo VARCHAR(10),
	examiner_code INTEGER,
	subject_paper_code VARCHAR(10),
	supervision_Date DATE,
	amountEarned DECIMAL(8,2),
	CONSTRAINT contractor_supervision_fk FOREIGN KEY(examiner_code) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT supervision_centerNo_fk FOREIGN KEY(centerNo) REFERENCES EXAMCENTER(centre_NUMBER),
);

CREATE TABLE VETTING(
	contractor_code INTEGER,
	subject_paper_code VARCHAR(10),
	number_of_script INTEGER,
	centerNo VARCHAR(10),
	dates DATE,
	
);
CREATE TABLE DEPARTMENT(
	dept_id VARCHAR(5),
	dept_name VARCHAR(20),
	CONSTRAINT departmentID_pk PRIMARY KEY(dept_id),
);

CREATE TABLE WAECOFFICER(
	officer_id INTEGER,
	officerFN VARCHAR(40),
	officerMN VARCHAR(40),
	officerLN VARCHAR(40),
	phone_number VARCHAR(40),
	email VARCHAR(20),
	dept_id VARCHAR(5),
	ranks VARCHAR(20),
	username VARCHAR(20),
	password VARCHAR(20),
	CONSTRAINT subject_officer_pk primary KEY(officer_id),
	CONSTRAINT waecOfficer_department_fk FOREIGN KEY(dept_id) REFERENCES DEPARTMENT(dept_id),
);

CREATE TABLE CLAIMANT(
	claim_type VARCHAR(20),	
	contractor_code INTEGER, 
	total_fee DECIMAL(8,2),
	checked_by VARCHAR(20),
	confirmed_by VARCHAR(20), 
	approved_by VARCHAR(20), 
	clain_date DATE, 
 
);

CREATE TABLE USERS(
	users_id INTEGER,
	user_role INTEGER,
	subject_paper VARCHAR(10),
	username VARCHAR(20) UNIQUE NOT NULL,
	password VARCHAR(20) NOT NULL,
	CONSTRAINT users_userID_pk PRIMARY KEY(users_id),
	CONSTRAINT users_userID_fk FOREIGN KEY(users_id) REFERENCES CONTRACTOR(contractor_code), 
	CONSTRAINT users_subjectPaper_fk FOREIGN KEY(subject_paper) REFERENCES SUBJECTPAPER(subject_paper_code)
)

-- LOGS TABLE should be created to keep track of the different logins

CREATE TABLE SETUP( -- THIS TABLE SEEKS TO VALIDATE THE LENGTH OF CANDIDATE CODES 
	exam_category_code VARCHAR(10),
	Cnadidate_num_length INTEGER,
	exam_paper_length INTEGER,
	CONSTRAINT setup_examCategory_fk FOREIGN KEY(exam_category_code) REFERENCES EXAMCATEGORY(exam_category_code),
);
--MARK ENTRY

CREATE TABLE MARKENTRY(
	subject_paper_code VARCHAR(10),
	marks DECIMAL(8,2),
	keyed_count INTEGER,
	remarks VARCHAR(500),
	CONSTRAINT markEntry_subjectPaper_fk FOREIGN KEY(subject_paper_code) REFERENCES SUBJECTPAPER(subject_paper_code),
); -- THERE SHOULD BE A CHECKING THAT VALIDATES THE EXAMINER ENTERING MARKS IS THE ONE HAS BEEN ALLOCATED THE SCRIPTS

CREATE TABLE ITEMWRITING(
	subject_code VARCHAR(10),
	exam_category_code VARCHAR(10),
	subject_paper_code VARCHAR(10),
	examiner_code INTEGER,
	item_count INTEGER,
	item_rate DECIMAL(8,2),
	dates DATE,
	CONSTRAINT itemMarking_subjectCode_fk FOREIGN KEY(subject_code, exam_category_code) REFERENCES SUBJECT(subject_code,exam_category_code),
	--CONSTRAINT itemMarking_examCategory_fk FOREIGN KEY(exam_category_code) REFERENCES EXAMCATEGORY(exam_category_code),
	CONSTRAINT itemMarking_subjectPaper_fk FOREIGN KEY(subject_paper_code) REFERENCES SUBJECTPAPER(subject_paper_code),
	CONSTRAINT itemMaking_examiner_fk FOREIGN KEY(examiner_code) REFERENCES CONTRACTOR(contractor_code)
);

CREATE TABLE LOGS(
	SN INTEGER IDENTITY(1,1),
	userID INTEGER, 
	dates DATETIME,
	activity VARCHAR(MAX), -- TO CAPTURE ALL THE DETAILS OF ACTIVITY 
	CONSTRAINT logs_serialNo_pk primary KEY(SN),
	CONSTRAINT logs_userID_fk FOREIGN KEY(userID) REFERENCES USERS(users_id),
);









INSERT INTO EXAMCATEGORY VALUES('WASSCE', 'WEST AFRICAN SENIOR SCHOOL CERTIFICATE EXAMINATION');
INSERT INTO EXAMCATEGORY VALUES('GABECE', 'GAMBIA BASIC EDUCATION CERTIFICATE EXAMINATON');

INSERT INTO SUBJECT VALUES('ENG', 'ENGLISH', 'GABECE', 'YES');
INSERT INTO SUBJECT VALUES('MAT', 'MATHEMATICS', 'GABECE', 'YES');
INSERT INTO SUBJECT VALUES('SCI', 'SCIENCE', 'GABECE', 'YES');
INSERT INTO SUBJECT VALUES('AGR', 'AGRICULTURE', 'GABECE', 'NO');
INSERT INTO SUBJECT VALUES('IRK', 'ISLAMIC STUDIES', 'GABECE', 'NO');
INSERT INTO SUBJECT VALUES('ART', 'ARTS', 'GABECE', 'NO');
INSERT INTO SUBJECT VALUES('HEC', 'HOME ECONOMICS', 'GABECE', 'NO');
INSERT INTO SUBJECT VALUES( 'WWK', 'WOOD WORK', 'GABECE', 'NO');

INSERT INTO SUBJECT VALUES('ENG', 'ENGLISH', 'WASSCE', 'YES');
INSERT INTO SUBJECT VALUES('MAT', 'MATHEMATICS', 'WASSCE', 'YES');
INSERT INTO SUBJECT VALUES('PHY', 'PHYSICS', 'WASSCE', 'YES');
INSERT INTO SUBJECT VALUES('CHE', 'CHEMISTRY', 'WASSCE', 'YES');
INSERT INTO SUBJECT VALUES('GOV', 'GOVERNMENT', 'WASSCE', 'NO');
INSERT INTO SUBJECT VALUES('GEO', 'GEOGRAPHY', 'WASSCE', 'NO');
INSERT INTO SUBJECT VALUES('HIS', 'HISTORY', 'WASSCE', 'NO');

INSERT INTO SUBJECTPAPER VALUES('ENG001', 'ENG', 'GABECE', 8.94 );
INSERT INTO SUBJECTPAPER VALUES('MAT001', 'MAT', 'GABECE', 8.21 );
INSERT INTO SUBJECTPAPER VALUES('SCI001', 'SCI', 'GABECE', 8.21 );
INSERT INTO SUBJECTPAPER VALUES('AGR002', 'AGR', 'GABECE', 8.21 );
INSERT INTO SUBJECTPAPER VALUES('AGRT003', 'AGR', 'GABECE', 8.21 );
INSERT INTO SUBJECTPAPER VALUES('IRK001', 'IRK', 'GABECE', 8.21 );
INSERT INTO SUBJECTPAPER VALUES('ART002', 'ART', 'GABECE', 8.21 );
INSERT INTO SUBJECTPAPER VALUES('HOE002', 'HEC', 'GABECE', 8.21 );

INSERT INTO SUBJECTPAPER VALUES('MAT101', 'MAT', 'WASSCE', 10.03 );
INSERT INTO SUBJECTPAPER VALUES('ENG101', 'ENG', 'WASSCE', 11.56 );
INSERT INTO SUBJECTPAPER VALUES('PHY101', 'PHY', 'WASSCE', 10.03 );
INSERT INTO SUBJECTPAPER VALUES('CHE101', 'CHE', 'WASSCE', 10.03 );
INSERT INTO SUBJECTPAPER VALUES('GOV101', 'GOV', 'WASSCE', 10.03 );
INSERT INTO SUBJECTPAPER VALUES('GEO101', 'GEO', 'WASSCE', 10.03 );
INSERT INTO SUBJECTPAPER VALUES('HIS101', 'HIS', 'WASSCE', 10.03 );

INSERT INTO COURSEWORK VALUES('WWK','GABECE', 'WOOD WORK COURSEWORK', 8.21, 'THIS IS THE WOOD WORK PRACTICAL');

INSERT INTO REGION VALUES(1, 'GREATER BANJUL AREA');
INSERT INTO REGION VALUES(2, 'WEST COAST REGION');
INSERT INTO REGION VALUES(6, 'CENTRAL RIVER RIGION');
INSERT INTO REGION VALUES(3, 'NORTH BANK REION'); 

INSERT INTO EXAMCENTER VALUES(1, '803000123', 'GSSS', 'WASSCE', 'BANJUL', 'MR. JOHNSON', '2345432', 'john@gmail.com');

INSERT INTO BANK VALUES(4501, 'AGIB', 'BANJUL');
INSERT INTO BANK VALUES(4601, 'GTBANK', 'KAIRABA AVENUE');
INSERT INTO BANK VALUES(4701, 'ACCESS BANK', 'KAIRABA AVENUE');

INSERT INTO BANKBRANCH VALUES(4511, 4501,'BRUSUBI', '3550555', 'agib@gmail.com');
INSERT INTO BANKBRANCH VALUES(4512, 4501,'BRIKAMA', '3129988', 'agib@gmail.com');
INSERT INTO BANKBRANCH VALUES(4513, 4501,'LATRIKUNDA', '9905567', 'agib@gmail.com');
INSERT INTO BANKBRANCH VALUES(4611, 4601,'BRUSUBI', '2233445', 'gtb@gmail.com');
INSERT INTO BANKBRANCH VALUES(4612, 4601,'LAMIN', '4567788', 'gtb@gmail.com');
INSERT INTO BANKBRANCH VALUES(4613, 4601,'SENEGAMBIA', '5435566', 'gtb@gmail.com');

INSERT INTO QUALIFICATION VALUES('ADVANCED DIPLOMA PRIMARY');
INSERT INTO QUALIFICATION VALUES('ADVANCED DIPLOMA SECONDARY');
INSERT INTO QUALIFICATION VALUES('DIPLOMA PRIMARY');
INSERT INTO QUALIFICATION VALUES('DIPLOMA SECONDARY');
INSERT INTO QUALIFICATION VALUES('BACHELORS');
INSERT INTO QUALIFICATION VALUES('MASTERS');

INSERT INTO DOCUMENT VALUES(10, 'NATIONAL ID CARD');
INSERT INTO DOCUMENT VALUES(11, 'DRIVING LICENSE');
INSERT INTO DOCUMENT VALUES(12, 'VOTERS CARD');
INSERT INTO DOCUMENT VALUES(13, 'PASSPORT');

INSERT INTO CONTRACT VALUES('CHIEF EXAMINER');
INSERT INTO CONTRACT VALUES('ASSISSTANT EXAMINER');
INSERT INTO CONTRACT VALUES('SUPERVISOR');
INSERT INTO CONTRACT VALUES('INVIGILATOR');

INSERT INTO SCHOOL VALUES( 'GSSS', 'GAMBIA SENIOR SECONDARY SCHOOL', 'SENIOR', 1);
INSERT INTO SCHOOL VALUES( 'NUS', 'NUSRAT SENIOR SECONDARY SCHOOL', 'SENIOR', 1);
INSERT INTO SCHOOL VALUES( 'JSSS', 'JAMISA SENIOR SECONDARY SCHOOL', 'SENIOR', 2);
INSERT INTO SCHOOL VALUES( 'JUBS', 'JAMISA UPPER BASIC SCHOOL', 'JUNIOR', 2);
INSERT INTO SCHOOL VALUES( 'KBSSS', 'KABAFITA SENIOR SECONDARY SCHOOL', 'SENIOR', 2);
INSERT INTO SCHOOL VALUES( 'KBUSS', 'KABAFITA UPPER BASIC SCHOOL', 'JUNIOR', 2);

INSERT INTO CONTRACTOR VALUES(2000, 1, 'EBOU', 'MD', 'TAMBA', '1989-02-16', NULL, GETDATE(), 'GAMBIAN', 11,'3559876', 'SERREKUNDA', 'ACTIVE', 'ECONOMICS', 2 );
INSERT INTO CONTRACTOR VALUES(2001, 2, 'OMAR', NULL, 'CAMARA', '1976-02-23', NULL, GETDATE(), 'NIGERIA', 10,'2009844', 'BAKAU', 'ACTIVE', 'MATHEMATICS', 1 );
INSERT INTO CONTRACTOR VALUES(2002, 1, 'MUSTAPHA', 'MD', 'KONATEH', '1994-09-28', NULL, GETDATE(), 'SERALEON', 13,'7761290', 'LATRI KUNDA', 'ACTIVE', 'PYSICS', 3 );
INSERT INTO CONTRACTOR VALUES(2003, 3, 'AHMAD', 'S', 'CEESAY', '2000-07-21', NULL, GETDATE(), 'GAMBIAN', 11,'9907786', 'SUKUTA', 'ACTIVE', 'ECONOMICS', 2 );

INSERT INTO CONTRACTORBANK VALUES( 4501, 2001, '001002003456', 'OMAR CAMARA', '009876567252464382');
INSERT INTO CONTRACTORBANK VALUES( 4601, 2000, '908477747477', 'EBOUT TAMBA', '00823377464774647463');
INSERT INTO CONTRACTORBANK VALUES( 4501, 2003, '112334444433', 'EBOUT TAMBA', '009876567252464382');

INSERT INTO SCRIPTALLOCATION VALUES('803000123', 'ENG', 'WASSCE', 2001, 'ENG101', 200, 200, GETDATE() );

--SOME QUERIES 
SELECT first_name, last_name, status, contractor_bank, bank_name , account_name, account_Number, bban, subjectPaperCode --numberOfScriptMarked*subject_paper_rate AS ENTITLEMENT
FROM CONTRACTOR 
INNER JOIN CONTRACTORBANK ON CONTRACTOR.contractor_code = CONTRACTORBANK.contractor 
INNER JOIN SCRIPTALLOCATION ON CONTRACTORBANK.contractor = SCRIPTALLOCATION.examinerID
INNER JOIN BANK ON BANK.bank_code = CONTRACTORBANK.contractor_bank;

SELECT first_name, last_name, numberOfScriptMarked*subject_paper_rate AS ENTITLEMENT
FROM CONTRACTOR 
INNER JOIN SCRIPTALLOCATION ON SCRIPTALLOCATION.examinerID = CONTRACTOR.contractor_code
INNER JOIN SUBJECTPAPER ON SCRIPTALLOCATION.subjectPaperCode = SUBJECTPAPER.subject_paper_code;



