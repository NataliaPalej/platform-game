// scr_hiscore_config(); (No parameters)
// Called to zero scores and set custom data
var extra, decimals, reset_score, def_value, fname;
score = 0;
                 // Initial default extra score value
reset_score = true;             // Resets score if true
fname = "Scores.dat";           // Filename to save scores as
global.CH_score_commas = true;  // use commas in score display

// Define high score headings - Change to suit your requirements
global.CH_header_name = "Name";

global.CH_header_score = "Score";

/*
        No need to edit below
  Perform some checks to avoid type missmatch errors
*/
global.CH_score_fname = working_directory+"/"+fname;

// Check for and remove old score data 
if(reset_score && file_exists(global.CH_score_fname)){
  file_delete(global.CH_score_fname);
}