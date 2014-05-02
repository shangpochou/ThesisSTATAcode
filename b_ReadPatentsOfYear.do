clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

insheet using PatentsOf2002.csv, comma


merge 1:1 patentid using NumberOfBlockingFinal

drop if _merge == 2

drop _merge

merge 1:1 patentid using citation2002

drop _merge

merge 1:1 patentid using inventors2002

/*
replace missing value with 0 for number of blocking
*/

local nObs = _N
forv i = 1/`nObs'{
	if(nOfBlocking[`i'] == .){
		replace nOfBlocking = 0 in `i'
	}
}

rename nOfBlocking nBlocking

drop _merge

save nBlockingCitationInventors2002, replace



//destring patentid, replace



/*
gen sumBA = 1

collapse (sum) sumBA, by (grantedyear)

graph bar sumBA, over(grantedyear)
