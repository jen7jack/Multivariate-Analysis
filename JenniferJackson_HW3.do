* APSTA.GE 2004
* Homework 3
* Jennifer Jackson

** 1
pwcorr TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 1
pwcorr TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 2
pwcorr TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 3
* None of the correlation coefficients are strong enough to suggest
* multicollinearity.

** 2
bysort bmi_cat: correlate TOTCHOL1 SYSBP1 HEARTRTE1, covariance

** 3 To test the homogenity of the covarianc matrix
* assumption, we use Box's M test.

** 4
* Testing equality of covariance matrices
mvtest covariances TOTCHOL1 SYSBP1 HEARTRTE1, by(bmi_cat)
* Because the p-value is greater than alpha = 5%, we fail to reject the null
* hypothesis that the covariances are equal. I.e., yes, the assumption is met.

** 5
manova TOTCHOL1 SYSBP1 HEARTRTE1 = bmi_cat

** 6
* Ho: BMI category has no effect on health indicators

* According to the MANOVA, there are statistically significant differences
* among the three BMI categories with respect to the health indicators, because
* the p-values are all less than alpha = 5%.

** 7
* First SSCPw:
correl TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 1, cov 
return list
display r(N)
mat list r(C)
mat SSCPw1 = r(C)*(r(N)-1)
mat list SSCPw1
* Second SSCPw:
correl TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 2, cov
mat SSCPw2 = r(C)*(r(N)-1)
mat list SSCPw2
* Third SSCPw:
correl TOTCHOL1 SYSBP1 HEARTRTE1 if bmi_cat == 3, cov
mat SSCPw3 = r(C)*(r(N)-1)
mat list SSCPw3

* Pool SSCPw matrices
mat SSCPwtot = SSCPw1 + SSCPw2 +SSCPw3
mat list SSCPwtot

** 8
matrix E = e(E)
scalar detE = det(E)
display detE
matrix H1 = e(H_1)
matrix list H1
matrix EplusH1 = E + H1
matrix list EplusH1
scalar detEplusH1 = det(EplusH1)
display detEplusH1 
display "Wilks' lambda = " detE/detEplusH1
* Wilks' lambda = .9255

** 9
* Running the manova command in Stata (problem #5) gave me the same value for
* Wilk's lambda as when I computed it using the steps in problem #8 Both times
* I got Wilks' lambda = .9255.

** 10
manovatest, showorder
* Column 1 = Normal Weight
* Column 2 = Overweight
* Column 3 = Obese
* Column 4 = Constants

matrix a = (1,-1,0,0) // normal vs overweight
manovatest, test(a) // p-value approx. 0, so significantly different

matrix b = (1,0,-1,0) // normal vs obese
manovatest, test(b) // p-value > 5%, so not significantly different

** 11
margins bmi_cat
marginsplot, xdim(bmi_cat)
* The overweight group is significantly different from the normal weight group
* in terms of cholesterol (TOTCHOL1) and blood pressure (SYSBP1).

** 12
candisc TOTCHOL1 SYSBP1 HEARTRTE1, group(bmi_cat)
* Function 1 is supposed to account for about 94% of the variance.
* And based on the loadings, blood pressure has the most effect
* on BMI followed by cholesterol and then heart rate has the least effect.

** 13
* The initial question was about differences in weight categories in terms of
* the three health indicators and the analysis shows that the normal weight
* group and the overweight group differ the most in terms of the health
* indicators, especially in terms of blood pressure.
