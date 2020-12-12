///scr_convert_unicode(code)
code = argument0;
switch(code) {
    case 37:
        return '<';
    case 38:
        return '^';
    case 39:
        return '>';
    case 40:
        return '\/';
    default:
        return string(chr(code));
}
