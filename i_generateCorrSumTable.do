clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use data2002ver4, replace
//generate raw data set for full models
keep nofcitation nofinventors nBlocking nofclaims nofassignee noflawyers nofbcitation hasforeinv
order nBlocking nofcitation nofinventors nofclaims nofassignee noflawyers nofbcitation hasforeinv

corr

sum
