///scr_convert_unicode(code)
code = argument0;
switch(code) {
    case 37:return '<';
    case 38:return '^';
    case 39:return '>';
    case 40:return '\/';
    case 9: return 'tab';
    case 160: return 'L-shift';
    case 162: return 'L-ctrl';
    case 164: return 'L-alt';
    case 192: return '`';
    case 32: return 'space';
    case 189: return '-';
    case 187: return '=';
    case 8: return 'del';
    case 219: return ']';
    case 221: return '[';
    case 220: return '\';
    case 186: return ';';
    case 222: return "'";
    case 13: return 'enter';
    case 188: return ',';
    case 190: return '.';
    case 191: return '/';
    case 161: return 'R-shift';
    case 165: return 'R-alt';
    case 163: return 'R-ctrl';
    default:
        return string(chr(code));
}
