CREATE TABLE BANK(
	bank_code INTEGER,
	bank_name VARCHAR(40),
	bank_headquater VARCHAR(40),
	CONSTRAINT bank_code_pk PRIMARY KEY(bank_code)
	
);

CREATE TABLE BANKBRANCH(
	bank_branch_code INTEGER,
	bank_code INTEGER,
	bank_branch_address VARCHAR(40),
	bank_branch_phone VARCHAR(40),
	bank_branch_email VARCHAR(40),
	CONSTRAINT bank_pk PRIMARY KEY(bank_branch_code)
);

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

CREATE TABLE DOCUMENT(
	document_code INTEGER,
	document_name VARCHAR(40),
	CONSTRAINT document_pk PRIMARY KEY(document_code)
);

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
	contract_detail INTEGER,
	first_name VARCHAR(40),
	middle_name VARCHAR(40),
	last_name VARCHAR(40),
	dob DATE,
	photo VARBINARY(MAX),
	registration_date DATE DEFAULT GETDATE(),
	nationality VARCHAR(40),
	document INTEGER,
	--contractor_sch VARCHAR(10),
	contra_qual INTEGER,
	status VARCHAR(40),
	field_of_study VARCHAR(40),
	contractor_region INTEGER,
	CONSTRAINT contractor_pk PRIMARY KEY(contractor_code),
	CONSTRAINT contract_detail_fk FOREIGN KEY(contract_detail) REFERENCES CONTRACT(contract_code),
	CONSTRAINT contractor_document_fk FOREIGN KEY(document) REFERENCES DOCUMENT(document_code),
	--CONSTRAINT contractor_sch_fk FOREIGN KEY(contractor_sch) REFERENCES SCHOOL(scl_code),
	CONSTRAINT contractor_qualification_fk FOREIGN KEY(contra_qual) REFERENCES QUALIFICATION(qualification_code),
	CONSTRAINT contractor_region_fk FOREIGN KEY(contractor_region) REFERENCES REGION(region_code)
);

CREATE TABLE CONTRACTORBANK(
	contractor_bank INTEGER,
	contractor INTEGER,
	account_INTEGER VARCHAR(40),
	account_name VARCHAR(40),
	bban VARCHAR(40),
	CONSTRAINT contrabank_pk PRIMARY KEY(contractor_bank, contractor, account_INTEGER),
	CONSTRAINT contractor_bank_fk FOREIGN KEY(contractor_bank) REFERENCES BANK(bank_code),
	CONSTRAINT contrabank_contractor_INTEGER_fk FOREIGN KEY(contractor) REFERENCES CONTRACTOR(contractor_code)
);

CREATE TABLE CONTRACTORQUALIFICATION(
	contra_qual_code INTEGER,
	contractor_id INTEGER,
	qualification_date DATE,
	CONSTRAINT contractor_qual_pk PRIMARY KEY(contra_qual_code, contractor_id),
	CONSTRAINT contra_qual_fk FOREIGN KEY(contra_qual_code) REFERENCES QUALIFICATION(qualification_code),
	CONSTRAINT contractor_id_fk FOREIGN KEY(contractor_id) REFERENCES CONTRACTOR(contractor_code)
);

CREATE TABLE CONTRACTORSCHOOL(
	contractor_code INTEGER,
	contractor_sch VARCHAR(10),
	join_date DATE,
	status VARCHAR(20), -- this indentified whether the school is current or previous
	CONSTRAINT contractor_school_pk PRIMARY KEY(contractor_code, contractor_sch),
	CONSTRAINT contractor_school_fk FOREIGN KEY(contractor_sch) REFERENCES SCHOOL(scl_code),
	CONSTRAINT contractor_code_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code)
);

CREATE TABLE CONTRACTORTUTORIALCLASS(
	contractorID INTEGER,
	schoolID VARCHAR(10),
	join_date DATE, 
	status VARCHAR(10), -- whether current or previous
	CONSTRAINT tutorial_class_pk PRIMARY KEY(contractorID, schoolID),
	CONSTRAINT tutorial_class_contractor FOREIGN KEY(contractorID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT tutorial_class_sch FOREIGN KEY(schoolID) REFERENCES SCHOOL(scl_code)
);
CREATE TABLE CONTRACTORPOSTING(
	contractorCode INTEGER,
	contract_code INTEGER,
	posting_start_date DATE,
	posting_end_date DATE,
	centre_INTEGER INTEGER,
	exam_category_code INTEGER,
	CONSTRAINT contractoposting_pk PRIMARY KEY(contract_code, posting_end_date, posting_start_date),
	CONSTRAINT contractoposting_contract_fk FOREIGN KEY(contract_code) REFERENCES CONTRACT(contract_code),
	CONSTRAINT contractor_contractorPosting_fk FOREIGN KEY(contractorCode) REFERENCES CONTRACTOR(contractor_code)

);

CREATE TABLE BLACKLIST(
	contractor_code INTEGER,
	dates DATE,
	description VARCHAR(500),
	CONSTRAINT blacklist_examiner_fk FOREIGN KEY(contractor_code) REFERENCES CONTRACTOR(contractor_code)
); --14

--NOW I AM COMING TO SPECIFY TABLES FOR GABECE SUBJECTS AND EXAMS

CREATE TABLE GABECESUBJECT(
	gsubject_code VARCHAR(10),
	gsubject_name VARCHAR(40),
	iscore_subject VARCHAR(5),
	subject_rate DECIMAL(8,2)
	CONSTRAINT cabecesubject_pk PRIMARY KEY(gsubject_code)
);

CREATE TABLE GCOURSEWORK(
	gsubject_id VARCHAR(10),
	courseword_rate DECIMAL(8,2),
	description VARCHAR(500),
	CONSTRAINT coursework_pk PRIMARY KEY(gsubject_id),
	CONSTRAINT coursework_subject_fk FOREIGN KEY(gsubject_id) REFERENCES GABECESUBJECT(gsubject_code)
);

CREATE TABLE GPRACTICAL(
	gsubject_id VARCHAR(10),
	practical_rate DECIMAL(8,2),
	description VARCHAR(500),
	CONSTRAINT practical_work_pk PRIMARY KEY(gsubject_id),
	CONSTRAINT practical_work_subject_fk FOREIGN KEY(gsubject_id) REFERENCES GABECESUBJECT(gsubject_code)
);

CREATE TABLE GEXAMPAPAER(
	exam_paper_code VARCHAR(10), -- SPECIFIES THE CODE ASSIGN TO THE EXAM PAPER(OBJECTIVE OR THEORY)
	exam_paper_name VARCHAR(40), -- THE NAME OF THE PAPER (OBJECTIVE OR THEORY)
	CONSTRAINT exam_paper_pk PRIMARY KEY(exam_paper_code)
);


CREATE TABLE GSUBJECTPAPER(
	subject_code VARCHAR(10), -- THE EXAM SUBJECT
	subject_paper_code VARCHAR(10), -- 
	subject_paper_name VARCHAR(20),
	CONSTRAINT gsub_paper_pk PRIMARY KEY(subject_code, subject_paper_code, subject_paper_name),
	CONSTRAINT sub_paper_fk FOREIGN KEY(subject_code) REFERENCES GABECESUBJECT(gsubject_code),
	CONSTRAINT gsubject_exam_paper_code FOREIGN KEY(subject_paper_code) REFERENCES GEXAMPAPAER(exam_paper_code),
);

CREATE TABLE GEXAMCATEGORY(
	ex_category_code INTEGER,  -- LOOKS LIKE THE SAME AS GEXAMPAPAER TABLE
	ex_category_name VARCHAR(40),
	CONSTRAINT examcategory_pk PRIMARY KEY(ex_category_code)
);

CREATE TABLE GORAL(
	oral_subject VARCHAR(10),
	oral_description VARCHAR(50),
	CONSTRAINT oralSubject_subject FOREIGN KEY(oral_subject) REFERENCES GABECESUBJECT(gsubject_code)
);

CREATE TABLE GSCRIPTALLOCATION( -- SCRIPT ALLOCATION FOR GABECE
	schoolId VARCHAR(10),
	subjectMarked VARCHAR(10),
	examinerID INTEGER,
	numOfScript INTEGER,
	CONSTRAINT seniorScriptMarking_pk PRIMARY KEY(schoolId, subjectMarked, examinerID),
	CONSTRAINT schoolid_fk FOREIGN KEY(schoolId) REFERENCES SCHOOL(scl_code),
	CONSTRAINT subjectMarked_fk FOREIGN KEY(subjectMarked) REFERENCES GABECESUBJECT(gsubject_code),
	CONSTRAINT gScript_examiner_fk FOREIGN KEY(examinerID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT CHK_number_of_script_GABECE	CHECK (numOfScript<= 300)
); --8

--WASSCE EXAM SUBJECTS AND PAPERS 
CREATE TABLE WASSCESUBJECT(
	wsubject_code VARCHAR(10),
	wsubject_name VARCHAR(40),
	iscore_subject VARCHAR(5),
	CONSTRAINT WASSCEsubject_pk PRIMARY KEY(wsubject_code)
);
CREATE TABLE WCOURSEWORK(
	wsubject_id VARCHAR(10),
	courseword_rate DECIMAL(8,2),
	description VARCHAR(500),
	CONSTRAINT wcoursework_pk PRIMARY KEY(wsubject_id),
	CONSTRAINT wcoursework_subject_fk FOREIGN KEY(wsubject_id) REFERENCES WASSCESUBJECT(wsubject_code)
);

CREATE TABLE WPRACTICAL(
	wsubject_id VARCHAR(10),
	practical_rate DECIMAL(8,2),
	description VARCHAR(500),
	CONSTRAINT wpractical_work_pk PRIMARY KEY(wsubject_id),
	CONSTRAINT wpractical_work_subject_fk FOREIGN KEY(wsubject_id) REFERENCES WASSCESUBJECT(wsubject_code)
);

CREATE TABLE WSUBJECTPAPER(
	wsubject_paper_code VARCHAR(10),
	wsubject_paper_name	VARCHAR(40),
	CONSTRAINT w_subject_paper_code_fk FOREIGN KEY(wsubject_paper_code) REFERENCES WASSCESUBJECT(wsubject_code),
	CONSTRAINT w_subjectPaper_pk PRIMARY KEY(wsubject_paper_code, wsubject_paper_name)
);

CREATE TABLE WSUBJECTPAPERRATE(
	subjectCode VARCHAR(10),
	paper_rate DECIMAL(8,2),
	CONSTRAINT wsubpaper_subject_fk FOREIGN KEY(subjectCode) REFERENCES WASSCESUBJECT(wsubject_code)
);

CREATE TABLE WSCRIPTALLOCATION( -- SCRIPT ALLOCATION FOR WASSCE
	schoolId VARCHAR(10),
	subjectMarked VARCHAR(10),
	examinerID INTEGER,
	numOfScript INTEGER,
	CONSTRAINT WASSCEScriptMarking_pk PRIMARY KEY(schoolId, subjectMarked, examinerID),
	CONSTRAINT Wschoolid_fk FOREIGN KEY(schoolId) REFERENCES SCHOOL(scl_code),
	CONSTRAINT WsubjectMarked_fk FOREIGN KEY(subjectMarked) REFERENCES WASSCESUBJECT(wsubject_code),
	CONSTRAINT WScript_examiner_fk FOREIGN KEY(examinerID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT CHK_number_of_script_WASSCE CHECK (numOfScript<= 300)
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

CREATE TABLE VEHICLE(
	vehicle_code INTEGER,
	vehicle_type VARCHAR(40),
	CONSTRAINT vehicle_pk PRIMARY KEY(vehicle_code)
);

CREATE TABLE OVERNIGHTALLOWANCE(
	town_code INTEGER,
	townStatus INTEGER,
	overnight_rate DECIMAL(8,2),
	fareRate DECIMAL(8,2),
	--contract_type INTEGER,
	--contractor_code INTEGER,
	CONSTRAINT townForOvernightAllowance FOREIGN KEY(town_code) REFERENCES TOWN(town_code),
	CONSTRAINT townStatus_forOvernight FOREIGN KEY(townStatus) REFERENCES TOWNSTATUS(status_code)
	
);		-- THE TABLE ABOVE AND THE TABLE BELOW LOOKS TO BE SERVING THE SAME PURPOSE

CREATE TABLE VEHICLEREFUND(
	towncode INTEGER, -- specifies the town
	townStatusCode INTEGER, --urban or rural
	vehicleCode INTEGER,
	contractor INTEGER,
	refund_rate DECIMAL(8,2),
	-- DO WE HAVE TO KEEP TRACK OF THE NUMBER OF DAYS?
	CONSTRAINT vehicle_refund_pk PRIMARY KEY(towncode, townStatusCode, vehicleCode),
	CONSTRAINT towncode_fk FOREIGN KEY(towncode) REFERENCES TOWN(town_code),
	CONSTRAINT townstatus_vehicle_fk FOREIGN KEY(townStatusCode) REFERENCES TOWNSTATUS(status_code),
	CONSTRAINT vehicle_code_fk FOREIGN KEY(vehicleCode) REFERENCES VEHICLE(vehicle_code),
	CONSTRAINT vehicleRefund_contractor FOREIGN KEY(contractor)	REFERENCES CONTRACTOR(contractor_code),
);

CREATE TABLE EXAMCENTER(
	region_code INTEGER,
	centre_NUMBER INTEGER,
	centre_name VARCHAR(40),
	centre_address VARCHAR(40),
	contact_person VARCHAR(40),
	phone VARCHAR(40),
	email VARCHAR(40),
	CONSTRAINT examcenter_pk PRIMARY KEY(centre_NUMBER),
	CONSTRAINT examcenter_region_fk FOREIGN KEY(region_code) REFERENCES REGION(region_code)

);

--TABLES TO CAPTURE DIFFRENT MEETINGS AND ENTITLEMENT FOR EACH
CREATE TABLE MEETINGS(
	meeting_code INTEGER,
	meeting_type VARCHAR(40),
	CONSTRAINT meeting_meetingCode_pk PRIMARY KEY(meeting_code)
);

CREATE TABLE GMEETINGDETAILS( --MEETINGS FOR GABECE, THIS WILL CAPTURE ALL TYPES OF MEETINGS
	SN INTEGER,					-- VETTING AND COORDINATION MEETINGS AND REPORT
	mcode INTEGER,
	mDate DATE,
	Gcontractors INTEGER,
	numOfDays INTEGER,
	GsubDiscussed VARCHAR(10),
	CONSTRAINT gmeetingdet_sn_pk PRIMARY KEY(SN),
	CONSTRAINT meetingDetail_mcode FOREIGN KEY(mcode) REFERENCES MEETINGS(meeting_code),
	CONSTRAINT meetingDetail_contractor FOREIGN KEY(Gcontractors) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT meetingDetails_subject FOREIGN KEY(GsubDiscussed) REFERENCES GABECESUBJECT(gsubject_code)
	
);

CREATE TABLE WMEETINGDETAILS( --MEETINGS FOR GABECE, THIS WILL CAPTURE ALL TYPES OF MEETINGS
	SN INTEGER,					-- VETTING AND COORDINATION MEETINGS AND REPORT
	WMcode INTEGER,
	WMDate DATE,
	Wcontractors INTEGER,
	numOfDays INTEGER,
	WsubDiscussed VARCHAR(10),
	CONSTRAINT Wmeetingdet_sn_pk PRIMARY KEY(SN),
	CONSTRAINT WmeetingDetail_mcode FOREIGN KEY(WMcode) REFERENCES MEETINGS(meeting_code),
	CONSTRAINT WmeetingDetail_contractor FOREIGN KEY(Wcontractors) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT WmeetingDetails_subject FOREIGN KEY(WsubDiscussed) REFERENCES WASSCESUBJECT(wsubject_code)
	
);


CREATE TABLE GQUESTIONSBANK(
	counter INTEGER IDENTITY(1,1),
	gexaminerID INTEGER,
	gsubjectID VARCHAR(10),
	questionType VARCHAR(20),
	CONSTRAINT Gexaminer_questionSet_fk FOREIGN KEY(gexaminerID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT Gquestion_subject_fk FOREIGN KEY(gsubjectID)REFERENCES GABECESUBJECT(gsubject_code)
);

CREATE TABLE WQUESTIONSBANK(
	counter INTEGER IDENTITY(1,1),
	wexaminerID INTEGER,
	wsubjectID VARCHAR(10),
	questionType VARCHAR(20),
	CONSTRAINT Wexaminer_questionSet_fk FOREIGN KEY(wexaminerID) REFERENCES CONTRACTOR(contractor_code),
	CONSTRAINT Wquestion_subject_fk FOREIGN KEY(wsubjectID)REFERENCES WASSCESUBJECT(wsubject_code)
);