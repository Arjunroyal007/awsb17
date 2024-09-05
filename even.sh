#this topic is all about find even numbers
read -p "enter a number" NUM
echo "entered number is : " $NUM
if [ expr $NUM / 2 = 0 ]
then
echo $NUM "is even number"
else
	echo $NUM "is not a even number"
fi
