clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use nBlockingCitationInventors2002, replace

gen ifBlocking = 0

local nObs = _N
forv i = 1/`nObs'{
	if(nBlocking[`i'] != 0){
		replace ifBlocking = 1 in `i'
	}
}

save nBlockingCitationInventors2002ver1, replace
