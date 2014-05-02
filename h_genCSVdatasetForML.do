clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use data2002ver4, replace
keep lnnofinventors lnnofassignee lnnoflawyers lnofnofcitation lnofbnofcitation lnnofclaims hasforeinv nBlocking 
order lnnofinventors lnnofassignee lnnoflawyers lnofnofcitation lnofbnofcitation lnnofclaims hasforeinv nBlocking 

outsheet using "MLRegdataSetAdj_Raw.csv", comma replace

use data2002ver4, replace
//generate raw data set for full regression models
keep nofcitation nofinventors nBlocking nofclaims nofassignee noflawyers nofbcitation hasforeinv
order nofcitation nofinventors nofclaims nofassignee noflawyers nofbcitation hasforeinv nBlocking

outsheet using "MLRegdataSet_Raw.csv", comma replace

//generate pred data set for full regression models
keep nofinventors nBlocking nofclaims nofassignee noflawyers nofbcitation hasforeinv
order nofinventors nofclaims nofassignee noflawyers nofbcitation hasforeinv nBlocking

outsheet using "MLRegdataSet_Pred.csv", comma replace

//generate raw data set for full models
keep nofcitation nofinventors ifBlocking nofclaims nofassignee noflawyers nofbcitation hasforeinv
order nofcitation nofinventors nofclaims nofassignee noflawyers nofbcitation hasforeinv ifBlocking

order ifBlocking nofcitation nofinventors nofclaims nofassignee noflawyers nofbcitation hasforeinv
corr

outsheet using "MLdataSet_Raw.csv", comma replace
//--------------------------------------------------------------------
clear
use data2002ver4, replace
//generate raw data set for predictive models (without # forward citations)
keep nofinventors ifBlocking nofclaims nofassignee noflawyers nofbcitation hasforeinv
order nofinventors nofclaims nofassignee noflawyers nofbcitation hasforeinv ifBlocking

outsheet using "MLdataSetPred_Raw.csv", comma replace
//----------------------------------------------------------------------
clear
use data2002ver4, replace

keep  ifBlocking hasforeinv lnnofinventors lnnofassignee ifHasLawyersIndex ifHasAssigneeIndex lnnofclaims lnofbnofcitation lnofnofcitation
order hasforeinv lnnofinventors lnnofassignee ifHasLawyersIndex ifHasAssigneeIndex lnnofclaims lnofbnofcitation lnofnofcitation ifBlocking

outsheet using "MLdataSet_AdjustedIndex.csv", comma replace
//----------------------------------------------------------------------
clear
use data2002ver4, replace

clear
use data2002ver4, replace

keep  ifBlocking hasforeinv lnnofinventors lnnofassignee ifHasLawyersIndex ifHasAssigneeIndex lnnofclaims lnofbnofcitation 
order hasforeinv lnnofinventors lnnofassignee ifHasLawyersIndex ifHasAssigneeIndex lnnofclaims lnofbnofcitation ifBlocking

outsheet using "MLdataSetPred_AdjustedIndex.csv", comma replace
