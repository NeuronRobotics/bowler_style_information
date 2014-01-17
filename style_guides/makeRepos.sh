#git clone bowler-monolithic hardware-bowler.tmp

function runClonePrune(){

	url=https://github.com/$4/$1.git
	repo=$1
	otherRepo=$1
	if [ -n "$5" ]; then
		repo=$repo-sup;	
	fi
	temp=$repo.tmp
	
	
	if [ -d "$temp" ]; then
		rm -rf $temp
	fi
	git clone $3 $temp;
	cd $temp;
	echo Updating git in: $PWD to $url;
	gitstring='git rm -r --cached --ignore-unmatch '$2
	execString='git filter-branch -f --prune-empty --index-filter "'$gitstring'" HEAD'

	echo $execString 

	eval $execString;
	git remote remove origin;
	git remote add origin $url;
	
	

	cd ..;
	
	if [ -d "$repo" ]; then
		rm -rf $repo
	fi
	git clone $temp $repo;
	
	cd $repo ;
	echo Updating git in: $PWD to $url;

	git remote remove origin;
	git remote add origin $url;
	git push -f --set-upstream origin master;

	cd ..

	if [[ -z "$5" ]]; then
		rm -rf $temp
		rm -rf $repo;
		git clone $url;
	else
		rm -rf $otherRepo
		git clone $url;
		cd $otherRepo;
		git remote add $repo ../$repo
		git fetch $repo
		git branch $repo-master $repo/master
		git merge $repo-master
		#git push
	fi
	
}
git config --global user.name "Kevin Harrington"
git config --global user.email "mad.hephaestus@gmail.com"
git config --global credential.helper 'cache --timeout=3600'
#runClonePrune  ''  'application/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  'hardware-bowler' 'application/ csdk/ firmware/ libs/ plugin/ publish/ javasdk/ test/ Android/'  'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  'microcontroller-bowler'  'application/ csdk/ firmware/tools/ firmware/library/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';
 
#runClonePrune  'NrConsole'  'application/bdm/ application/CameraServerDirectory/ application/CrustCrawlerDirectory/ application/CTest/ application/demos/ application/DyIOXmppClient/ application/education/ application/NRRos/ application/NRSpeedTest/ application/OggiePressControl/ application/Replicator/ application/ReprapNR/ application/TanuryGoldLogger/ application/tools/ application/Trobot3d/ application/WaldoTest/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  'sample-java-bowler'  'application/OggiePressControl/ application/nrconsole/ application/bdm/ application/CrustCrawlerDirectory/ application/CTest/ application/education/ application/Replicator/ application/ReprapNR/ application/TanuryGoldLogger/ application/tools/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  'industrial-bowler'  'application/CameraServerDirectory/ application/CTest/ application/demos/ application/DyIOXmppClient/ application/education/ application/NRRos/ application/NRSpeedTest/ application/nrconsole/ application/Replicator/ application/ReprapNR/ application/tools/ application/Trobot3d/ application/WaldoTest/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';


#runClonePrune  'utils-bowler'  'application/nrconsole/ application/bdm/ application/CameraServerDirectory/ application/CrustCrawlerDirectory/ application/CTest/ application/demos/ application/DyIOXmppClient/ application/education/ application/NRRos/ application/NRSpeedTest/ application/OggiePressControl/ application/Replicator/ application/ReprapNR/ application/TanuryGoldLogger/ application/Trobot3d/ application/WaldoTest/ csdk/ firmware/device firmware/library firmware/LUFA-PIC32 hardware/ libs/ pcb/ plugin/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  'c-bowler'  'application/nrconsole/ application/bdm application/CameraServerDirectory application/CrustCrawlerDirectory application/demos application/DyIOXmppClient application/education application/NRRos application/NRSpeedTest application/OggiePressControl application/Replicator application/ReprapNR application/TanuryGoldLogger application/tools application/Trobot3d application/WaldoTest/ firmware/tools/ firmware/device/ firmware/LUFA-PIC32  hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  'education-bowler'  'application/nrconsole/ application/bdm/ application/CameraServerDirectory/ application/CrustCrawlerDirectory/ application/CTest/ application/demos/ application/DyIOXmppClient/ application/NRRos/ application/NRSpeedTest/ application/OggiePressControl/ application/Replicator/ application/ReprapNR/ application/TanuryGoldLogger/ application/tools/ application/Trobot3d/ application/WaldoTest/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ Android/' 'bowler-monolithic' 'NeuronRobotics';

#runClonePrune  ''  'BowlerFreecad/  BowlerQueue/  education-bowler-sub/  Example-Vitamin-Hardware/  Graphics/  ServoStock/ Vitamins/' 'the-technocopia-project' 'Technocopia';


#runClonePrune  'BowlerFreeCad'  'BowlerQueue/  education-bowler-sub/  Example-Vitamin-Hardware/  Graphics/  ServoStock/ Vitamins/ .metadata/' 'the-technocopia-project' 'Technocopia';

#runClonePrune  'TecnocopiaQueue'  'BowlerFreecad/ education-bowler-sub/  Example-Vitamin-Hardware/  Graphics/  ServoStock/ Vitamins/ .metadata/' 'the-technocopia-project' 'Technocopia';

#runClonePrune  'Example-Vitamin-Hardware'  'BowlerFreecad/  BowlerQueue/  education-bowler-sub/ Graphics/  ServoStock/ Vitamins/ .metadata/' 'the-technocopia-project' 'Technocopia';

#runClonePrune  'Graphics'  'BowlerFreecad/  BowlerQueue/  education-bowler-sub/  Example-Vitamin-Hardware/  ServoStock/ Vitamins/ .metadata/' 'the-technocopia-project' 'Technocopia';

#runClonePrune  'Vitamins'  'BowlerFreecad/  BowlerQueue/  education-bowler-sub/  Example-Vitamin-Hardware/  Graphics/  ServoStock/ .metadata/' 'the-technocopia-project' 'Technocopia';

runClonePrune  'ServoStock-hw'  'BowlerFreecad/  BowlerQueue/  education-bowler-sub/  Example-Vitamin-Hardware/  Graphics/  Vitamins/ .metadata/' 'the-technocopia-project' 'Technocopia';
runClonePrune  'education-bowler-think-tank'  'BowlerFreecad/  BowlerQueue/  Example-Vitamin-Hardware/  Graphics/  ServoStock/ Vitamins/ .metadata/' 'the-technocopia-project' 'NeuronRobotics' ;
#runClonePrune  'android-bowler'  'application/ csdk/ firmware/ hardware/ libs/ pcb/ plugin/ publish/ javasdk/ test/ ' 'bowler-monolithic' 'NeuronRobotics';

