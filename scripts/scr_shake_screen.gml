///scr_shake_screen(shakeForce, shakeDur)
shakeForce = argument0;
shakeDur = argument1;

shakeDur--;
view_xview[0] += choose(-shakeForce,shakeForce);
view_yview[0] += choose(-shakeForce,shakeForce);
if(shakeDur <= 0){
    shake = false;
    shakeDur = shakeDurMax;
}
