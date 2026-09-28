version 18.0
clear all

import delimited using "D:\data1.csv", varnames(1) clear

* Topic-variable settings:
* China, 2009-2017: x1-x8; exclude x6 from Wald comparison.
* China, 2018-2025: x1-x12; exclude x10 from Wald comparison.
* US, 2009-2017: x1-x9; include all topics in Wald comparison.
* US, 2018-2025: x1-x10; exclude x9 from Wald comparison.
*
* The following code uses the US 2018-2025 sample as an example.

* Assess multicollinearity before Tobit model estimation.
regress pd x1-x10
estat vif

regress nd x1-x10
estat vif

* Estimate the PD and ND Tobit models.
capture estimates drop m1 m2

tobit pd x1-x10, ll(0) ul(4)
estimates store m1

tobit nd x1-x10, ll(0) ul(4)
estimates store m2

* Combine estimates for cross-model Wald tests.
suest m1 m2

* Compare signed PD and ND coefficients.
* Topic 9 is excluded as a predefined non-discriminatory topic.
testnl [m1_pd]x1 = [m2_nd]x1
testnl [m1_pd]x2 = [m2_nd]x2
testnl [m1_pd]x3 = [m2_nd]x3
testnl [m1_pd]x4 = [m2_nd]x4
testnl [m1_pd]x5 = [m2_nd]x5
testnl [m1_pd]x6 = [m2_nd]x6
testnl [m1_pd]x7 = [m2_nd]x7
testnl [m1_pd]x8 = [m2_nd]x8
testnl [m1_pd]x10 = [m2_nd]x10

* Official Stata reference:
* https://www.stata.com/manuals/rtobitpostestimation.pdf
