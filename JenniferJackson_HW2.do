* APSTA.GE 2004
* Homework 2
* Jennifer Jackson

** 1
use "/Users/jenniferjackson/Desktop/Framingham.dta"
drop if CIGPDAY1 >=1 | BMI1 < 18.5
save "/Users/jenniferjackson/Desktop/Framingham2.dta"

** 2
generate bmi_cat=.
replace bmi_cat = 1 if (BMI1 <= 24.99 )  //* cat 1
replace bmi_cat = 2 if (BMI1 > 24.99 & BMI1 <= 29.99) //* cat 2
replace bmi_cat = 3 if (BMI1 > 29.99) //* cat 3

** 3
tabulate bmi_cat

** 4
pwcorr TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 1
pwcorr TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 2
pwcorr TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 3
* None of the correlation coefficients are strong enough to suggest
* multicollinearity.

discrim lda TOTCHOL1 SYSBP1 HEARTRTE1, group(bmi_cat)
estat covariance

** 5
bysort bmi_cat: correlate TOTCHOL1 SYSBP1 HEARTRTE1, covariance

** 6 To test the homogenity of the covarianc matrix
* assumption, so we use Box's M test.

** 7
* Testing equality of covariance matrices
mvtest covariances TOTCHOL1 SYSBP1 HEARTRTE1, by(bmi_cat)
* Because the p-value is greater than alpha = 5%, we fail to reject the null
* hypothesis that the covariances are equal.

** 8
* a
candisc TOTCHOL1 SYSBP1 HEARTRTE1, group(bmi_cat)
* The number of functions = number of groups - 1, so there are 3-1=2 functions.
 
* b
* Only one function (Function 1) has a p-value less than alpha = 5% and thus
* statistically significant.

* c
* Function 1 differentiates better because it has a larger eigenvalue 

********************************************************************************
******** SUBMITTED ON 22 FEBRUARY
********************************************************************************

* d
* Based on the loadings, blood pressure has the most effect, followed by
* cholesterol and then heart rate.

* e
matrix function = e(cmeans)
clear
svmat function
edit
generate bmi_cat = 1 in 1
replace bmi_cat  = 2 in 2
replace bmi_cat  = 3 in 3
label define bmi_cat 1 "normal" 2 "overweight" 3 "obese"
label value bmi_cat bmi_cat
twoway scatter function2 function1, yline(0) ylabel(-1 0 +1) mlabel(bmi_cat) ///
mlabsize(large) mlabangle(0)  xline(0) title(GROUP CENTROIDS ON DISC FUNCTIONS)

* f
candisc TOTCHOL1 SYSBP1 HEARTRTE1, group(bmi_cat) prior(equal) lootable
* BMI cat 1 ~ 39 of 76 are classified correctly
* BMI cat 2 ~ 44 of 94 are classified correctly
* BMI cat 3 ~ 6 of 28 are classified correctly

** 9
* The initial question was about how BMI is related to cholesterol, blood 
* pressure and heart rate and we were able to show that blood pressure is the
* best indicator for discriminating among the three different BMI categories.



