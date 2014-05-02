clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use data2002ver2, replace

merge 1:1 patentid using backwardCitation2002

drop _merge

drop year

merge 1:1 patentid using dates2002

drop _merge

merge 1:1 patentid using IfHasForInv2002

save data2002ver3, replace

gen sumM = 1

collapse (sum) sumM, by (month)
