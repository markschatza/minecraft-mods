# Rune Plan

## Core Idea

The player enters a rune world where normal tools and materials do not work well. Most blocks break immediately, and the player can only build a small base using specific allowed materials.

The main loop is:

1. Enter the rune world.
2. Fight rune-powered mobs.
3. Collect rune drops.
4. Upgrade and repair rune weapons.
5. Use a fully upgraded rune sword to unlock the boss room.
6. Defeat the rune boss.
7. Farm the boss for the rune bow.
8. Return to the rune world to collect runes for repairs and arrows.

## Rune World

- Create a small bubble-style area in the Overworld first.
- Treat this as a simple starter version of the rune dimension.
- Later, turn it into a real custom dimension if the project is ready for that.

## Rune Items

### Rune Sword

- Low durability.
- High damage.
- Can hurt rune mobs.
- Required to hurt the rune boss.
- Can be repaired at an anvil using rune mob drops.
- Has good and bad versions.
- Bad versions hurt the player while fighting mobs
- Disappears if it touches water.

### Rune Bow

- Similar to the rune sword.
- Requires special rune arrows.
- Has good and bad versions.

### Rune Arrows

- Crafted with XP and runes.
- Deal damage over time.
- Disappear after being shot, even if they miss.
- Have good and bad versions.

### Runes

- Dropped by rune mobs.
- Have good and bad versions.
- Good runes repair good rune items.
- Bad runes repair bad rune items.
- Used with an anvil to repair rune gear.
- Used to craft rune arrows.

## Rune Mobs

Rune mobs are normal Minecraft mobs powered up by runes.

### Easy Mobs

- Zombie
- Skeleton
- Creeper
- Spider

### Medium Mobs

- Witch
- Pillager
- Ravager
- Piglin

### Hard Mobs

- Warden
- Wither
- Enderman

## Rune Boss

The boss is a corrupted player that fights with a sword and bow.

### Boss Room

- The boss room is locked behind a door.
- The door can only be opened with a fully upgraded rune sword.

### Boss Versions

- Good bow version.
- Bad bow version.

### Boss Mechanics

- The arena has small puddles of water.
- The boss attacks like a player.
- The boss respawns after being defeated.

### Boss Drops

- Rune bow.

## Implementation Plan

Build this in small steps:

1. Add one basic rune item.
2. Add good and bad rune items.
3. Add the rune sword.
4. Add sword durability behavior.
5. Add rune drops.
6. Add anvil repair behavior.
7. Add sword upgrades.
8. Add rune arrows.
9. Add the rune bow.
10. Add a simple rune world bubble in the Overworld.
11. Add easy rune mobs.
12. Add medium rune mobs.
13. Add hard rune mobs.
14. Add the boss room door.
15. Add the rune boss.
16. Add boss drops.

## Future Plans

- Make a real rune dimension.
- Add more bosses.
