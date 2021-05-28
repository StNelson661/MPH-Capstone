/* Generated Code (IMPORT) */
/* Source File: THC metabolites only 01282021.xlsx */
/* Source Path: /folders/myfolders/Capstone */
/* Code generated on: 4/10/21, 6:53 PM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/folders/myfolders/Capstone/THC metabolites only 01282021.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=Capstone.THC;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=Caps.thc; RUN;


%web_open_table(WORK.IMPORT);