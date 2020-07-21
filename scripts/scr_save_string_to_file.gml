//scr_save_string_to_file(fileName, textString)
var filename = argument0;
var textString = argument1;

var buffer = buffer_create(string_byte_length(textString)+1, buffer_fixed,1);
buffer_write(buffer, buffer_string, textString);
buffer_save(buffer, filename);
buffer_delete(buffer);
