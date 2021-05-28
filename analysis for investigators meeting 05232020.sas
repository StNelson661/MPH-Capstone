

libname check "/folders/myfolders/Capstone/stephen.sas7bdat";

DATA metab; 
   SET in1.'Sheet1$'n;

if THCCOOHGlu = "NA" then THCCOOHGluCAT = 0;
else THCCOOHGluCAT = 1;

if THCCOOH = "NA" then THCCOOHCAT = 0;
else THCCOOHCAT = 1;

m=1;

RUN;


proc print data=metab; run;

/*somehow this is a problem now*/

*libname in2 "D:\Working\COPDGene\data\Longitudinal\2019 Investigators Meeting Dataset\.";

libname in17 "W:\COVID Work From Home Starting 03142020\Working\COPDGene\data\Longitudinal\.";

data once;
*set in2.p1p2p3_first1000_long_19sep19;
*set in17.COPDGene_P1P2_All_Visit_09OCT17;
set in17.copdgene_p1p2_all_visit_25mar19;
run;

/*the data are tall and the seperator is VisitNum 
Symptoms
HavePhlegm drop
Cough3Mo keep
 Phlegm3Mo keep
228 Cough4Plus drop 
DLco_GLI_tr_pb_adjusted keep phase 2      
561 DLco_GLI_tr_pp  keep phase 2
Severe_Exacerbations keep

*/

data 
b (keep = sid ccenter finalgold age_enroll race ethnic gender bmi fev1_utah fev1pp_utah
fvc_utah fvcpp_utah fev1_fvc_utah bode diabetes bdr bdr_pct_fev1 bdr_pct_fvc ATS_PackYears
MMRCDyspneaScor RheumArth Severe_Exacerbations SleepApnea distwalked FEF2575_utah
smokcignow Height_CM weight_kg Cortsterinhal SGRQ_scoreTotal SGRQ_scoreActive  SGRQ_scoreImpact 
SGRQ_scoreSymptom pctemph_slicer HighBloodPres
FRC_Thirona 				
MeanAtten_Exp_Thirona 	
MeanAtten_Insp_Thirona 		  	
Perc15_Exp_Thirona 		
Perc15_Insp_Thirona 		
TLC_Thirona 				
pctEmph_Thirona 			
pctGasTrap_Thirona 		
WallAreaPct_seg_Thirona
pctEmph_LowerLobes_Thirona
pctEmph_UL_LL_ratio_Thirona
pctEmph_UpperLobes_Thirona
Pi10_Thirona
Perc15_Exp_Thirona
Perc15_Insp_Thirona 
AWT_seg_Thirona
Cough3Mo
Phlegm3Mo
Cough4Plus 
Severe_Exacerbations
)
v2 (keep = sid ccenter finalgold age_enroll race ethnic gender bmi fev1_utah fev1pp_utah
fvc_utah fvcpp_utah fev1_fvc_utah bode diabetes bdr bdr_pct_fev1 bdr_pct_fvc ATS_PackYears
MMRCDyspneaScor RheumArth Severe_Exacerbations SleepApnea distwalked FEF2575_utah
smokcignow Height_CM weight_kg Cortsterinhal SGRQ_scoreTotal SGRQ_scoreActive  SGRQ_scoreImpact 
SGRQ_scoreSymptom pctemph_slicer HighBloodPres
FRC_Thirona 				
MeanAtten_Exp_Thirona 	
MeanAtten_Insp_Thirona 		  	
Perc15_Exp_Thirona 		
Perc15_Insp_Thirona 		
TLC_Thirona 				
pctEmph_Thirona 			
pctGasTrap_Thirona 		
WallAreaPct_seg_Thirona
pctEmph_LowerLobes_Thirona
pctEmph_UL_LL_ratio_Thirona
pctEmph_UpperLobes_Thirona
Pi10_Thirona
Perc15_Exp_Thirona
Perc15_Insp_Thirona 
AWT_seg_Thirona
Cough3Mo
Phlegm3Mo
Cough4Plus 
DLco_GLI_tr_pb_adjusted      
DLco_GLI_tr_pp 

)
;
/*
v3 (keep=sid ccenter finalgold age_enroll race ethnic gender bmi fev1_utah fev1pp_utah
fvc_utah fvcpp_post fev1_fvc_utah bode diabetes bdr bdr_pct_fev1 bdr_pct_fvc ATS_PackYears
MMRCDyspneaScor RheumArth Severe_Exacerbations SleepApnea distwalked FEF2575_post
smokcignow Height_CM weight_kg Cortsterinhal SGRQ_scoreTotal SGRQ_scoreActive  SGRQ_scoreImpact 
SGRQ_scoreSymptom pctemph_slicer HighBloodPres
FRC_Thirona 				
MeanAtten_Exp_Thirona 	
MeanAtten_Insp_Thirona 		  	
Perc15_Exp_Thirona 		
Perc15_Insp_Thirona 		
TLC_Thirona 				
pctEmph_Thirona 			
pctGasTrap_Thirona 		
WallAreaPct_seg_Thirona
pctEmph_LowerLobes_Thirona
pctEmph_UL_LL_ratio_Thirona
pctEmph_UpperLobes_Thirona
Pi10_Thirona
Perc15_Exp_Thirona
Perc15_Insp_Thirona 
AWT_seg_Thirona
); */
set once;
if visitnum = 1 then output b;
else if visitnum = 2 then output v2;
*else if visitnum = 3 then output v3;
run;


data bworking (rename=(
ccenter = ccenterb
bode = bodeb
ATS_PackYears = ATS_PackYearsb
MMRCDyspneaScor = MMRCDyspneaScorb
finalgold = finalgoldb
age_enroll = age_enrollb
bmi = bmib
fev1_utah = fev1_utahb
fev1pp_utah = fev1pp_utahb
fvc_utah = fvc_utahb
fvcpp_utah = fvcpp_utahb
fev1_fvc_utah = fev1_fvc_utahb
bdr = bdrb
bdr_pct_fev1 = bdr_pct_fev1b
bdr_pct_fvc = bdr_pct_fvcb
RheumArth = RheumArthb
Severe_Exacerbations = Severe_Exacerbationsb
SleepApnea = SleepApneab
distwalked = distwalkedb
diabetes = diabetesb
smokcignow = smokcignowb
Height_CM = height_cmb
weight_kg = weight_kgb
Cortsterinhal = Cortsterinhalb
pctemph_slicer = pctemph_slicerb
sgrq_scoretotal = sgrq_scoretotalb
SGRQ_scoreActive =  SGRQ_scoreActiveb
SGRQ_scoreImpact = SGRQ_scoreImpactb
SGRQ_scoreSymptom = SGRQ_scoreSymptomb
HighBloodPres = HighBloodPresb
Pi10_Thirona = Pi10_Thironab
AWT_seg_Thirona = AWT_seg_Thironab
WallAreaPct_seg_Thirona = WallAreaPct_seg_Thironab
FRC_Thirona =	FRC_Thironab			
MeanAtten_Exp_Thirona = MeanAtten_Exp_Thironab	
MeanAtten_Insp_Thirona = MeanAtten_Insp_Thironab	  	
Perc15_Exp_Thirona = Perc15_Exp_Thironab		
Perc15_Insp_Thirona = Perc15_Insp_Thironab		
TLC_Thirona = TLC_Thironab				
pctEmph_Thirona = pctEmph_Thironab			
pctGasTrap_Thirona = pctGasTrap_Thironab		
pctEmph_LowerLobes_Thirona = pctEmph_LowerLobes_Thironab
pctEmph_UL_LL_ratio_Thirona = pctEmph_UL_LL_ratio_Thironab
pctEmph_UpperLobes_Thirona = pctEmph_UpperLobes_Thironab
Perc15_Exp_Thirona = Perc15_Exp_Thironab
Perc15_Insp_Thirona = Perc15_Insp_Thironab
FEF2575_utah = FEF2575_utahb
Cough3Mo = cough3mob
Phlegm3Mo = phlegm3mob
));
set b;
run;

data v2working (drop = gender rename=(
ccenter = ccenterv2
bode = bodev2
ATS_PackYears = ATS_PackYearsv2
MMRCDyspneaScor = MMRCDyspneaScorv2
finalgold = finalgoldv2
age_enroll = age_enrollv2
bmi = bmiv2
fev1_utah = fev1_utahv2
fev1pp_utah = fev1pp_utahv2
fvc_utah = fvc_utahv2
fvcpp_utah = fvcpp_utahv2
fev1_fvc_utah = fev1_fvc_utahv2
bdr = bdrv2
bdr_pct_fev1 = bdr_pct_fev1v2
bdr_pct_fvc = bdr_pct_fvcv2
RheumArth = RheumArthv2
Severe_Exacerbations = Severe_Exacerbationsv2
SleepApnea = SleepApneav2
distwalked = distwalkedv2
diabetes = diabetesv2
smokcignow = smokcignowv2
Height_CM = height_cmv2
weight_kg = weight_kgv2
Cortsterinhal = Cortsterinhalv2
pctemph_slicer = pctemph_slicerv2
sgrq_scoretotal = sgrq_scoretotalv2
SGRQ_scoreActive =  SGRQ_scoreActivev2
SGRQ_scoreImpact = SGRQ_scoreImpactv2
SGRQ_scoreSymptom = SGRQ_scoreSymptomv2
HighBloodPres = HighBloodPresv2
Pi10_Thirona = Pi10_Thironav2
AWT_seg_Thirona = AWT_seg_Thironav2
WallAreaPct_seg_Thirona = WallAreaPct_seg_Thironav2
FRC_Thirona =	FRC_Thironav2			
MeanAtten_Exp_Thirona = MeanAtten_Exp_Thironav2	
MeanAtten_Insp_Thirona = MeanAtten_Insp_Thironav2	  	
Perc15_Exp_Thirona = Perc15_Exp_Thironav2		
Perc15_Insp_Thirona = Perc15_Insp_Thironav2		
TLC_Thirona = TLC_Thironav2				
pctEmph_Thirona = pctEmph_Thironav2			
pctGasTrap_Thirona = pctGasTrap_Thironav2		
pctEmph_LowerLobes_Thirona = pctEmph_LowerLobes_Thironav2
pctEmph_UL_LL_ratio_Thirona = pctEmph_UL_LL_ratio_Thironav2
pctEmph_UpperLobes_Thirona = pctEmph_UpperLobes_Thironav2
Perc15_Exp_Thirona = Perc15_Exp_Thironav2
Perc15_Insp_Thirona = Perc15_Insp_Thironav2
FEF2575_utah = FEF2575_utahv2
DLco_GLI_tr_pb_adjusted = DLco_GLI_tr_pb_adjustedv2
Cough3Mo = cough3mov2
Phlegm3Mo = phlegm3mov2
DLco_GLI_tr_pp = dlco_gli_tr_ppv2
));
set v2;
run;

quit;


proc sort data=bworking; by sid; run;
proc sort data=v2working; by sid; run;
/*proc sort data=v3working; by sid; run; */

data doce;
merge bworking v2working ; *v3working;
by sid;

/*delta variables baseline vs visit 2*/
if bmib = . or bmiv2 = . then bmidelta = .; 
else bmidelta = bmiv2-bmib;

if fev1_utahb = . or fev1_utahv2 = . then fev1_utahdelta = .;
else fev1_utahdelta = fev1_utahv2 - fev1_utahb;

if fev1pp_utahb = . or fev1pp_utahv2 = . then fev1pp_utahdelta = .;
else fev1pp_utahdelta = fev1pp_utahv2 - fev1pp_utahb;

if fvc_utahb = . or fvc_utahv2 = . then fvc_utahdelta = .;
else fvc_utahdelta = fvc_utahv2 - fvc_utahb;

if fvcpp_utahb = . or fvcpp_utahv2 = . then fvcpp_utahdelta = .;
else fvcpp_utahdelta = fvcpp_utahv2 - fvcpp_utahb;

if fev1_fvc_utahb = . or fev1_fvc_utahv2 = . then fev1_fvc_utahdelta = .;
else fev1_fvc_utahdelta = fev1_fvc_utahv2 - fev1_fvc_utahb;

if FEF2575_utahb = . or FEF2575_utahv2 = . then FEF2575_utahdelta = .;
else FEF2575_utahdelta = FEF2575_utahv2 - FEF2575_utahb;

if ats_packyearsb = . or ats_packyearsv2 = . then ats_packyearsdelta = .;
else ats_packyearsdelta = ats_packyearsv2 - ats_packyearsb;

if bdr_pct_fev1b = . or bdr_pct_fev1v2 = . then bdr_pct_fev1delta = .;
else bdr_pct_fev1delta = bdr_pct_fev1v2 = bdr_pct_fev1b;

if bdr_pct_fvcb = . or bdr_pct_fvcv2 = . then bdr_pct_fvcdelta = .;
else bdr_pct_fvcdelta = bdr_pct_fvcv2 = bdr_pct_fvcb;

if Height_CMb = . or height_cmv2 = . then height_cmdelta = .;
else height_cmdelta = height_cmv2 - height_cmb;

if weight_kgb = .  or weight_kgv2 = . then weight_kgdelta = .;
else weight_kgdelta = weight_kgv2 - weight_kgb;

weightper = (weight_kgdelta/weight_kgb) * 100;

if weightper le -5 then FivePerLoss = 1;
else FivePerLoss = 0;

sgrq_scoretotalbsqr = sgrq_scoretotalb**2;

if diabetesb = . or diabetesv2 = . then diabetesNEW = .;
else if diabetesb = 0 and diabetesv2 = 0 then diabetesNEW = 0;
else if diabetesb = 1 and diabetesv2 = 1 then diabetesNEW = 1;
else if diabetesb = 0 and diabetesv2 = 1 then diabetesNEW = 2;
else if diabetesb = 1 and diabetesv2 = 0 then diabetesNEW = 9;

if finalgoldb = . then casecontrolC = .;
else if finalgoldb = 0 then casecontrolC = 0;
else if finalgoldb ge 1 then casecontrolC = 1;
else casecontrolC = .;

if finalgoldb = . then casecontrolP = .;
else if finalgoldb = 0 then casecontrolP = 0;
else if finalgoldb = -1 then casecontrolP = 1;
else casecontrolP = .;

if smokcignowb = . or smokcignowv2 = . then smokecat = .;
else if smokcignowb = 0 and smokcignowv2 = 0 then smokecat = 0;
else if smokcignowb = 1 and smokcignowv2 = 0 then smokecat = 1;
else if smokcignowb = 0 and smokcignowv2 = 1 then smokecat = 2;
else if smokcignowb = 1 and smokcignowv2 = 1 then smokecat = 3;
else smokecat = .;

if ccenterb = "BWH" then ccentercat = 1;
else if ccenterb = "NJC" then ccentercat = 2;
else ccentercat = 0;

sgrq_scoretotaldelta =  sgrq_scoretotalv2 - SGRQ_scoreTotalb ;
SGRQ_scoreActivedelta =  SGRQ_scoreActivev2 - SGRQ_scoreActiveb ;
SGRQ_scoreImpactdelta = SGRQ_scoreImpactv2 - SGRQ_scoreImpactb ;
SGRQ_scoreSymptomdelta = SGRQ_scoreSymptomv2 - SGRQ_scoreSymptomb ;

Pi10_Thironadelta = Pi10_Thironav2 - Pi10_Thironab;
AWT_seg_Thironadelta = AWT_seg_Thironav2 - AWT_seg_Thironab;
WallAreaPct_seg_Thironadelta = WallAreaPct_seg_Thironav2 - WallAreaPct_seg_Thironab;

if pctEmph_Thironab = . or pctEmph_Thironav2 = . then pctEmph_Thironadelta = .;
pctEmph_Thironadelta = pctEmph_Thironav2 - pctEmph_Thironab;

l=1;

/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~change between visit 2 and visit 3*/

/*
if fev1_utahv2 = . or fev1_utahv3 = . then fev1_utah23delta = .;
else fev1_utah23delta = fev1_utahv3 - fev1_utahv2;

if fev1pp_utahv2 = . or fev1pp_utahv3 = . then fev1pp_utah23delta = .;
else fev1pp_utah23delta = fev1pp_utahv3 - fev1pp_utahv2;

if fvc_utahv2 = . or fvc_utahv3 = . then fvc_utah23delta = .;
else fvc_utah23delta = fvc_utahv3 - fvc_utahv2;

if fvcpp_utahv2 = . or fvcpp_utahv3 = . then fvcpp_utah23delta = .;
else fvcpp_utah23delta = fvcpp_utahv3 - fvcpp_utahv2;

if fev1_fvc_utahv2 = . or fev1_fvc_utahv3 = . then fev1_fvc_utah23delta = .;
else fev1_fvc_utah23delta = fev1_fvc_utahv3 - fev1_fvc_utahv2;

if FEF2575_utahv2 = . or FEF2575_utahv3 = . then FEF2575_utah23delta = .;
else FEF2575_utah23delta = FEF2575_utahv3 - FEF2575_utahv2;

if ats_packyearsv2 = . or ats_packyearsv3 = . then ats_packyears23delta = .;
else ats_packyears23delta = ats_packyearsv3 - ats_packyearsv2;

if bdr_pct_fev1v2 = . or bdr_pct_fev1v3 = . then bdr_pct_fev123delta = .;
else bdr_pct_fev123delta = bdr_pct_fev1v3 = bdr_pct_fev1v2;

if bdr_pct_fvcv2 = . or bdr_pct_fvcv3 = . then bdr_pct_fvc23delta = .;
else bdr_pct_fvc23delta = bdr_pct_fvcv3 = bdr_pct_fvcv2;


l=1;

*/


run;


/*bring in PCA risk*/

libname in2 "W:\COVID Work From Home Starting 03142020\Working\COPDGene\data\PCARiskGroups\.";

data PCARisk;
set in2.factorriskgroups;
p=1;
run;


proc sort data=doce; by sid; run;
proc sort data=pcarisk; by sid; run;
proc sort data=metab; by sid; run;


data one1;
merge doce pcarisk metab;
by sid;
/*old four group COPD risk groups
high risk emphy
high risk airway
high risk both
neither
*/

run;

/*keep only the metabolomics people*/

data one2;
set one1;
where m=1;
run;


data one;
set one2;

if thccoohglucat = 1 or thccoohcat = 1 then user = 1;
else user = 0; 

run;

proc print data=one;
var THCCOOHGluCAT;
run;

proc freq data=one;
tables thccoohglucat thccoohcat thccoohglucat*thccoohcat user;
run;

/*
proc univariate normal plot;
var fev1_utah23delta fev1pp_utah23delta fvc_utah23delta fvcpp_utah23delta;
run;
*/

proc glm;
class user (ref="0");
model fev1_utahv2 = user fev1_utahb /solution;
lsmeans user /pdiff;
title "fev1 L v2 by cannabis use at v2";
run;

proc glm;
class user (ref="0");
model fev1pp_utah23delta = user fev1pp_utahv2 /solution;
lsmeans user /pdiff;
title "delta fev1pp L v2 v3 by cannabis use at v2";
run;

proc glm;
class user (ref="0");
model fvc_utah23delta = user fvc_utahv2 /solution;
lsmeans user /pdiff;
title "delta fvc L v2 v3 by cannabis use at v2";
run;

proc glm;
class user (ref="0");
model fvcpp_utah23delta = user fvcpp_utahv2 /solution;
lsmeans user /pdiff;
title "delta fvcpp L v2 v3 by cannabis use at v2";
run;


quit;


proc contents data=pcarisk;
run;

proc print data=one;
var user finalgoldv2 MeanAtten_Exp_Thironav2	
MeanAtten_Insp_Thironav2	  	
Perc15_Exp_Thironav2		
Perc15_Insp_Thironav2		
TLC_Thironav2				
pctEmph_Thironav2			
pctGasTrap_Thironav2		
pctEmph_LowerLobes_Thironav2
pctEmph_UL_LL_ratio_Thironav2
pctEmph_UpperLobes_Thironav2
Perc15_Exp_Thironav2
Perc15_Insp_Thironav2
FEF2575_utahv2;
run;

%macro log(var);
proc logistic;
class user finalgoldv2 (ref="0")/param=ref;
model user (event="1") = age_enrollv2 finalgoldv2 &var;
where finalgoldv2 ne -2;
title "&var";
run;
%mend;

%log(sgrq_scoretotalv2);
%log(SGRQ_scoreActivev2);
%log(SGRQ_scoreImpactv2);
%log(SGRQ_scoreSymptomv2);
%log(Pi10_Thironav2);
%log(AWT_seg_Thironav2);
%log(WallAreaPct_seg_Thironav2);
		
%log(MeanAtten_Exp_Thironav2);	
%log(MeanAtten_Insp_Thironav2);	  	
%log(Perc15_Exp_Thironav2);		
%log(Perc15_Insp_Thironav2);		
%log(TLC_Thironav2);				
%log(pctEmph_Thironav2);			
%log(pctGasTrap_Thironav2);		
%log(pctEmph_LowerLobes_Thironav2);
%log(pctEmph_UpperLobes_Thironav2);

%log(FEF2575_utahv2);
%log(ATS_PackYearsv2);
%log(MMRCDyspneaScorv2);
%log(bmiv2);

%log(fev1_utahv2);
%log(fev1pp_utahv2);
%log(fvc_utahv2);
%log(fvcpp_utahv2);
%log(fev1_fvc_utahv2);
%log(FRC_Thironav2);	

%log(bdrv2);
%log(bdr_pct_fev1v2);
%log(bdr_pct_fvcv2);
%log(distwalkedv2);


proc logistic;
class user finalgoldv2 (ref="0")/param=ref;
model user (event="1") = age_enrollv2 CTEmphANDRatio
PFTandTHICKENINGinv   
AttenANDIntensity
BMIANDNoise
TLCFRC
smokcignowv2
;
where finalgoldv2 ne -2;
title "PCA factors";
run;

proc univariate normal plot;
var age_enrollv2;
run;
proc freq;
tables gender;
run;
 
/*~~~~~~~~~~~~~~~~~~~~~~~~USE THIS ONE~~~~~~~~~~~~~~~~~~~~~~~~~~~~demographics table 1*/

proc freq;
tables user*gender /chisq;
tables user*race /chisq;
tables user*smokcignowv2 /chisq;
tables user*finalgoldv2 /chisq;
tables user*cough3mov2 /chisq;
tables user*phlegm3mov2 /chisq;
tables user*severe_exacerbationsv2 /chisq;
run;

proc ttest;
class user;
var age_enrollv2 ATS_PackYearsv2;
run;

%macro log2(var);
proc logistic;
class user smokcignowv2 race cough3mov2 Phlegm3Mo/param=ref;
model user (event="1") = age_enrollv2 CTEmphANDRatio
PFTandTHICKENINGinv   
AttenANDIntensity
BMIANDNoise
TLCFRC smokcignowv2 race &var;
where finalgoldv2 ne -2;
title "&var adj pca factors";
run;
%mend;

%log2(sgrq_scoretotalv2);
%log2(SGRQ_scoreActivev2);
%log2(SGRQ_scoreImpactv2);
%log2(SGRQ_scoreSymptomv2);
%log2(Pi10_Thironav2);
%log2(AWT_seg_Thironav2);
%log2(WallAreaPct_seg_Thironav2);
		
%log2(MeanAtten_Exp_Thironav2);	
%log2(MeanAtten_Insp_Thironav2);	  	
%log2(Perc15_Exp_Thironav2);		
%log2(Perc15_Insp_Thironav2);
	
			
%log2(pctEmph_Thironav2);			
%log2(pctGasTrap_Thironav2);		
%log2(pctEmph_LowerLobes_Thironav2);
%log2(pctEmph_UpperLobes_Thironav2);
%log2(FRC_Thironav2);	
%log2(TLC_Thironav2);

%log2(ATS_PackYearsv2);
%log2(MMRCDyspneaScorv2);
%log2(bmiv2);

%log2(fev1_utahv2);
%log2(fev1pp_utahv2);
%log2(fvc_utahv2);
%log2(fvcpp_utahv2);
%log2(fev1_fvc_utahv2);
%log2(FEF2575_utahv2);

%log2(bdrv2);
%log2(bdr_pct_fev1v2);
%log2(bdr_pct_fvcv2);
%log2(distwalkedv2);

%log2(DLCO_pp_adjustedv2);
%log2(HADS_ScorAnxv2);
%log2(HADS_ScorDeprv2);

%log2(cough3mov2);
%log2(phlegm3mov2);
%log2(severe_exacerbationsv2);
%log2(DLco_GLI_tr_ppv2);



proc contents; run;

Proc format;
value fuser 0="THC-" 1="THC+";
run;

proc gplot;
plot fev1_fvc_utahv2*fev1pp_utahv2=user / 
vaxis = 0.1 to 1.0 by 0.1 haxis = 10 to 160 by 10
vref = 0.7 href = 80 ;
symbol1 value = star color = grey;
symbol2 value = circle color = red;
format user fuser.;
Title "V2 Function in THC Exposed";
run;

proc gplot;
plot fev1_fvc_utahb*fev1pp_utahb=user / 
vaxis = 0.1 to 1.0 by 0.1 haxis = 10 to 160 by 10
vref = 0.7 href = 80 ;
symbol1 value = star color = grey;
symbol2 value = circle color = red;
format user fuser.;
Title "Baseline Function in V2 THC Exposed";
run;

/*test the lack of replication with SPIROMICS by running this again adjusting
for GOLD stage instead of factors*/

proc contents; run;
%macro log3(var);
proc logistic;
class user smokcignowv2 race cough3mov2  finalgoldv2/param=ref;
model user (event="1") = age_enrollv2 finalgoldv2 smokcignowv2 race &var;
where finalgoldv2 ne -2;
title "&var adj gold stage";
run;
%mend;

%log3(sgrq_scoretotalv2);
%log3(SGRQ_scoreActivev2);
%log3(SGRQ_scoreImpactv2);
%log3(SGRQ_scoreSymptomv2);
%log3(Pi10_Thironav2);
%log3(AWT_seg_Thironav2);
%log3(WallAreaPct_seg_Thironav2);
		
%log3(MeanAtten_Exp_Thironav2);	
%log3(MeanAtten_Insp_Thironav2);	  	
%log3(Perc15_Exp_Thironav2);		
%log3(Perc15_Insp_Thironav2);
			
%log3(pctEmph_Thironav2);			
%log3(pctGasTrap_Thironav2);		
%log3(pctEmph_LowerLobes_Thironav2);
%log3(pctEmph_UpperLobes_Thironav2);
%log3(FRC_Thironav2);	
%log3(TLC_Thironav2);

%log3(ATS_PackYearsv2);
%log3(MMRCDyspneaScorv2);
%log3(bmiv2);

%log3(fev1_utahv2);
%log3(fev1pp_utahv2);
%log3(fvc_utahv2);
%log3(fvcpp_utahv2);
%log3(fev1_fvc_utahv2);
%log3(FEF2575_utahv2);

%log3(bdrv2);
%log3(bdr_pct_fev1v2);
%log3(bdr_pct_fvcv2);
%log3(distwalkedv2);

%log3(DLCO_pp_adjustedv2);
%log3(HADS_ScorAnxv2);
%log3(HADS_ScorDeprv2);

%log3(cough3mov2);
%log3(phlegm3mov2);
%log3(severe_exacerbationsv2);
%log3(DLco_GLI_tr_ppv2);




/*okay if its not anxiety then is it pain?
OsteoArthv2
Osteoporosisv2
PainfulJointsv2
*/

proc logistic;
class user/param=ref;
model user (event="1") = age_enrollv2 CTEmphANDRatio PFTandTHICKENINGinv   AttenANDIntensity BMIANDNoise TLCFRC
v2
/*/selection=stepwise include=6 */;
where finalgoldv2 ne -2;
title "each class of associated var adj pca factors";
run;

proc logistic;
class user/param=ref;
model user (event="1") = age_enrollv2 CTEmphANDRatio PFTandTHICKENINGinv   AttenANDIntensity BMIANDNoise TLCFRC
AWT_seg_Thironav2
HADS_ScorAnxv2
PainfulJointsv2
sgrq_scoretotalv2
SGRQ_scoreActivev2
SGRQ_scoreImpactv2
SGRQ_scoreSymptomv2
/selection=stepwise include=6 ;
where finalgoldv2 ne -2;
title "each class of associated var adj pca factors";
run;





















sgrq_scoretotalv2
SGRQ_scoreActivev2
SGRQ_scoreImpactv2
SGRQ_scoreSymptomv2
Pi10_Thironav2
AWT_seg_Thironav2
WallAreaPct_seg_Thironav2

MeanAtten_Exp_Thironav2	
MeanAtten_Insp_Thironav2	  	
Perc15_Exp_Thironav2		
Perc15_Insp_Thironav2		
			
pctEmph_Thironav2			
pctGasTrap_Thironav2		
pctEmph_LowerLobes_Thironav2
pctEmph_UpperLobes_Thironav2
FRC_Thironav2
TLC_Thironav2

ATS_PackYearsv2
MMRCDyspneaScorv2
bmiv2

fev1_utahv2
fev1pp_utahv2
fvc_utahv2
fvcpp_utahv2
fev1_fvc_utahv2
FEF2575_utahv2

bdrv2
bdr_pct_fev1v2
bdr_pct_fvcv2

distwalkedv2

quit;
