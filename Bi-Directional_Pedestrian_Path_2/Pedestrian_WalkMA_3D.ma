[top]
components : PedestrianWalk
components : personGenLeft1@generator personGenLeft2@generator personGenLeft3@generator
components : personGenLeft4@generator personGenLeft5@generator personGenLeft6@generator
components : personGenRight1@generator personGenRight2@generator personGenRight3@generator
components : personGenRight4@generator personGenRight5@generator personGenRight6@generator


link : out@personGenLeft1 entranceBottomLeft1@PedestrianWalk
link : out@personGenLeft2 entranceBottomLeft2@PedestrianWalk
link : out@personGenLeft3 entranceBottomLeft3@PedestrianWalk
link : out@personGenLeft4 entranceBottomLeft4@PedestrianWalk
link : out@personGenLeft5 entranceBottomLeft5@PedestrianWalk
link : out@personGenLeft6 entranceBottomLeft6@PedestrianWalk

link : out@personGenRight1 entranceBottomRight1@PedestrianWalk
link : out@personGenRight2 entranceBottomRight2@PedestrianWalk
link : out@personGenRight3 entranceBottomRight3@PedestrianWalk
link : out@personGenRight4 entranceBottomRight4@PedestrianWalk
link : out@personGenRight5 entranceBottomRight5@PedestrianWalk
link : out@personGenRight6 entranceBottomRight6@PedestrianWalk

[PedestrianWalk]
type : cell
dim : (8,20,2)
delay : transport
defaultDelayTime : 100
border : nonwrapped

neighbors : 												PedestrianWalk(-2,0,0)
neighbors : PedestrianWalk(-1,-2,0)	PedestrianWalk(-1,-1,0)	PedestrianWalk(-1,0,0) 	PedestrianWalk(-1,1,0)	PedestrianWalk(-1,2,0)
neighbors : PedestrianWalk(0,-2,0)	PedestrianWalk(0,-1,0) 	PedestrianWalk(0,0,0) 	PedestrianWalk(0,1,0)	PedestrianWalk(0,2,0)
neighbors : PedestrianWalk(1,-2,0)	PedestrianWalk(1,-1,0) 	PedestrianWalk(1,0,0) 	PedestrianWalk(1,1,0)	PedestrianWalk(1,2,0)
neighbors : 												PedestrianWalk(2,0,0)

neighbors : 												PedestrianWalk(-2,0,1)
neighbors : PedestrianWalk(-1,-2,1)	PedestrianWalk(-1,-1,1)	PedestrianWalk(-1,0,1) 	PedestrianWalk(-1,1,1)	PedestrianWalk(-1,2,1)
neighbors : PedestrianWalk(0,-2,1)	PedestrianWalk(0,-1,1) 	PedestrianWalk(0,0,1) 	PedestrianWalk(0,1,1)	PedestrianWalk(0,2,1)
neighbors : PedestrianWalk(1,-2,1)	PedestrianWalk(1,-1,1) 	PedestrianWalk(1,0,1) 	PedestrianWalk(1,1,1)	PedestrianWalk(1,2,1)
neighbors : 												PedestrianWalk(2,0,1)

initialValue : 0
initialCellsValue : fringe.val
localtransition : rules 

in : entranceBottomRight1	entranceBottomRight2	entranceBottomRight3
in : entranceBottomRight4	entranceBottomRight5	entranceBottomRight6
in : entranceBottomLeft1	entranceBottomLeft2		entranceBottomLeft3
in : entranceBottomLeft4	entranceBottomLeft5		entranceBottomLeft6

link : entranceBottomRight1 entranceBottomRight1@PedestrianWalk(1,19,0)
link : entranceBottomRight2 entranceBottomRight2@PedestrianWalk(2,19,0)
link : entranceBottomRight3 entranceBottomRight3@PedestrianWalk(3,19,0)
link : entranceBottomRight4 entranceBottomRight4@PedestrianWalk(4,19,0)
link : entranceBottomRight5 entranceBottomRight5@PedestrianWalk(5,19,0)
link : entranceBottomRight6 entranceBottomRight6@PedestrianWalk(6,19,0)

link : entranceBottomLeft1 entranceBottomLeft1@PedestrianWalk(1,0,0)
link : entranceBottomLeft2 entranceBottomLeft2@PedestrianWalk(2,0,0)
link : entranceBottomLeft3 entranceBottomLeft3@PedestrianWalk(3,0,0)
link : entranceBottomLeft4 entranceBottomLeft4@PedestrianWalk(4,0,0)
link : entranceBottomLeft5 entranceBottomLeft5@PedestrianWalk(5,0,0)
link : entranceBottomLeft6 entranceBottomLeft6@PedestrianWalk(6,0,0)

portInTransition : entranceBottomLeft1@PedestrianWalk(1,0,0) left-entrance-rule
portInTransition : entranceBottomLeft2@PedestrianWalk(2,0,0) left-entrance-rule
portInTransition : entranceBottomLeft3@PedestrianWalk(3,0,0) left-entrance-rule
portInTransition : entranceBottomLeft4@PedestrianWalk(4,0,0) left-entrance-rule
portInTransition : entranceBottomLeft5@PedestrianWalk(5,0,0) left-entrance-rule
portInTransition : entranceBottomLeft6@PedestrianWalk(6,0,0) left-entrance-rule

portInTransition : entranceBottomRight1@PedestrianWalk(1,19,0) right-entrance-rule
portInTransition : entranceBottomRight2@PedestrianWalk(2,19,0) right-entrance-rule
portInTransition : entranceBottomRight3@PedestrianWalk(3,19,0) right-entrance-rule
portInTransition : entranceBottomRight4@PedestrianWalk(4,19,0) right-entrance-rule
portInTransition : entranceBottomRight5@PedestrianWalk(5,19,0) right-entrance-rule
portInTransition : entranceBottomRight6@PedestrianWalk(6,19,0) right-entrance-rule


[right-entrance-rule]
%Assign a value of 2 to the pedestrians who are walking towards left
rule : 2 100 {portvalue(ThisPort)>0 and (0,-1,0)!=1 and ( (0,0,0)=0 or ((0,0,0)=1 and cellpos(1)=19) )}
rule : {(0,0,0)} 100 {t}

[left-entrance-rule]
%Assigning a value of 1 to the pedestrians who are walking towards right
rule : 1 100 {portvalue(ThisPort)>0 and (0,1,0)!=2 and ( (0,0,0)=0 or ((0,0,0)=2 and cellpos(1)=0) )}
rule : {(0,0,0)} 100 {t}


[rules]
%Exit rules
rule : 0 100 {(0,0,0)=1 and (0,1,0)=? and (0,2,0)=?}
rule : 0 100 {(0,0,0)=2 and (0,-1,0)=? and (0,-2,0)=?}

%Straight movement - Highest priority
rule : 0 100 {(0,0,0)=1 and (0,1,0)!=? and (0,1,0)=0 and (((0,2,0)!=? and (0,2,0)!=2) or (0,2,0)=?)} 
rule : 1 100 {(0,0,0)=0 and (0,-1,0)=1 and (0,1,0)!=2}
rule : 0 100 {(0,0,0)=2 and (0,-1,0)!=? and (0,-1,0)=0 and (((0,-2,0)!=? and (0,-2,0)!=1) or (0,-2,0)=?)}
rule : 2 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)=2}

%Side stepping to the right when the pedestrian is blocked - Second highest priority
%First try to step to the right of the pedestrian
rule : 0 100 {(0,0,0)=1 and (0,1,0)!=? and (0,1,0)=2 								%if pedestrian is blocked
				and (1,0,0)!=? and (1,0,0)=0 									%next row needs not to be the wall
				and (((1,-1,0)!=? and (1,-1,0)!=1) or (1,-1,0)=?)					%(1,-1,0) cannot be 1
				and (((1,1,0)!=? and (1,1,0)!=2) or (1,1,0)=?)}					%(1,1,0) cannot be 2
rule : 1 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move to the cell
				and (-1,0,0)!=? and (-1,1,0)!=? and (-1,0,0)=1 and (-1,1,0)=2}		%above row needs not to be the wall
				 

rule : 0 100 {(0,0,0)=2 and (0,-1,0)!=? and (0,-1,0)=1 							%if pedestrian is blocked
				and (-1,0,0)!=? and (-1,0,0)=0									%last row needs not to be the wall
				and (((-1,-1,0)!=? and (-1,-1,0)!=1) or (-1,-1,0)=?)				%(-1,-1) cannot be 1
				and (((-1,1,0)!=? and (-1,1,0)!=2) or (-1,1,0)=?)}				%(-1,1) cannot be 2	
rule : 2 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (1,0,0)!=? and (1,-1,0)!=? and (1,0,0)=2	and (1,-1,0)=1}		%above row needs not to be the wall

%If the right side of the pedestrian is the wall, step left
rule : 0 100 {(0,0,0)=1 and (0,1,0)!=? and (0,1,0)=2 								%if pedestrian is blocked
				and (1,0,0)!=? and (1,0,0)=50 									%next row is the wall 
				and (-1,0,0)!=? and (-1,0,0)=0 									%cell above is empty				
				and (((-1,-1,0)!=? and (-1,-1,0)!=1) or (-1,-1,0)=?)				%(-1,-1) cannot be 1 
				and (((-1,1,0)!=? and (-1,1,0)!=2) or (-1,1,0)=?)} 				%(-1,1) cannot be 2
rule : 1 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (1,0,0)!=? and (1,1,0)!=? and (1,0,0)=1 and (1,1,0)=2			%the row below needs not to be the wall
				and (2,0,0)!=? and (2,0,0)=50}									%2 rows below is the wall

rule : 0 100 {(0,0,0)=2 and (0,-1,0)!=? and (0,-1,0)=1 							%if pedestrian is blocked
				and (-1,0,0)!=? and (-1,0,0)=50 								%above row is the wall
				and (1,0,0)!=? and (1,0,0)=0									%cell below is empty
				and (((1,-1,0)!=? and (1,-1,0)!=1) or (1,-1,0)=?)					%(1,-1) cannot be 1 
				and (((1,1,0)!=? and (1,1,0)!=2) or (1,1,0)=?)} 					%(1,1) cannot be 2
rule : 2 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (-1,0,0)!=? and (-1,-1,0)!=? and (-1,0,0)=2 and (-1,-1,0)=1		%above row needs not to be the wall
				and (-2,0,0)!=? and (-2,0,0)=50}								%2 rows above is the wall

				
%Then try to step to the left of the pedestrian
%rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=2 								%if pedestrian is blocked
%				and (-1,0)!=? and (-1,-1)!=? and (-1,1)!=? and (-1,0)!=50 	%next row needs not to be the wall
%				and (-1,0)=0 and (-1,-1)!=1 and (-1,1)!=2} 					%no straight move to the spot
%rule : 1 100 {(0,0)=0 and (1,0)!=? and (1,1)!=? and (1,0)!=50				%above row needs not to be the wall
%				and (1,0)=1 and (1,1)=2 and (0,-1)!=1 and (0,1)!=2}

%rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=1 							%if pedestrian is blocked
%				and (1,0)!=? and (1,-1)!=? and (1,1)!=? and (1,0)!=50 		%last row needs not to be the wall
%				and (1,0)=0 and (1,-1)!=1 and (1,1)!=2} 					%no straight move to the spot
%rule : 2 100 {(0,0)=0 and (-1,0)!=? and (-1,-1)!=? and (-1,0)!=50			%above row needs not to be the wall
%				and (-1,0)=2 and (-1,-1)=1 and (0,-1)!=1 and (0,1)!=2}


%Side stepping when heading to the same cell head to head - Third highest priority
%First try to step to the right of the pedestrian
rule : 0 100 {(0,0,0)=1 and (0,1,0)!=? and (0,1,0)=0 and (0,2,0)!=? and (0,2,0)=2 	%conflic for straight movement
				and (1,0,0)!=? and (1,0,0)=0									%the cell below is empty
				and (((1,-1,0)!=? and (1,-1,0)!=1) or (1,-1,0)=?)					%(1,-1) cannot be 1
				and (((1,1,0)!=? and (1,1,0)!=2) or (1,1,0)=?)}					%(1,1) cannot be 2
rule : 1 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (-1,0,0)!=? and (-1,1,0)!=? and (-1,2,0)!=? 					%next row needs not to be the wall
				and (-1,0,0)=1 and (-1,1,0)=0 and (-1,2,0)=2}									
				
rule : 0 100 {(0,0,0)=2 and (0,-1,0)!=? and (0,-1,0)=0 and (0,-2,0)!=? and (0,-2,0)=1 %conflic for straight movement
				and (-1,0,0)!=? and (-1,0,0)=0									%the cell above is empty
				and (((-1,-1,0)!=? and (-1,-1,0)!=1) or (-1,-1,0)=?)				%(-1,-1) cannot be 1
				and (((-1,1,0)!=? and (-1,1,0)!=2) or (-1,1,0)=?)}				%(-1,1) cannot be 2
rule : 2 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (1,0,0)!=? and (1,-1,0)!=? and (1,-2,0)!=? 					%next row needs not to be the wall
				and (1,0,0)=2 and (1,-1,0)=0 and (1,-2,0)=1}									

%If right side is the wall, then step left
rule : 0 100 {(0,0,0)=1 and (0,1,0)!=? and (0,1,0)=0 and (0,2,0)!=? and (0,2,0)=2 	%conflic for straight movement
				and (1,0,0)!=? and (1,0,0)=50 									%row below is the wall
				and (-1,0,0)!=? and (-1,0,0)=0 									%cell above is empty
				and (((-1,-1,0)!=? and (-1,-1,0)!=1) or (-1,-1,0)=?)				%(-1,-1) cannot be 1
				and (((-1,1,0)!=? and (-1,1,0)!=2) or (-1,1,0)=?)} 				%(-1,1) cannot be 2
rule : 1 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (1,0,0)!=? and (1,1,0)!=? and (1,2,0)!=? 						%next row needs not to be the wall
				and (1,0,0)=1 and (1,1,0)=0 and (1,2,0)=2 
				and (2,0,0)!=? and (2,0,0)=50}									%2 rows below is the wall									
				
rule : 0 100 {(0,0,0)=2 and (0,-1,0)!=? and (0,-1,0)=0 and (0,-2,0)!=? and (0,-2,0)=1 %conflic for straight movement
				and (-1,0,0)!=? and (-1,0,0)=50 								%last row is the wall
				and (1,0,0)!=? and (1,0,0)=0 									%cell below is empty
				and (((1,-1,0)!=? and (1,-1,0)!=1) or (1,-1,0)=?) 				%(1,-1) cannot be 1
				and (((1,1,0)!=? and (1,1,0)!=2) or (1,1,0)=?)} 					%(1,1) cannot be 2
rule : 2 100 {(0,0,0)=0 and (0,-1,0)!=1 and (0,1,0)!=2							%no straight move into the cell
				and (-1,0,0)!=? and (-1,-1,0)!=? and (-1,-2,0)!=? 				%last row needs not to be the wall
				and (-1,0,0)=2 and (-1,-1,0)=0 and (-1,-2,0)=1 
				and (-2,0,0)!=? and (-2,0,0)=50}								%2 rows above is the wall									

%Then try to step to the left of the pedestrian
%rule : 0 100 {(0,0)=1 and (0,1)!=? and (0,1)=0 and (0,2)!=? and (0,2)=2 	%conflic for straight movement
%				and (-1,0)!=? and (-1,-1)!=? and (-1,1)!=? and (-1,0)!=50 	%last row needs not to be the wall
%				and (-1,0)=0 and (-1,-1)!=1 and (-1,1)!=2} 					%no straight move to the spot
%rule : 1 100 {(0,0)=0 and (1,0)!=? and (1,1)!=? and (1,2)!=? and (1,0)!=50	%next row needs not to be the wall
%				and (1,0)=1 and (1,1)=0 and (1,2)=2
%				and (0,-1)!=1 and (0,1)!=2}									%no straight move into the spot
%				
%rule : 0 100 {(0,0)=2 and (0,-1)!=? and (0,-1)=0 and (0,-2)!=? and (0,-2)=1 %conflic for straight movement
%				and (1,0)!=? and (1,-1)!=? and (1,1)!=? and (1,0)!=50 		%last row needs not to be the wall
%				and (1,0)=0 and (1,-1)!=1 and (1,1)!=2} 					%no straight move to the spot
%rule : 2 100 {(0,0)=0 and (-1,0)!=? and (-1,-1)!=? and (-1,-2)!=? 			%next row needs not to be the wall
%				and (-1,0)!=50 and (-1,0)=2 and (-1,-1)=0 and (-1,-2)=1
%				and (0,-1)!=1 and (0,1)!=2}									%no straight move into the spot

%Default
rule : {(0,0,0)} 100  { t }


%testing
rule : 2 100 {(cellPos(2)=1 and (0,1,0)=30)}


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
