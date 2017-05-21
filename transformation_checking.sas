libname project3 'C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 3\Project_3';
/* Read dataset from xlsx file*/
PROC IMPORT OUT= project3.hospital DATAFILE= "C:\Users\Owner\Documents\Grad School\MS Statistics\Fall 2016\Interpretation of Data I\Project 3\Project_3\hospital.xlsx" 
            DBMS=xlsx REPLACE;
     SHEET="hospital"; 
     GETNAMES=YES;
RUN; 
DATA project3.hospital;
SET project3.hospital;
SALES = SALESY + SALES12;
RUN;
data project3.hospital_transformed;
set project3.hospital;
	BEDS = BEDS**(1/2); /*Good*/
    RBEDS = LOG(1+50/(RBEDS**(1/10))); /*Good*/
    HIP95 = HIP95; /*Binary*/
    KNEE95 = KNEE95; /*Binary*/
    HIP96 = LOG(1+2/(HIP96**(1/2)/1000)); /*Okay*/
    KNEE96 = LOG(1+2/(KNEE96**(1/4)/1000)); /*Okay*/
    FEMUR96 = LOG(1+10/(FEMUR96**(1/500)/1000)); /*Okay*/
    OUTV = LOG(1+100/(OUTV**(1/100))); /*Good*/
    ADM = LOG(1+(ADM/500)); /*Good*/
    SIR = LOG(1+100/(SIR**(1/100))); /*Okay*/
    SALES = LOG(1+(4/(SALES**(2/35))/1000)); /*Okay*/ 
RUN;
/*This is Approximately Normal so Transformation appears appropriate*/
proc univariate data=project3.hospital noprint;
   histogram BEDS;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram BEDS;
run;
proc univariate data=project3.hospital noprint;
   histogram RBEDS;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram RBEDS;
run;
proc univariate data=project3.hospital noprint;
   histogram HIP95;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram HIP95;
run;
proc univariate data=project3.hospital noprint;
   histogram KNEE95;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram KNEE95;
run;
proc univariate data=project3.hospital noprint;
   histogram HIP96;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram HIP96;
run;
proc univariate data=project3.hospital noprint;
   histogram KNEE96;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram KNEE96;
run;
proc univariate data=project3.hospital noprint;
   histogram FEMUR96;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram FEMUR96;
run;
proc univariate data=project3.hospital noprint;
   histogram OUTV;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram OUTV;
run;
/*This is Approximately Normal so Transformation appears appropriate*/
proc univariate data=project3.hospital noprint;
   histogram ADM;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram ADM;
run;
proc univariate data=project3.hospital noprint;
   histogram SIR;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram SIR;
run;
proc univariate data=project3.hospital noprint;
   histogram SALES;
run;
proc univariate data=project3.hospital_transformed noprint;
   histogram SALES;
run;
