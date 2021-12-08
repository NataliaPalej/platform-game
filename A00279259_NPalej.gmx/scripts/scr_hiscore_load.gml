// scr_hiscore_load(fname); // filename to save scores as
// Returns true if sucessful, false otherwise
var result, handle, data;

result = false;
if(file_exists(global.CH_score_fname)){
  handle = file_text_open_read(global.CH_score_fname);
  data = file_text_read_string(handle);
  ds_list_read(global.CH_hiscore_name,data);
  file_text_readln(handle);
  
  data = file_text_read_string(handle);
  ds_list_read(global.CH_hiscore_value,data);
  file_text_readln(handle);
  file_text_close(handle);
  result = true;
}
file_find_close();
return (result);