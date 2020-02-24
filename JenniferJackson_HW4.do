* APSTA.GE 2004
* Homework 4
* Jennifer Jackson

use "/Users/jenniferjackson/Desktop/NYU/Multivariate Analysis/HW4/GSS2014a.dta"
keep age prestg10 sex degree polviews attrally joindem owngun2 fefam

** Descriptive Stats ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
tabstat age prestg10 sex degree polviews attrally joindem owngun2 fefam, ///
	stats(n, mean, sd, min, max, skewness)

codebook
* NOTE: Males = 1 & Females = 2,  Yes = 1 & No = 2
* joindem - the lower the number, the more active participation


** R Correlation Matrix ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pwcorr age prestg10 sex degree polviews attrally joindem owngun2 fefam


** Raw Canonical Coefficients ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
canon (age prestg10 sex degree polviews) (attrally joindem owngun2 fefam)

* There are only four variates, i.e., four is the maximum number of
* relationships between the two groups, Demographics and Behaviours/Attitudes.


** Statistically Significant Correlations ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
canon , test (1 2 3 4)
* The first three tests are statistically significant.


** Significant Weights ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
canon, stderr
* For the 1st dimension, based on alpha = 1%, only degree, attrally, joindem
* and fefam are statistically significant.

* For the 2nd dimension, only age, prestg10, polviews, attrally, joindem and
* owngun2 are statistically significant.

* For the 3rd dimension, only sex, attrally, joindem and owngun2 are
* statistically significant.

* As for canonical correlations though, only 18% (0.4284^2) of the variance of
* the first Behavioural/Attitudinal canonical variate is explained by the first
* Demographic canonical variate and vice versa.


** Standardised Canonical Coefficients ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
canon (age prestg10 sex degree polviews) (attrally joindem owngun2 fefam), ///
	first(3) stdcoef notest

* Based on this output, the "degree" variable, with a coefficient of 0.7827,
* defines the first Demographic variate, followed in turn by political views,
* age, sex and occupational prestige.

* As for the Behavioural/Attitudinal variate, it is defined by attitudes towards
* traditional gender roles (fefam) with a coefficient of 0.5497, followed by
* demonstration participation (joindem), politcal participation (attrally), and
* gun ownership (owngun2).


** Analysis of Loadings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
estat loadings
** 1st
* Based on this output, degree (i.e., highest formal education level) primarily
* defines the first canonical Demographic variate while social engagement (joindem)
* primarily defines the first canonical Behavioural/Attitudinal variate. 
* The more educated a person, the more likely he or she will participate in
* a demonstration (since the larger the value of joindem, the less likely a
* person is to demonstrate). Therefore the first latent variable between the two
* sets seems to have a social dimension.

** 2nd
* Age primarily defines the second canonical Demographic variate; gun ownership
* primarily defines the second Behavioural/Attitudinal variate. The older
* someone is, the less likely he or she is to own a gun.

** 3rd
* Sex primarily defines the third canonical Demographic variate; gun ownership
* primarily defines the third Behavioural/Attitudinal variate. Based on these
* results, females are less likely to own a gun. Looking at the second and third
* together, it appears that the latent variable defining gun ownership has a
* demographic dimension.










