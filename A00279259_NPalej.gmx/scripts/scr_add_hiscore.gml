// scr_add_highscore(); // (No parameters)
// Returns the index number of the added score
// or -1 if nothing was added
var ndx = -1;

for(i=0; i<10; i+=1){
  if(score > ds_list_find_value(global.CH_hiscore_value,i)){
    ndx = i;
    break;
  }
}
if(ndx > -1){
/* 
   We have a new entry at ndx position
   We should be able to use a ds_list_insert here but for some reason
   Sudio inserts the name entry twice on occasions, which corrupts the data.
   Instead we will manually move all highscores down the list and add the
   new entry ourself - there are only 10 so it's no big deal
*/
  for(i=9; i>ndx; i-=1){
    ds_list_replace(global.CH_hiscore_name,i,ds_list_find_value(global.CH_hiscore_name,i-1));
   // ds_list_replace(global.CH_hiscore_extra,i,ds_list_find_value(global.CH_hiscore_extra,i-1));
    ds_list_replace(global.CH_hiscore_value,i,ds_list_find_value(global.CH_hiscore_value,i-1));
  }
  // Add our new entry to the ndx position
  ds_list_replace(global.CH_hiscore_name,ndx,"(Enter Name)");
 // ds_list_replace(global.CH_hiscore_extra,ndx,global.CH_extra_score);
  ds_list_replace(global.CH_hiscore_value,ndx,score);
}
return (ndx); // return the position