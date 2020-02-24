* APSTA.GE 2004
* Homework 6
* Jennifer Jackson

use "/Users/jenniferjackson/Desktop/NYU/Multivariate Analysis/HW6/UT Course Eval Items from UCLA Cons Grp.dta"

** Step 1 **

codebook studsex
* male = 1
* female = 2
* There are 8 missing values, labeled "."

codebook gpa
* gpa < 2.00 = 1
* 2.00 <= gpa <= 2.49 = 2
* 2.50 <= gpa <= 2.99 = 3
* 3.00 <= gpa <= 3.49 = 4
* 3.50 <= gpa <= 4.00 = 5

** Step 2 **
tabstat item13-item24, stat(n mean sd min max skewness)

** Step 3 **
correl item13-item24

** Step 4 **
factor item13-item24, ipf

** Step 5 **
estat kmo
* Because the kmo values are greater than 0.8, that means there are enough
* underlying factors to make factor analysis a good approach to analysing the
* data.

** Step 6 **
screeplot
* The "elbow" of the screeplot occurs around the m = 2 mark and the eigenvalues
* of the first two factors are the only ones higher than 0.5, so it makes sense
* to limit the analysis to these first 2 factors.

** Step 7 **
estat residual, fitted obs
* The off-diagonal values of the residual R matrix are all essentially 0, so the
* model is a good fit.

** Step 8 **
factor item13-item24, ipf factor(2)

** Step 9 **
estat residual, fitted obs
* The off-diagonal values of the residual R matrix are all relatively small (all
* under 0.06 except for one value of 0.1641, which is still small), so the model
* looks to be a good fit still.

** Step 10 **
rotate, orthogonal varimax normalize factors(2) blanks(.3)

** Step 11 **
* Rotation redistributes the variance to get a more simplified and therefore 
* more distinct contrast among the factors, in this case, the first two that we
* decided to use.

** Step 12 **
loadingplot, xlab(-.5(.1).5) ylab(-.5(.1).5) aspect(1) yline(0) xline(0)
* Based on the factor loadings pattern matrix, there appears to be a high degree
* of simple structure. The graph, however, is not what I expected to see - the
* variables don't cluster around either of the factor axes as in the examples
* shown in class and lab.

** Step 13 **
estat structure

** Step 14 **
rotate, oblique oblimin(0) normalize factors(2) blanks(.3)

** Step 15 **
loadingplot, xlab(-.5(.1).5) ylab(-.5(.1).5) aspect(1) yline(0) xline(0)
* Yes, the oblimin rotation leads to a simpler structure, which can be seen by
* the larger number of zeros in the rotated factor loadings pattern matrix.

** Step 16 **
estat common
* correlation is 0.66

** Step 17 **
estat structure

** Step 18 **
* No, the interpretation does not change based on the oblique transformation.
* The oblique transformation just makes the factors a lot more clear cut.

** Step 19 **
alpha item13-item24
* alpha = 0.92 means there is high internal consistency.

** Step 20 **
predict F1 F2
canon (grade gpa studsex) (F1 F2)
* I think this is the correct code, but I can't quite figure out how to interpret
* the results. But it looks like there is a strong relationship between grade
* and course evaluation factor 2. 

** Step 21 **
* Based on the analysis, evaluation factor 1 is primarily defined by items 13
* and 14: the instructor's preparation and knowledge of the material.
* Evaluation factor 2 is primarily defined by items 18 and 19: the instructor's
* sensitivity to students and openness to questions. So I would say the two
* factors can be summed up by the instructor's hard skills and soft skills.










