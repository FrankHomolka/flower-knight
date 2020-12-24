//scr_set_player_variables

/* Movement Vars */
moveSpeedStart = 0.3;
moveSpeedCounter = moveSpeedStart;
alteredMoveSpeed = 1;
baseMoveSpeed = 1;
moveSpeed = baseMoveSpeed;
speedAltered = false;
move_x = 0;
move_y = 0;

/* Animations & sprites */
sprite = spr_player_right;
hitSprite = spr_player_down;
deathSprite = spr_player_death;
lightSize = 300;
drawSelf = true;

/* Sounds */
deathSound = snd_player_death;
hurtSound = snd_player_hurt;

/* Basic attack vars */
isAttacking = false;
spawnedAttack = false;
attackDistance = 10;
basicAttackLength = 7;
basicAttackCounter = basicAttackLength;
if(global.difficulty == 'HARD') {
    attackDamage = 10;
} else {
    attackDamage = 25;
}
hitDamage = 0;
knockbackMultiplier = 1;

/* Player States */
enum states {
    idle,
    walk,
    attack,
    hit,
    death,
    dash,
    inactive,
    attack2,
    attack3,
    chooseAttack,
    stunned,
    pit
}

/* Initial state */
state = states.idle;
depth = -y;
tryHit = false;
hit = false;
if(global.difficulty == 'HARD') {
    maxHp = 100;
} else {
    maxHp = 400;
}
hp = maxHp;
dead = false;

/* Direction Facing */
enum facing {
    upLeft,
    up,
    upRight,
    right,
    downRight,
    down,
    downLeft,
    left
}

direction_facing = facing.right;

/* Animation Speed */
walkAnimationSpeed = 0.15;
idleAnimationSpeed = 0.05;

/* Hit Vars */
flashTime = 20;
flashCounter = flashTime;
damageSource = noone;
shakeForce = 3;
shakeDurMax = 10;
shakeDur = shakeDurMax;
shake = false;

/* Dash Vars */
isDashing = false;
dashTime = 3.5;
dashCounter = dashTime;

/* Particles */
scr_player_walk_particle();

/* Other */
enemiesKilled = 0;
goToNextRoom = false;
godMode = false;
color = make_colour_hsv(23,173,236);
drawColor = c_white;
critChance = 10;
previousState = states.idle;
pitLagTime = 2;
pitLagCounter = pitLagTime;

/* Focus vars */
ignorePit = false;
canParry = false;
spawnBigHeartChance = 0;
heartSpawnChance = 0.2;
