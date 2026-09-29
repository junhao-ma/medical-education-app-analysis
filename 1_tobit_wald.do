//中国阶段1
version 18.0
clear all
clear all

import delimited using "/Users/majunhao/Desktop/中美数据/中国2.csv", ///
    varnames(1) clear bindquote(strict) encoding("gb18030")
*import delimited using "/Users/majunhao/Desktop/中美数据/中国1.csv", varnames(1) clear

* Topic-variable settings:
* China, 2009-2017: x1-x8; exclude x6 from Wald comparison.
* China, 2018-2025: x1-x12; exclude x10 from Wald comparison.
* US, 2009-2017: x1-x9; include all topics in Wald comparison.
* US, 2018-2025: x1-x10; exclude x9 from Wald comparison.
*
* The following code uses the US 2018-2025 sample as an example.

* Assess multicollinearity before Tobit model estimation.


* Estimate the PD and ND Tobit models.
capture estimates drop m1 m2

tobit pd y1-y8, ll(0) ul(4)
estimates store m1

tobit nd y1-y8, ll(0) ul(4)
estimates store m2

* Combine estimates for cross-model Wald tests.
suest m1 m2

* Compare signed PD and ND coefficients.
* Topic 6 is excluded as a predefined non-discriminatory topic.
testnl [m1_pd]y1 = -[m2_nd]y1
testnl [m1_pd]y2 = -[m2_nd]y2
testnl [m1_pd]y3 = -[m2_nd]y3
testnl [m1_pd]y4 = -[m2_nd]y4
testnl [m1_pd]y5 = -[m2_nd]y5
*testnl [m1_pd]y6 = -[m2_nd]y6
testnl [m1_pd]y7 = -[m2_nd]y7
testnl [m1_pd]y8 = -[m2_nd]y8

regress pd y1-y8
estat vif

regress nd y1-y8
estat vif

* Official Stata reference:
* https://www.stata.com/manuals/rtobitpostestimation.pdf


//中国阶段2
version 18.0
clear all
set more off


* Import the China 2018-2025 dataset.
import delimited using "/Users/majunhao/Desktop/中美数据/中国2-1.csv", ///
    varnames(1) clear bindquote(strict) encoding("gb18030")

* Assess multicollinearity.
regress pd y1-y12
estat vif

regress nd y1-y12
estat vif

* Estimate the PD and ND Tobit models.
capture estimates drop m1 m2

tobit pd y1-y12, ll(0) ul(4)
estimates store m1

tobit nd y1-y12, ll(0) ul(4)
estimates store m2

* Combine the estimates for cross-model Wald tests.
suest m1 m2

* Test H0: beta_PD = -beta_ND.
* Topic 10 (y10) is excluded from the Wald comparison.
testnl [m1_pd]y1  = -[m2_nd]y1
testnl [m1_pd]y2  = -[m2_nd]y2
testnl [m1_pd]y3  = -[m2_nd]y3
testnl [m1_pd]y4  = -[m2_nd]y4
testnl [m1_pd]y5  = -[m2_nd]y5
testnl [m1_pd]y6  = -[m2_nd]y6
testnl [m1_pd]y7  = -[m2_nd]y7
testnl [m1_pd]y8  = -[m2_nd]y8
testnl [m1_pd]y9  = -[m2_nd]y9
* testnl [m1_pd]y10 = -[m2_nd]y10
testnl [m1_pd]y11 = -[m2_nd]y11
testnl [m1_pd]y12 = -[m2_nd]y12

//中国阶段3
version 18.0
clear all
set more off

* Import the dataset.
import delimited using "/Users/majunhao/Desktop/中美数据/美国1-2.csv", ///
    varnames(1) clear bindquote(strict) encoding("gb18030")

* Assess multicollinearity.
regress pd y1-y9
estat vif

regress nd y1-y9
estat vif

* Estimate the PD and ND Tobit models.
capture estimates drop m1 m2

tobit pd y1-y9, ll(0) ul(4)
estimates store m1

tobit nd y1-y9, ll(0) ul(4)
estimates store m2

* Combine estimates for cross-model Wald tests.
suest m1 m2

* Test H0: beta_PD = -beta_ND.
testnl [m1_pd]y1 = -[m2_nd]y1
testnl [m1_pd]y2 = -[m2_nd]y2
testnl [m1_pd]y3 = -[m2_nd]y3
testnl [m1_pd]y4 = -[m2_nd]y4
testnl [m1_pd]y5 = -[m2_nd]y5
testnl [m1_pd]y6 = -[m2_nd]y6
testnl [m1_pd]y7 = -[m2_nd]y7
testnl [m1_pd]y8 = -[m2_nd]y8
testnl [m1_pd]y9 = -[m2_nd]y9

//中国阶段4

version 18.0
clear all
set more off

* Import the dataset.
import delimited using "/Users/majunhao/Desktop/中美数据/美国2-1.csv", ///
    varnames(1) clear bindquote(strict) encoding("gb18030")

* Assess multicollinearity.
regress pd y1-y10
estat vif

regress nd y1-y10
estat vif

* Estimate the PD and ND Tobit models.
capture estimates drop m1 m2

tobit pd y1-y10, ll(0) ul(4)
estimates store m1

tobit nd y1-y10, ll(0) ul(4)
estimates store m2

* Combine estimates for cross-model Wald tests.
suest m1 m2

* Test H0: beta_PD = -beta_ND.
* Topic 9 (y9) is excluded from the Wald comparison.
testnl [m1_pd]y1  = -[m2_nd]y1
testnl [m1_pd]y2  = -[m2_nd]y2
testnl [m1_pd]y3  = -[m2_nd]y3
testnl [m1_pd]y4  = -[m2_nd]y4
testnl [m1_pd]y5  = -[m2_nd]y5
testnl [m1_pd]y6  = -[m2_nd]y6
testnl [m1_pd]y7  = -[m2_nd]y7
testnl [m1_pd]y8  = -[m2_nd]y8
* testnl [m1_pd]y9 = -[m2_nd]y9
testnl [m1_pd]y10 = -[m2_nd]y10
