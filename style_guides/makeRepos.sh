#git clone bowler-monolithic hardware-bowler.tmp

function runClonePrune(){
	temp=$1.tmp
	#git clone bowler-monolithic $1.tmp
	cd $temp
	echo Updating git in: $PWD
	gitstring='git rm -r --cached --ignore-unmatch '$2
	execString='git filter-branch -f --prune-empty --index-filter "'$gitstring'" HEAD'

	echo $execString 
	$execString
return 
	git remote remove origin
	git remote add https://github.com/NeuronRobotics/$1.git
	cd ..
	git clone $temp $1
	cd $1 
	git remote remove origin
	git remote add https://github.com/NeuronRobotics/$1.git
	git push -f
}

# "application/* csdk/* firmware/* hardware/* libs/* pcb/* plugin/* publish/* javasdk/* test/* Android/*"

runClonePrune  'hardware-bowler' 'application/ csdk/ firmware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' ;
