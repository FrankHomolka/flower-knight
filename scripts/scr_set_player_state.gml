//scr_set_player_state

drawSelf = true;

/* Walk Idle State */
if(left || right || up || down) {
    state = states.walk;
} else {
    state = states.idle;
}

/* Attack state */
if(attack) {
    if(!isAttacking) {
        for(i = 0; i < ds_list_size(obj_focus_controller.playerAttackFocusList); i++) {
            var item = obj_focus_controller.playerAttackFocusList[| i];
            script_execute(item[? 'effectScript']);
        }
    }
    isAttacking = true;
}

if(isAttacking) {
    state = states.attack;
}

/* Dash State */
if(dodge && state != states.attack && state != states.idle && (move_x != 0 || move_y != 0)) {
    if(!isDashing) {
        for(i = 0; i < ds_list_size(obj_focus_controller.playerDashFocusList); i++) {
            var item = obj_focus_controller.playerDashFocusList[| i];
            script_execute(item[? 'effectScript']);
        }
    }
    isDashing = true;
}

if(isDashing) {
    state = states.dash;
}

/* Hit State */
if(tryHit) {
    if(state != states.dash && !hit) {
        for(i = 0; i < ds_list_size(obj_focus_controller.playerHitFocusList); i++) {
            var item = obj_focus_controller.playerHitFocusList[| i];
            script_execute(item[? 'effectScript']);
        }
        if(instance_exists(obj_quest_controller)) {
            obj_quest_controller.playerHit = true;
        }
        hit = true;
        shake = true;
        currentHp = hp;
    } else {
        damageSource = false;
        if(tryHit && instance_exists(obj_quest_controller)) obj_quest_controller.attacksDodged++;
        tryHit = false;
    }
}

if(hit) {
    state = states.hit;
}

/* Death State */
if(hp <= 0) {
    state = states.death;
}

scr_check_pit();

if(room == rm_game_start || room == rm_win || room == rm_quest) {
    state = states.inactive;
}

if(room == rm_shop ) {
    if(obj_shop_controller.activated)
        state = states.idle;
}

if(room == rm_procedural && instance_exists(obj_dungeon_shop))
    if(obj_dungeon_shop.activated)
        state = states.idle;

/* Execute State */
switch(state) {
    case states.walk: scr_player_walk_state(); break;
    case states.attack: scr_player_attack_state(); break;
    case states.dash: scr_player_dash_state(); break;
    case states.idle: scr_player_idle_state(); break;
    case states.hit: scr_player_hit_state(); break;
    case states.death: scr_player_death_state(); break;
    case states.inactive: scr_player_inactive_state(); break;
    case states.pit: scr_player_pit_state(); break;
}
