[top]
components : PedestrianWalk
components : personGenLeft1@generator personGenLeft2@generator personGenLeft3@generator
components : personGenLeft4@generator personGenLeft5@generator personGenLeft6@generator
components : personGenRight1@generator personGenRight2@generator personGenRight3@generator
components : personGenRight4@generator personGenRight5@generator personGenRight6@generator

link : out@personGenLeft1 entranceLeft1@PedestrianWalk
link : out@personGenLeft2 entranceLeft2@PedestrianWalk
link : out@personGenLeft3 entranceLeft3@PedestrianWalk
link : out@personGenLeft4 entranceLeft4@PedestrianWalk
link : out@personGenLeft5 entranceLeft5@PedestrianWalk
link : out@personGenLeft6 entranceLeft6@PedestrianWalk

link : out@personGenRight1 entranceRight1@PedestrianWalk
link : out@personGenRight2 entranceRight2@PedestrianWalk
link : out@personGenRight3 entranceRight3@PedestrianWalk
link : out@personGenRight4 entranceRight4@PedestrianWalk
link : out@personGenRight5 entranceRight5@PedestrianWalk
link : out@personGenRight6 entranceRight6@PedestrianWalk


[PedestrianWalk]
type : cell
dim : (8,20)
delay : transport
defaultDelayTime : 100
border : nonwrapped
neighbors : 												PedestrianWalk(-2,0)
neighbors : PedestrianWalk(-1,-2)	PedestrianWalk(-1,-1)	PedestrianWalk(-1,0) 	PedestrianWalk(-1,1)	PedestrianWalk(-1,2)
neighbors : PedestrianWalk(0,-2)	PedestrianWalk(0,-1) 	PedestrianWalk(0,0) 	PedestrianWalk(0,1)		PedestrianWalk(0,2)
neighbors : PedestrianWalk(1,-2)	PedestrianWalk(1,-1) 	PedestrianWalk(1,0) 	PedestrianWalk(1,1)		PedestrianWalk(1,2)
neighbors : PedestrianWalk(2,-2)	PedestrianWalk(2,-1) 	PedestrianWalk(2,0) 	PedestrianWalk(2,1)		PedestrianWalk(2,2)
neighbors : 												PedestrianWalk(3,0)
initialValue : 0
localtransition : rules 
initialrow : 0     50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50
initialrow : 7     50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50 50

in : entranceRight1	entranceRight2	entranceRight3
in : entranceRight4	entranceRight5	entranceRight6
in : entranceLeft1	entranceLeft2	entranceLeft3
in : entranceLeft4	entranceLeft5	entranceLeft6

link : entranceRight1 entranceRight1@PedestrianWalk(1,19)
link : entranceRight2 entranceRight2@PedestrianWalk(2,19)
link : entranceRight3 entranceRight3@PedestrianWalk(3,19)
link : entranceRight4 entranceRight4@PedestrianWalk(4,19)
link : entranceRight5 entranceRight5@PedestrianWalk(5,19)
link : entranceRight6 entranceRight6@PedestrianWalk(6,19)

link : entranceLeft1 entranceLeft1@PedestrianWalk(1,0)
link : entranceLeft2 entranceLeft2@PedestrianWalk(2,0)
link : entranceLeft3 entranceLeft3@PedestrianWalk(3,0)
link : entranceLeft4 entranceLeft4@PedestrianWalk(4,0)
link : entranceLeft5 entranceLeft5@PedestrianWalk(5,0)
link : entranceLeft6 entranceLeft6@PedestrianWalk(6,0)

portInTransition : entranceLeft1@PedestrianWalk(1,0) left-entrance-rule
portInTransition : entranceLeft2@PedestrianWalk(2,0) left-entrance-rule
portInTransition : entranceLeft3@PedestrianWalk(3,0) left-entrance-rule
portInTransition : entranceLeft4@PedestrianWalk(4,0) left-entrance-rule
portInTransition : entranceLeft5@PedestrianWalk(5,0) left-entrance-rule
portInTransition : entranceLeft6@PedestrianWalk(6,0) left-entrance-rule

portInTransition : entranceRight1@PedestrianWalk(1,19) right-entrance-rule
portInTransition : entranceRight2@PedestrianWalk(2,19) right-entrance-rule
portInTransition : entranceRight3@PedestrianWalk(3,19) right-entrance-rule
portInTransition : entranceRight4@PedestrianWalk(4,19) right-entrance-rule
portInTransition : entranceRight5@PedestrianWalk(5,19) right-entrance-rule
portInTransition : entranceRight6@PedestrianWalk(6,19) right-entrance-rule


[right-entrance-rule]
%Assign a value of 2 to the pedestrians who are walking towards left
%rule : 2 100 {portvalue(ThisPort)>0 and (0,1)=? and (0,-1)!=? and (0,-1)!=1 and ( (0,0)=0 or ((0,0)=1 and cellpos(1)=19) )}
rule : 2 100 {portvalue(ThisPort)>0 and (0,1)=? and (0,-1)!=? and (0,-1)!=1 and (0,0)=0}
rule : {(0,0)} 100 {t}

[left-entrance-rule]
%Assigning a value of 1 to the pedestrians who are walking towards right
%rule : 1 100 {portvalue(ThisPort)>0 and (0,-1)=? and (0,1)!=? and (0,1)!=2 and ( (0,0)=0 or ((0,0)=2 and cellpos(1)=0) )}
rule : 1 100 {portvalue(ThisPort)>0 and (0,-1)=? and (0,1)!=? and (0,1)!=2 and (0,0)=0 }
rule : {(0,0)} 100 {t}

[rules]
%Exit rules
rule : 0 100 {(0,0)=1 and (0,1)=? and (0,2)=?}
rule : 0 100 {(0,0)=2 and (0,-1)=? and (0,-2)=?}

%Straight movement - Highest priority
%Does not need to check for any case other than straight move into the cell from the other direction
rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=0 and (((0,2)!=? and (0,2)!=2) or (0,2)=?)} 
rule : 1 100 {(0,0)=0 and (0,-1)=1 and (0,1)!=2}
rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=0 and (((0,-2)!=? and (0,-2)!=1) or (0,-2)=?)}
rule : 2 100 {(0,0)=0 and (0,-1)!=1 and (0,1)=2}


%Move upwards - Second highest priority
%This level of priority rules applies to both pedestrians treveling left and treveling right
%Needs to check straight movement, but does not need to check for movement down wards into the cell
%	1.Pedestrian traveling towards left, and step to their right when directly blocked
rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=1 							%if pedestrian is blocked
				and (-1,0)!=? and (-1,0)=0									%above row needs not to be the wall
				and (((-1,-1)!=? and (-1,-1)!=1) or (-1,-1)=?)				%(-1,-1) cannot be 1
				and (((-1,1)!=? and (-1,1)!=2) or (-1,1)=?)}				%(-1,1) cannot be 2	
rule : 2 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (1,0)!=? and (1,-1)!=? and (1,0)=2	and (1,-1)=1}		%there is a pedestrian wanting to move in

%	2.Pedestrian traveling left, and step to their right when moving into the same cell as another traveling right
rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=0 and (0,-2)!=? and (0,-2)=1 %conflic for straight movement
				and (-1,0)!=? and (-1,0)=0									%the cell above is empty
				and (((-1,-1)!=? and (-1,-1)!=1) or (-1,-1)=?)				%(-1,-1) cannot be 1
				and (((-1,1)!=? and (-1,1)!=2) or (-1,1)=?)}				%(-1,1) cannot be 2
rule : 2 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (1,0)!=? and (1,-1)!=? and (1,-2)!=? 					%there is a pedestrian wanting to move in
				and (1,0)=2 and (1,-1)=0 and (1,-2)=1}									

%	3.Pedestrian traveling right. They attempt to side step to their right when directly blocked, but find 
%	  the wall is to their right. Therefore they try to step to their left.
rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=2 								%if pedestrian is blocked
				and (1,0)!=? and (1,0)=50 									%next row is the wall 
				and (-1,0)!=? and (-1,0)=0 									%cell above is empty				
				and (((-1,-1)!=? and (-1,-1)!=1) or (-1,-1)=?)				%(-1,-1) cannot be 1 
				and (((-1,1)!=? and (-1,1)!=2) or (-1,1)=?)} 				%(-1,1) cannot be 2
rule : 1 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (1,0)!=? and (1,1)!=? and (1,0)=1 and (1,1)=2			%there is a pedestrian wanting to move in
				and (2,0)!=? and (2,0)=50}									%2 rows below is the wall
				
%	4.Pedestrian traveling right. They attempt to side step to their right when trying to move into the same cell 
%	  as pedestrian treveling left, but find the wall is to their right. Therefore they try to step to their left.
rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=0 and (0,2)!=? and (0,2)=2 	%conflic for straight movement
				and (1,0)!=? and (1,0)=50 									%row below is the wall
				and (-1,0)!=? and (-1,0)=0 									%cell above is empty
				and (((-1,-1)!=? and (-1,-1)!=1) or (-1,-1)=?)				%(-1,-1) cannot be 1
				and (((-1,1)!=? and (-1,1)!=2) or (-1,1)=?)} 				%(-1,1) cannot be 2
rule : 1 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (1,0)!=? and (1,1)!=? and (1,2)!=? 						%there is a pedestrian wanting to move in
				and (1,0)=1 and (1,1)=0 and (1,2)=2 
				and (2,0)!=? and (2,0)=50}									%2 rows below is the wall


%Move downwards - Third highest priority (or the losest in this project)
%This level of priority rules applies to both pedestrians treveling left and treveling right
%Needs to check straight movement, and also needs to check for pedestrians moving upwards
%	1.Pedestrian traveling towards right, and step to their right when directly blocked
rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=2 								%if pedestrian is blocked
				and (1,0)!=? and (1,0)=0 									%next row needs not to be the wall
				and (((1,-1)!=? and (1,-1)!=1) or (1,-1)=?)					%(1,-1) cannot be 1
				and (((1,1)!=? and (1,1)!=2) or (1,1)=?)					%(1,1) cannot be 2
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=1)	%case 1 in moving upward does not happen
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=0  	%case 2 in moving upward does not happen
				        and (2,-2)!=? and (2,-2)=1)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=2 		%case 3 in moving upward does not happen
					    and (3,0)!=? and (3,0)=50)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=0 		%case 4 in moving upward does not happen
						and (2,2)!=? and (2,2)=2 and (3,0)!=? and (3,0)=50)}
rule : 1 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move to the cell
				and (-1,0)!=? and (-1,1)!=? and (-1,0)=1 and (-1,1)=2		%there is a pedestrian wanting to move in
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=1)	%case 1 in moving upward does not happen
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=0  	%case 2 in moving upward does not happen
				        and (1,-2)!=? and (1,-2)=1)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=2 		%case 3 in moving upward does not happen
					    and (2,0)!=? and (2,0)=50)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=0 		%case 4 in moving upward does not happen
						and (1,2)!=? and (1,2)=2 and (2,0)!=? and (2,0)=50)}

%	2.Pedestrian traveling right, and step to their right when moving into the same cell as another traveling right
rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=0 and (0,2)!=? and (0,2)=2 	%conflic for straight movement
				and (1,0)!=? and (1,0)=0									%the cell below is empty
				and (((1,-1)!=? and (1,-1)!=1) or (1,-1)=?)					%(1,-1) cannot be 1
				and (((1,1)!=? and (1,1)!=2) or (1,1)=?)					%(1,1) cannot be 2
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=1)	%case 1 in moving upward does not happen
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=0  	%case 2 in moving upward does not happen
				        and (2,-2)!=? and (2,-2)=1)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=2 		%case 3 in moving upward does not happen
					    and (3,0)!=? and (3,0)=50)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=0 		%case 4 in moving upward does not happen
						and (2,2)!=? and (2,2)=2 and (3,0)!=? and (3,0)=50)}
rule : 1 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (-1,0)!=? and (-1,1)!=? and (-1,2)!=? 					%there is a pedestrian wanting to move in
				and (-1,0)=1 and (-1,1)=0 and (-1,2)=2
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=1)	%case 1 in moving upward does not happen
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=0  	%case 2 in moving upward does not happen
				        and (1,-2)!=? and (1,-2)=1)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=2 		%case 3 in moving upward does not happen
					    and (2,0)!=? and (2,0)=50)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=0 		%case 4 in moving upward does not happen
						and (1,2)!=? and (1,2)=2 and (2,0)!=? and (2,0)=50)}
						
%	3.Pedestrian traveling left. They attempt to side step to their right when directly blocked, but find 
%	  the wall is to their right. Therefore they try to step to their left.	
rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=1 							%if pedestrian is blocked
				and (-1,0)!=? and (-1,0)=50 								%above row is the wall
				and (1,0)!=? and (1,0)=0									%cell below is empty
				and (((1,-1)!=? and (1,-1)!=1) or (1,-1)=?)					%(1,-1) cannot be 1 
				and (((1,1)!=? and (1,1)!=2) or (1,1)=?) 					%(1,1) cannot be 2
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=1)	%case 1 in moving upward does not happen
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=0  	%case 2 in moving upward does not happen
				        and (2,-2)!=? and (2,-2)=1)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=2 		%case 3 in moving upward does not happen
					    and (3,0)!=? and (3,0)=50)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=0 		%case 4 in moving upward does not happen
						and (2,2)!=? and (2,2)=2 and (3,0)!=? and (3,0)=50)}
rule : 2 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (-1,0)!=? and (-1,-1)!=? and (-1,0)=2 and (-1,-1)=1		%there is a pedestrian wanting to move in
				and (-2,0)!=? and (-2,0)=50									%2 rows above is the wall
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=1)	%case 1 in moving upward does not happen
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=0  	%case 2 in moving upward does not happen
				        and (1,-2)!=? and (1,-2)=1)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=2 		%case 3 in moving upward does not happen
					    and (2,0)!=? and (2,0)=50)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=0 		%case 4 in moving upward does not happen
						and (1,2)!=? and (1,2)=2 and (2,0)!=? and (2,0)=50)}

%	4.Pedestrian traveling left. They attempt to side step to their right when trying to move into the same cell 
%	  as pedestrian treveling left, but find the wall is to their right. Therefore they try to step to their left.
rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=0 and (0,-2)!=? and (0,-2)=1 %conflic for straight movement
				and (-1,0)!=? and (-1,0)=50 								%last row is the wall
				and (1,0)!=? and (1,0)=0 									%cell below is empty
				and (((1,-1)!=? and (1,-1)!=1) or (1,-1)=?) 				%(1,-1) cannot be 1
				and (((1,1)!=? and (1,1)!=2) or (1,1)=?) 					%(1,1) cannot be 2
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=1)	%case 1 in moving upward does not happen
				and NOT((2,0)!=? and (2,0)=2 and (2,-1)!=? and (2,-1)=0  	%case 2 in moving upward does not happen
				        and (2,-2)!=? and (2,-2)=1)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=2 		%case 3 in moving upward does not happen
					    and (3,0)!=? and (3,0)=50)
				and NOT((2,0)!=? and (2,0)=1 and (2,1)!=? and (2,1)=0 		%case 4 in moving upward does not happen
						and (2,2)!=? and (2,2)=2 and (3,0)!=? and (3,0)=50)}
rule : 2 100 {(0,0)=0 and (0,-1)!=1 and (0,1)!=2							%no straight move into the cell
				and (-1,0)!=? and (-1,-1)!=? and (-1,-2)!=? 				%there is a pedestrian wanting to move in
				and (-1,0)=2 and (-1,-1)=0 and (-1,-2)=1 
				and (-2,0)!=? and (-2,0)=50									%2 rows above is the wall
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=1)	%case 1 in moving upward does not happen
				and NOT((1,0)!=? and (1,0)=2 and (1,-1)!=? and (1,-1)=0  	%case 2 in moving upward does not happen
				        and (1,-2)!=? and (1,-2)=1)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=2 		%case 3 in moving upward does not happen
					    and (2,0)!=? and (2,0)=50)
				and NOT((1,0)!=? and (1,0)=1 and (1,1)!=? and (1,1)=0 		%case 4 in moving upward does not happen
						and (1,2)!=? and (1,2)=2 and (2,0)!=? and (2,0)=50)}									

%Default
rule : {(0,0)} 100  { t }


%----------Generator parameters-----------
[personGenLeft1]
distribution : poisson
mean : 1
variance : 1
deviation : 1

[personGenLeft2]
distribution : poisson
mean : 0.8
variance : 1
deviation : 1

[personGenLeft3]
distribution : poisson
mean : 1.1
variance : 1
deviation : 1

[personGenLeft4]
distribution : poisson
mean : 1.2
variance : 1
deviation : 1

[personGenLeft5]
distribution : poisson
mean : 0.9
variance : 1
deviation : 1

[personGenLeft6]
distribution : poisson
mean : 0.95
variance : 1
deviation : 1

[personGenRight6]
distribution : poisson
mean : 1.15
variance : 1
deviation : 1

[personGenRight5]
distribution : poisson
mean : 1
variance : 1
deviation : 1

[personGenRight4]
distribution : poisson
mean : 1.2
variance : 1
deviation : 1

[personGenRight3]
distribution : poisson
mean : 0.5
variance : 1
deviation : 1

[personGenRight2]
distribution : poisson
mean : 1.5
variance : 1
deviation : 1

[personGenRight1]
distribution : poisson
mean : 0.7
variance : 0.7
deviation : 0.7
