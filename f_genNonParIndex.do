cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

use data2002ver3, replace

gen lnnofinventors = ln(nofinventors)
gen lnnofassignee = ln(nofassignee)
gen lnnoflawyers = ln(noflawyers)

gen lnofnofcitation = ln(nofcitation)
gen lnofbnofcitation = ln(nofbcitation)
gen lnnofclaims = ln(nofclaims)

/*
0->0
1->1
>1->2
*/
gen ifHasLawyersIndex = 0
gen ifHasAssigneeIndex = 0
//gen nofinventorIndex = 1
gen hasOneInv = 0
gen hasTwoInv = 0
gen hasThreeOrFourInv = 0
gen hasMoreThanFourInv = 0
/*
1->1
2->2
3~4->3
>4->4
*/

local nObs = _N
forv i = 1/`nObs'{
	if(noflawyers[`i'] == 1){
		replace ifHasLawyersIndex = 1 in `i'
	}
/*	if(noflawyers[`i'] > 1){
		replace ifHasLawyersIndex = 2 in `i'
	}*/
	if(nofassignee[`i'] == 1){
		replace ifHasAssigneeIndex = 1 in `i'
	}
/*	if( nofassignee[`i'] > 1){
		replace ifHasAssigneeIndex = 2 in `i'
	}*/
	if(nofinventors[`i'] == 1){
		replace hasOneInv = 1 in `i'
	}
	if(nofinventors[`i'] == 2){
		replace hasTwoInv = 1 in `i'
	}
	if(nofinventors[`i'] == 3 | nofinventors[`i'] == 4){
		replace hasThreeOrFourInv = 1 in `i'
	}
	if(nofinventors[`i'] > 4){
		replace hasMoreThanFourInv = 1 in `i'
	}
}

save data2002ver4, replace
