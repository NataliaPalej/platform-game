/*
    scr_text_input(index);
    First parameter is the ds index to update
    returns true if editing false when done.
*/
var code, def, key, char, count, value, update;

// Just return if no key was pressed to save time
if(keyboard_check(vk_nokey)) {return (true);}

update = argument0;     // ds list index
count = 20;             // max characters allowed
def = "No Name";        // default value if enter pressed
value = ds_list_find_value(global.CH_hiscore_name,update);
code = keyboard_lastkey;  // grab last key pressed code

if(code == vk_escape || code == vk_enter) {
  io_clear();
  if(string_pos(" ",value) > 0){
    char = string_replace_all(value," ",string(game_id));
    char = string_lettersdigits(char);
    value = string_replace_all(char,string(game_id)," ");
  }
  if(value == "Enter Name" || value == ""){
    ds_list_replace(global.CH_hiscore_name,update,def);
  }
  return (false); // Finished editing
}

if(code == vk_delete){ // delete all if default exists
  if(value == def){
    ds_list_replace(global.CH_hiscore_name,update,"");
  }
  io_clear();
  return (true); // exit but we are still editing
}

if(code == vk_backspace){ // delete last char
 char = string_copy(value,0,string_length(value)-1);
  ds_list_replace(global.CH_hiscore_name,update,char);
  io_clear()
  return (true); // exit but we still editing
}
// Check input is still less than the allowed length
if(string_length(value) >= count){
  return (true); // exit but we are still editing
}

key = ord(keyboard_lastchar);

if(string_pos("(",value) > 0 || string_pos(")",value) > 0){
  ds_list_replace(global.CH_hiscore_name,update,"");
  value = "";
  blink = 0;
}
//  Call Security to frisk the input
// (prevent illegal chars being entered)
if(key > 31 && key < 123){
  // Exclude non printable characters.
  if(key > 47 && key < 58 || key > 64 || key == 32){
    // Only add numbers, lower and upper letters plus space.
   str = "";
    if(value == def){
      ds_list_replace(global.CH_hiscore_name,update,"");
    }
    char = value+chr(key);
    ds_list_replace(global.CH_hiscore_name,update,char);
  }
}
io_clear();
return (true); // exit but we still editing