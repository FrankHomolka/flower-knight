//scr_load_json_from_file

var filename = argument0;

var buffer = buffer_load(filename);
var textString = buffer_read(buffer, buffer_string);
buffer_delete(buffer);

var json = json_decode(textString);
return json;
