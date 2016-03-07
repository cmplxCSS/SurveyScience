cd "/your/home/dir/".
get file "ZA3765.sav". 
save 

recode v60 (1,2=1)(3,6=2)(4,5=3) into v60_rec.
val lab v60_rec 1 "without graduation + Hauptschulabschluss" 2 "Mittlerereife and others" 3 "at least Fachhoschulreife".
var lab v60_rec "Graduation".

FREQUENCIES v236 v237 v238 v239 v240 v241 v242.

COMPUTE prof =(v236 + v237 + v240 + v243).
recode prof (4 thru 8 = 3) (9 thru 13 = 2) (14 thru 20 =1) into prof_rec.
val lab prof_rec 3 "often prof. use." 2 "average prof. use" 1 "little or no prof. use".
var lab prof_rec "professional use of the Internet".

COMPUTE unt =(v238 + v239 + v241 + v242).
recode unt (4 thru 8 = 3) (9 thru 13 = 2) (14 thru 20 =1) into unt_rec.
val lab unt_rec 3 "frequent use as entertainment medium" 2 "average use as entertainment medium" 1 "little or no use as entertainment medium".
var lab unt_rec "Use of the Internet for entertainment".

crosstabs tables = prof_rec unt_rec by v60_rec  by v55
/cells = count col
/stat = chi phi.

