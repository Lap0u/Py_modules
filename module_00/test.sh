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

	cd ..
}

function test5() {

	cd ./ex05
	echo -e "\n${Yellow}Testing excercise 05${White}"

	ANS_05_00="The 3 numbers are: 19, 42, 21"
	ANS_05_01="Python was created by Guido van Rossum
Ruby was created by Yukihiro Matsumoto
PHP was created by Rasmus Lerdorf"
	ANS_05_02="09/25/2019 03:30"
	ANS_05_02WC="17"
	ANS_05_03="--------------------------The right format"
	ANS_05_03WC="42"
	ANS_05_04="module_00, ex_04 : 132.42, 1.00e+04, 1.23e+04"
	ANS_05_CUT=",:"

	#test kata 00
	echo -e "${Purple}\nTesting kata00"
	python kata00.py > answer.txt
	compare "$ANS_05_00"

	#test kata 01
	echo -e "${Purple}\nTesting kata01"
	python kata01.py > answer.txt
	compare "$ANS_05_01"

	#test kata 02
	echo -e "${Purple}\nTesting kata02"
	python kata02.py > answer.txt
	compare "$ANS_05_02"
	python kata02.py | wc -c > answer.txt
	compare "$ANS_05_02WC"

	#test kata 03
	echo -e "${Purple}\nTesting kata03"
	python kata03.py > answer.txt
	compare "$ANS_05_03"
	python kata03.py | wc -c > answer.txt
	compare "$ANS_05_03WC"

	#test kata 04
	echo -e "${Purple}\nTesting kata04"
	python kata04.py > answer.txt
	compare "$ANS_05_04"
	python3 kata04.py | cut -c 10,18 > answer.txt
	compare "$ANS_05_CUT"

	$RM
	cd ..
}

function test6() {
	cd ./ex06
	echo -e "\n${Yellow}Testing excercise 06"

	echo -e "${Purple}\nCookbook waiting for input\n${White}"
	python recipe.py
		
	$RM
	cd ..

}

function test7() {
	cd ./ex07
	STR1='Hello, my friend'
	NUM1=3
	ANS1="['Hello', 'friend']"
	NUM2=10
	ANS2="[]"
	STR3='A robot must protect its own existence as long as such protection does not conflict with the First or Second Law'
	NUM3=6
	ANS3="['protect', 'existence', 'protection', 'conflict']"
	STR4=Hello
	NUM4=World
	STR5=3
	NUM5='Hello, my friend'

	echo -e "\n${Yellow}Testing excercise 07"

	echo -e "${Purple}\nTesting |${STR1}| with |${NUM1}| characters\n${White}"
	python filterwords.py "$STR1" $NUM1 > answer.txt
	compare "$ANS1"
	
	echo -e "${Purple}\nTesting |${STR1}| with |${NUM2}| characters\n${White}"
	python filterwords.py "$STR1" $NUM2 > answer.txt
	compare "$ANS2"
		
	echo -e "${Purple}\nTesting |${STR3}| with |${NUM3}| characters\n${White}"
	python filterwords.py "$STR3" $NUM3 > answer.txt
	compare "$ANS3"

	echo -e "${Purple}\nTesting with 2 strings${White}"
	python filterwords.py "$STR4" $NUM4

	echo -e "${Purple}\nTesting with arguments in reverse order${White}"
	python filterwords.py "$STR5" "$NUM5"

	echo -e "${Purple}\nTesting with 3, 1 and 0 arguments${White}"
	python filterwords.py "$STR5" "$STR5" "$STR5" 
	python filterwords.py "$STR5" 
	python filterwords.py 


	$RM
	cd ..
}

function test8() {
	cd ./ex08
	echo -e "\n${Yellow}Testing excercise 08"

	echo -e "${Purple}\Morse code translator\n${White}"
	python sos.py
	STR1="SOS"
	STR2="HELLO / WORLD"
	STR3="HELLO WORLD"
	STR4="96 BOULEVARD"
	STR5="Bessiere"
	ANS1="... --- ..."
	ANS3=".... . .-.. .-.. --- / .-- --- .-. .-.. -.."
	ANS4="----. -.... / -... --- ..- .-.. . ...- .- .-. -.. / -... . ... ... .. . .-. ."

	echo -e "${Purple}\nTesting with |${STR1}|"
	python sos.py "${STR1}" > answer.txt
	compare "$ANS1"

	echo -e "${Purple}\nTesting with |${STR2}|(error because of /)"
	python sos.py "${STR2}" 

	echo -e "${Purple}\nTesting with |${STR3}|"
	python sos.py "${STR3}" > answer.txt
	compare "$ANS3"


	echo -e "${Purple}\nTesting with |${STR4} ${STR5}|(two strings)"
	python sos.py "${STR4}" "${STR5}" > answer.txt
	compare "$ANS4"

	$RM
	cd ..

}

function test9() {
	cd ./ex09
	echo -e "\n${Yellow}Testing excercise 09"

	echo -e "${Purple}\nPlaying guess game\n${White}"
	python guess.py
	echo -e "${Purple}\nModify code to test special features\n${White}"
	
	$RM
	cd ..

}

function test10() {
	cd ./ex10
	echo -e "\n${Yellow}Testing excercise 10"

	echo -e "${Purple}\nLoading bar\n${White}"
	python loading.py
	echo -e "${Purple}\nModify code to test different loops\n${White}"
	
	$RM
	cd ..

}

test1
test2
test3
test4
test5
test6
test7
test8
test9
test10
