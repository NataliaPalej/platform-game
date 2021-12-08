/*
   scr_hiscore_initialize();
   This script should be called once at the start of the game.
   You can use a game start event of an existing object in your
   game which you use to define any variables you need set just once.
*/
scr_hiscore_config(); // Configure custom settings
// Create our own high scores
global.CH_hiscore_name = ds_list_create();

global.CH_hiscore_value = ds_list_create();

// No need to edit below but feel free.
//if(file_exists(global.CH_score_fname)){
//  file_delete(global.CH_score_fname); // Used for testing to delete old scores
  // scr_hiscore_load(); // Load high scores - comment to disable.
//}
if(!file_exists(global.CH_score_fname)){
  for(i=0; i<10; i+=1){
    ds_list_add(global.CH_hiscore_name,"Player "+string(i+1));

    ds_list_add(global.CH_hiscore_value,1000-(100*i));
  }
  scr_hiscore_save(); // Save some default scores
}