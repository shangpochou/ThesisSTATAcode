clear

cd "D:\My_Documents\BerkeleyFall\Capstone\Proj_03_02\RawData"

insheet using citation2002.csv, comma

save citation2002, replace

clear

insheet using inventors2002.csv, comma

save inventors2002, replace

clear

insheet using CA2002.csv, comma

save CA2002, replace

clear

insheet using Lawyers2002.csv, comma

save Lawyers2002, replace

clear

insheet using backwardCitation2002.csv, comma

save backwardCitation2002, replace

clear 

insheet using dates2002.csv, comma

save dates2002, replace

clear 

insheet using IfHasForInv2002.csv, comma

save IfHasForInv2002, replace

clear

insheet using NumberOfBlockingFinal.csv, comma

tostring patentid, replace

rename sumba nOfBlocking

save NumberOfBlockingFinal, replace

