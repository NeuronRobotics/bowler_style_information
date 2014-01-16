#git clone bowler-monolithic hardware-bowler.tmp

function runClonePrune(){
	temp=$1.tmp
	if [ -d "$temp" ]; then
		echo $temp Clone exists;
	else
		git clone bowler-monolithic $1.tmp;
	fi
	
	cd $temp;
	echo Updating git in: $PWD;
	gitstring='git rm -r --cached --ignore-unmatch '$2
	execString='git filter-branch -f --prune-empty --index-filter "'$gitstring'" HEAD'

	echo $execString 
	eval $execString;
	git remote remove origin;
	git remote add https://github.com/NeuronRobotics/$1.git;
	cd ..;
	if [ -d "$1" ]; then
		echo $1 Clone exists;
	else
		git clone $temp $1;
	fi
	
	cd $1 ;
	git remote remove origin;
	git remote add https://github.com/NeuronRobotics/$1.git;
	git push -f;
}

#runClonePrune  ''  'application/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/';

runClonePrune  'hardware-bowler' 'application/ csdk/ firmware/ libs/ plugin/ publish/ javasdk/ test/ Android/' ;

#runClonePrune  'microcontroller-bowler'  'application/ csdk/ firmware/tools/ firmware/library/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/';








