// scr_add_commas(value);
// adds commas to a value for display - e.g. scores
// returns a STRING value including commas
var strScore, places, rev , i, n;

if(!is_real(argument0)){
  strScore = argument0;
}else{
  strScore = string(argument0);
}
if(!global.CH_score_commas){return strScore;}

rev = "";
n = 1;
// Create a backward copy of the value adding commas
for(i=string_length(strScore); i>0 i-=1){
  rev += string_char_at(strScore,i);
  if(n mod(3) == 0 && n < string_length(strScore)){
    rev += ",";
  }
  n+=1;
}
strScore = "";
// Reverce the order - put it back
for(i=string_length(rev); i>0; i-=1) {
  strScore += string_char_at(rev,i);
}
return (strScore);