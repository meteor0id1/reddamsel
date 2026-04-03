# Red Damsel #
### Game Navigation ###
- Blue menu is the start menu. Press select to go to the brown instructions menu. Press start to go to the game.
- Press start from the game to go to the brown pause menu.
- Dpad to move, left shoulder to dodge/roll, A to attack.
- Hit enemy to win (dark brown screen). As soon as you hit it you win so it'll be a bit jarring.
- Get hit by enemy to lose (green screen)
- Press start from win/lose to go back to start

### Finished: ###
1. Initial tileset
2. Tilemap with collision
3. Dummy player with animations
4. Player movement and attack
5. Sword with collision and animation
6. Enemies with player collision
7. Basic states

### To be added: ###
1. Enemy behavior and attacks
2. Enemy art
3. Player art
4. Font and GUI
5. Fancy layering system (sprites? y sorting? tile finaggling?)
6. Hit effects
7. Destructible bushes
8. Actual level design
9. Plot
10. Cool menu art
11. The cheat I guess
12. I'm gonna organize it really good using OOP principles
13. myousik and suund
14. POLISH
15. POLISH
16. POLISH

### Bugs and problems and feedback ###
1. Thinking about adding a layer of parallax foliage on top of the map to give it more depth instead of trees. Don't know if that would work super well though since it would have to be opaque.
2. Movement feel good so far? I need to adjust the controls to let the player dodge/attack towards the end of the animation rather than wait until it's over, I thin that will feel better, but otherwise it works.
3. Planning to hook up a cool state machine for the enemies but I'm not sure how many options I have besides "move towards the player" because I'm not about to implement A* pathfinding no way Jose.
4. Otherwise I think I caught all the bugs but you let me know. You know what'd be cool? 8-directional movement. Yeah. How do I get more spritesheet space?
