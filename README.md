# Red Damsel #
### Game Navigation ###
- Start menu. Press select to go to the brown instructions menu. Press start to go to the game.
- Press start from the game to go to the pause menu.
- Dpad to move, left shoulder to dodge/roll, A to attack.
- Get to the end of the path and enter the cave to win.
- Lose all lives to lose.
- Press start from win/lose to go back to start

### Finished: ###

1. Initial tileset
2. Tilemap with collision
3. Dummy player with animations
4. Player movement and attack
5. Sword with collision and animation
6. Enemies with player collision
7. Basic states
8. Most of ranged enemy art
9. Ranged enemy behavior
10. Some GUI
11. Font
12. Layering system(ish)

### To be added: ###
1. Finish enemy art
2. Melee enemy
3. Player art
4. Make level 1 better
5. Better win condition (why are we here? why are we killing snakes?) I'm thinking you get to the end and there's a cutscene or something simple. 
6. Hit effects
7. Destructible bushes
8. More levels
9. Plot
10. Cool menu art
11. The cheat I guess
12. I'm gonna organize it really good using OOP principles
13. myousik and suund
14. POLISH
15. POLISH
16. POLISH

### Bugs and problems and feedback ###
This milestone was kind of cooked because I was out friday-monday for a competition and I had no time so I literally did half of this on tuesday. Thanks for the grace period I guess. 
1. Enemy does not have move up animation
2. Instructions screen still MIA
3. Colliding with enemy instantly loses - need knockback and/or invincibility frames. I think I got halfway through adding a hit state before I got distracted and started working on something else
4. I was also trying to separate out player and enemy class-adjacent scripts for my own sanity but it seemed like so much stuff overlapped with each other (for instance enemy needs to know what player struct is but game includes enemy and player) and it wasn't working well so I gave up on that. Maybe after the OOP lecture.