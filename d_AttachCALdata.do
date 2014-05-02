clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use nBlockingCitationInventors2002ver1, clear

merge 1:1 patentid using CA2002

drop _merge

merge 1:1 patentid using Lawyers2002

drop _merge



save data2002ver2, replace
