#!/bin/bash
RM="rm -rf ./answer.txt"
Black='\033[1;90m'      # Black
Red='\033[1;91m'        # Red
Green='\033[1;92m'      # Green
Yellow='\033[1;93m'     # Yellow
Blue='\033[1;94m'       # Blue
Purple='\033[1;95m'     # Purple
Cyan='\033[1;96m'       # Cyan
White='\033[1;97m'

OK="${Green}OK"
KO="${Red}KO"
#test 01

compare() {
	if [ "$1" == "$(cat answer.txt)" ] ;then
	echo -e $OK
else
	echo -e $KO
fi
}

cd ./ex01
STR_01_01="21TEST"
ANS_01_01="tset12"
STR_01_02="tes4tonS"
ANS_01_02="sNOT4SET"
STR_01_03="double"
ANS_01_03="sNOT4SET ELBUOD"

echo -e "${Yellow}Testing excercise 01${Cyan}"
#test empty
python exec.py

#01_01
python exec.py $STR_01_01 > answer.txt
compare "$ANS_01_01"

#01_02
python exec.py $STR_01_02 > answer.txt
compare "$ANS_01_02"


#01_03
python exec.py $STR_01_03    $STR_01_02 > answer.txt
compare "$ANS_01_03"


$RM

#test 02
cd ../ex02
echo -e "\n${Yellow}Testing excercise 02${Cyan}"

ANS_ODD="I'm odd."
ANS_EVEN="I'm even."
ANS_ZERO="I'm zero."
STR="Hello"
ODD_02="13"
EVEN_02="20"
ZERO_02="0"
NEG_ODD_02="-13"
NEG_EVEN_02="-20"

#test empty
python whois.py

#test two many args
python whois.py $ODD_02 $EVEN_02

#test string
python whois.py $STR

#test odd
python whois.py $ODD_02 > answer.txt
compare "$ANS_ODD"

#test even
python whois.py $EVEN_02 > answer.txt
compare "$ANS_EVEN"

#test zero
python whois.py $ZERO_02 > answer.txt
compare "$ANS_ZERO"

#test negative_odd
python whois.py $NEG_ODD_02 > answer.txt
compare "$ANS_ODD"

#test negative_even
python whois.py $NEG_EVEN_02 > answer.txt
compare "$ANS_EVEN"

$RM
