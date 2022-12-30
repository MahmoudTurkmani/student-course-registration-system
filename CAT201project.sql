CREATE TABLE SEMESTER (
    SEMESTER_CODE VARCHAR2(4) PRIMARY KEY
);

CREATE TABLE DEGREE (
    DEGREE_NAME VARCHAR2(25) PRIMARY KEY
);

CREATE TABLE MAJOR (
    MAJOR_CODE VARCHAR2(2) PRIMARY KEY,
    MAJOR_NAME VARCHAR2(25) NOT NULL
);

CREATE TABLE MINOR (
    MINOR_CODE VARCHAR2(2) PRIMARY KEY,
    MINOR_NAME VARCHAR2(15) NOT NULL
);

CREATE TABLE STATUS (
    STATUS_NAME VARCHAR2(15) PRIMARY KEY
);

CREATE TABLE CAMPUS(
    CAMPUS_NAME VARCHAR2(20) PRIMARY KEY
);

CREATE TABLE SCHOOLS(
    SCHOOL_NAME VARCHAR2(35) PRIMARY KEY
);

CREATE TABLE POSITIONS(
    POSITION_TITLE VARCHAR2(30) PRIMARY KEY
);

CREATE TABLE LECTURER (
    LECTURER_ID INTEGER PRIMARY KEY,
    CONSTRAINT LECT_ID_LEN_CHK CHECK (LENGTH(LECTURER_ID) = 6),
    LECTURER_PASSWORD VARCHAR2(25) NOT NULL,
    LECTURER_NRIC INTEGER,
    CONSTRAINT LECT_NRIC_LEN_CHK CHECK (LENGTH(LECTURER_NRIC) = 12),
    STATUS_NAME VARCHAR2(12),
    CONSTRAINT LECT_STAT_FK FOREIGN KEY (STATUS_NAME)
    REFERENCES STATUS(STATUS_NAME) ON DELETE CASCADE,
    POSITION_TITLE VARCHAR2(30),
    CONSTRAINT LECT_POS_FK FOREIGN KEY (POSITION_TITLE)
    REFERENCES POSITIONS(POSITION_TITLE) ON DELETE CASCADE,
    SCHOOL_NAME VARCHAR2(35),
    CONSTRAINT LECT_SCHOOL_FK FOREIGN KEY (SCHOOL_NAME)
    REFERENCES SCHOOLS(SCHOOL_NAME) ON DELETE CASCADE,
    CAMPUS_NAME VARCHAR2(20),
    CONSTRAINT LECT_CAMPUS_FK FOREIGN KEY (CAMPUS_NAME)
    REFERENCES CAMPUS(CAMPUS_NAME) ON DELETE CASCADE
);

CREATE TABLE COURSES (
    COURSE_CODE VARCHAR2(6) PRIMARY KEY,
    COURSE_TITLE VARCHAR2(50) NOT NULL,
    COURSE_DESC VARCHAR2(200),
    COURSE_TIME VARCHAR2(30)
);

CREATE TABLE LECTURER_COURSES (
    LECTURER_ID INTEGER, 
    COURSE_CODE VARCHAR2(6),
    CONSTRAINT LECT_CRS_LECT_FK FOREIGN KEY (LECTURER_ID)
    REFERENCES LECTURER(LECTURER_ID) ON DELETE CASCADE,
    CONSTRAINT LECT_CRS_CRS_FK FOREIGN KEY (COURSE_CODE)
    REFERENCES COURSES(COURSE_CODE) ON DELETE CASCADE,
    CONSTRAINT LECT_CRS_PK PRIMARY KEY (LECTURER_ID, COURSE_CODE)
);

CREATE TABLE STUDENT (
    STUDENT_ID INTEGER PRIMARY KEY,
    CONSTRAINT STD_ID_LEN_CHK CHECK (LENGTH(STUDENT_ID) = 6),
    STUDENT_PASSWORD VARCHAR2(25) NOT NULL,
    STUDENT_NAME VARCHAR2(30),
    STUDENT_NRIC INTEGER,
    CONSTRAINT STD_NRIC_LEN_CHK CHECK (LENGTH(STUDENT_NRIC) = 12),
    STATUS_NAME VARCHAR2(15),
    SEMESTER_CODE VARCHAR2(4),
    STUDENT_GPA NUMBER(3,2),
    STUDENT_YEAR INTEGER,
    SCHOOL_NAME VARCHAR2(35),
    CAMPUS_NAME VARCHAR2(20),
    DEGREE_NAME VARCHAR2(25),
    MAJOR_CODE VARCHAR2(2),
    MINOR_CODE VARCHAR2(2),
    CONSTRAINT STUD_STAT_FK FOREIGN KEY (STATUS_NAME)
    REFERENCES STATUS(STATUS_NAME) ON DELETE CASCADE,
    CONSTRAINT STUD_SEM_FK FOREIGN KEY (SEMESTER_CODE)
    REFERENCES SEMESTER(SEMESTER_CODE) ON DELETE CASCADE,
    CONSTRAINT STUD_SCHL_FK FOREIGN KEY (SCHOOL_NAME)
    REFERENCES SCHOOLS(SCHOOL_NAME) ON DELETE CASCADE,
    CONSTRAINT STUD_CMP_FK FOREIGN KEY (CAMPUS_NAME)
    REFERENCES CAMPUS(CAMPUS_NAME) ON DELETE CASCADE,
    CONSTRAINT STUD_DGR_FK FOREIGN KEY (DEGREE_NAME)
    REFERENCES DEGREE(DEGREE_NAME) ON DELETE CASCADE,
    CONSTRAINT STUD_MJR_FK FOREIGN KEY (MAJOR_CODE)
    REFERENCES MAJOR(MAJOR_CODE) ON DELETE CASCADE,
    CONSTRAINT STUD_MNR_FK FOREIGN KEY (MINOR_CODE)
    REFERENCES MINOR(MINOR_CODE) ON DELETE CASCADE
);

CREATE TABLE STUDENT_COURSES (
    STUDENT_ID INTEGER,
    COURSE_CODE VARCHAR2(6),
    CONSTRAINT STD_CRS_PK PRIMARY KEY (STUDENT_ID, COURSE_CODE),
    CONSTRAINT STD_CRS_STD_FK FOREIGN KEY (STUDENT_ID)
    REFERENCES STUDENT(STUDENT_ID) ON DELETE CASCADE,
    CONSTRAINT STD_CRS_CRS_FK FOREIGN KEY (COURSE_CODE)
    REFERENCES COURSES(COURSE_CODE) ON DELETE CASCADE
);