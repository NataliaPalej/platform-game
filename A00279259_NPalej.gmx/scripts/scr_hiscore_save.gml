// scr_hiscore_save(); // no parameters, no return value.
var handle, data;

if(file_exists(global.CH_score_fname)){
  file_delete(global.CH_score_fname); // remove old scores
}
data = ds_list_write(global.CH_hiscore_name)+chr(13)+chr(10);

data += ds_list_write(global.CH_hiscore_value)+chr(13)+chr(10);
handle = file_text_open_write(global.CH_score_fname);
file_text_write_string(handle,data);
file_text_close(handle);
file_find_close();
scr_hiscore_config();         // Resets