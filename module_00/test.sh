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

compare() {
	if [ "$1" == "$(cat answer.txt)" ] ;then
	echo -e $OK
else
	echo -e $KO
fi
}

#test 01
function test1() {
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
	cd ..
}

function test2() {
	#test 02
	cd ./ex02
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
	cd ..
}
function test3() {

	#test 03
	cd ./ex03
	echo -e "\n${Yellow}Testing excercise 03${White}"
	STR_03="Hello World!"
	STR2_03="Python 2.0, released 2000, introduced features like List comprehensions and a garbage collection system capable of collecting reference cycles."
	STR3_03="Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python's design philosophy emphasizes code readability with its notable use of significant whitespace."

	#test user_input
	python count.py
	echo -e "${Cyan}"

	#test error number
	echo -e "from count import text_analyzer" > temp
	echo -e "text_analyzer(42)" >> temp
	python < temp
	rm -rf temp

	#test_01
	echo -e "${Purple}\nTesting with: ${STR_03}${White}"
	python count.py "$STR_03"

	#test_02
	echo -e "${Purple}\nTesting with: ${STR2_03}${White}"
	python count.py "$STR2_03"

	#test_03
	echo -e "${Purple}\nTesting with: ${STR3_03}${White}"
	python count.py "$STR3_03"

	#test_docstring
	echo -e "${Purple}\nTesting docstring${White}"
	echo -e "from count import text_analyzer" > temp
	echo -e "print(text_analyzer.__doc__)" >> temp
	python < temp
	rm -rf temp
	rm -rf __pycache__
	cd ..
}

function test4() {
	#test_04

	NUM1_04='12'
	NUM2_04='20'
	NUMZ_04='0'
	STR='BLEU'

	cd ./ex04
	echo -e "\n${Yellow}Testing excercise 04${White}"

	#test 12 et 20
	echo -e "${Purple}\nTesting with: ${NUM1_04} and ${NUM2_04}${White}"
	python operations.py ${NUM1_04} ${NUM2_04}

	#test 0 et 20
	echo -e "${Purple}\nTesting with: ${NUMZ_04} and ${NUM2_04}${White}"
	python operations.py ${NUMZ_04} ${NUM2_04}

		#test 12 et 0
	echo -e "${Purple}\nTesting with: ${NUM1_04} and ${NUMZ_04}${White}"
	python operations.py ${NUM1_04} ${NUMZ_04}

	echo -e "${Purple}\nTesting with a string${White}"
	python operations.py ${STR} S{NUM1_04}

	echo -e "${Purple}\nTesting argument amount${White}"
	python operations.py ${STR} S{NUM1_04} ${STR}

	echo -e "${Purple}\nTesting argument amount${White}"
	python operations.py S{NUM1_04}
}
# test1
# test2
# test3
test4
# test5
# test6
# test7
# test8
# test9
# test10
