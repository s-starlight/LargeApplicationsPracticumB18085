# 1a
count=3

# 1b
echo $count

# 1c
echo count

# 1d
((count=count+1))
echo $count

# 1e
NAME1="Arun Kumar "
echo $NAME1
NAME2="Verma"
NAME3=$NAME1$NAME2
echo $NAME3

# 2d
echo $NAME1+$NAME2

# 3
# !/bin/bash
# x=5
# y=10
# ans=$((x+y))
# echo "$x + $y = $ans"

echo Enter x
read x
echo Enter y
read y
echo Enter z
read z
max=$x
if [[ $y>$max ]]; then
	max=$y
fi

if [[ $z>$max ]]; then
	max=$z
fi
echo max of x,y and z is $max

# 4
cat > movies.list << EOF
Avengers
Spiderman Into the Spiderverse
Shutter Island
Black Swan
Fight Club
Paper Towns
Romeo and Juliet
Skam wtFock
EOF

# 4a
cat movies.list | wc

# 5
NOOFLINES=$(cat movies.list | wc -l)
echo $NOOFLINES lines in movies.list

# 6
echo 
echo Random sequence of 20 numbers:
seq 20 | shuf

# 7
echo
echo sequence of 20 numbers sorted:
seq 20 | shuf | sort -n

# 8
cat > marks.dat <<EOF
B12 Rajesh 34
B18 Mahesh 75
B19 Arun 55
B10 Vinod 90
B22 Priya 95
B30 Susan 85
EOF

echo After shuffling
cat marks.dat | shuf 

echo
echo After sorting
cat marks.dat | shuf | sort -k 3 -r

echo
echo Top three marks
cat marks.dat | shuf | sort -k 3 -r | head -n 3

# 9
seq 20 | shuf > out.txt
seq 30 | shuf >> out.txt
seq 100 | shuf >>out.txt

echo `wc -l out.txt` 

sort -n out.txt | uniq > out1.txt 
cat out1.txt > out.txt
rm out1.txt
echo `wc -l out.txt`

# 10
man xargs

# 11
whoami
pwd

# 12
etclist=`ls /etc | wc -l`
echo $etclist

# 13
etcdir=`ls -l /etc | grep '^d' | wc -l`
echo $etcdir

# 14
sleep 5s

# 15
x=20

A=`echo $x | xargs ./a.out | awk '{print NF}'`

B=10

if [[ $A -le $B ]]
	then echo $x is a prime number
else echo $x is not a prime number
fi

while IFS= read -r line;
	do
		A=`echo $line | ./a.out | awk '{print NF}'`
		if [[ $A -le $B ]]
			then echo $line is a prime number
		else echo $line is not a prime number
		fi
	done < data.txt




# Lab 1 Continued 

# q1
`rm -f out.txt`
while IFS= read -r line1 && IFS= read -r line2 <&3 && IFS= read -r line3 <&4;do
	A=`echo $line1| awk '{print $1}'`
	B=`echo $line1| awk '{print $2}'`
	C=`echo $line2| awk '{print $2}'`
	D=`echo $line3| awk '{print $2}'`
	echo "$A $((B+C+D))" >> out.txt
done <quiz1.txt 3<quiz2.txt 4<endsem.txt
cat out.txt

# q2
to the #!/bin/bash

input=$1
src=$2
target=$3
     

while IFS= read -r file1;
	do
		echo "Processing " $file1
		file2=$(echo $file1 | sed "s/$src/$target/")
		`convert $file1 $file2`
		echo "Done"
	done <$input

# q5
cat file1.html | sed 's=./file1_files/=/home/lab1_contd/file1_files/=g' > file2.html
cat file2.html < file1.html
rm file2.html
