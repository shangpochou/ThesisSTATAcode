clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use data2002ver4, replace

tab month, gen(month)
//full model using ln(#inventors). It has lower p-value, which is 0
poisson nBlocking lnofnofcitation lnnofinventors lnnofclaims lnofbnofcitation  ifHasLawyersIndex ifHasAssigneeIndex  hasforeinv
//full model using non-parametric #inventors index
poisson nBlocking lnofnofcitation lnnofclaims lnofbnofcitation  ifHasLawyersIndex ifHasAssigneeIndex  hasforeinv  hasOneInv hasTwoInv hasThreeOrFourInv
//predictive model (without #foward citation) using ln(#inventors). 
//for predictive model, both ln and non-parametric index contributed 0 p-value
poisson nBlocking lnnofinventors lnnofclaims lnofbnofcitation  ifHasLawyersIndex ifHasAssigneeIndex  hasforeinv
//predictive model (without #foward citation) using non-parametric #inventors index
poisson nBlocking lnnofclaims lnofbnofcitation  ifHasLawyersIndex ifHasAssigneeIndex  hasforeinv hasOneInv hasTwoInv hasThreeOrFourInv
poisson nBlocking lnofnofcitation lnnofinventors lnnofclaims lnnofassignee lnnoflawyers lnofbnofcitation month1-month11
//seasonality model, and we found that there is no seasonality
poisson nBlocking month1-month11



corr nBlocking nofcitation nofinventors nofclaims nofassignee noflawyers
/*
keep if nBlocking != 0

corr nBlocking nofcitation nofinventors
*/

logistic ifBlocking nofcitation

logistic ifBlocking nofinventors

logistic ifBlocking nofcitation nofinventors

logit ifBlocking nofcitation nofinventors

logit ifBlocking nofcitation lnnofinventors

poisson nBlocking nofcitation lnnofinventors


regress nBlocking nofinventors

graph twoway (lfitci nBlocking nofinventors) (scatter nBlocking nofinventors, msize(vsmall))

regress nBlocking nofcitation

graph twoway (lfitci nBlocking nofcitation) (scatter nBlocking nofcitation, msize(vsmall))

