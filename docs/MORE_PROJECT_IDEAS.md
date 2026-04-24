# Minecraft Modding Starter Project Plan

## Working Workflow for Every Feature

1. **Name the feature**
   - Example: `Copper Jetpack`

2. **Add the smallest visible thing**
   - Add item/block/entity registration.
   - Confirm it appears in creative inventory.

3. **Add placeholder asset**
   - Simple 16x16 texture.
   - Do not perfect the art yet.

4. **Add localization**
   - `item.modid.copper_jetpack = Copper Jetpack`

5. **Add recipe**
   - JSON crafting recipe.
   - Test survival crafting.

6. **Add one behavior**
   - Keep it tiny.
   - Example: right-click gives slow falling for 3 seconds.

7. **Test in game**
   - One change, one launch, one test.

8. **Commit**
   - Commit message: `Add copper jetpack item`

9. **Improve behavior**
   - Add cooldown, durability, particles, sound, armor slot, fuel, etc.

10. **Refactor only after it works**
   - Clean names, split classes, improve comments.

---

# Project 1: Copper Jetpack

## Final Goal
A craftable back-slot or chest-slot jetpack that lets the player boost upward or reduce falling when holding jump.

## Tiny Steps

1. Add `Copper Jetpack` item.
2. Add placeholder jetpack texture.
3. Add item name in language file.
4. Add crafting recipe using copper ingots, redstone, and furnace/blast furnace.
5. Make right-click give `Slow Falling` for 5 seconds.
6. Add cooldown after use.
7. Make it lose durability when used.
8. Make it work only when equipped in chest slot.
9. Detect jump/space input while equipped.
10. Apply small upward velocity while jump is held.
11. Add fuel using coal/redstone.
12. Add smoke particles.
13. Add sound effect.
14. Add tooltip: `Hold jump to boost upward.`
15. Balance: max flight time, cooldown, durability cost.

## Good Learning Topics
- Items
- Textures
- Recipes
- Status effects
- Equipment slots
- Player velocity
- Durability
- Cooldowns

---

# Project 2: Glow Boots

## Final Goal
Boots that light up dark areas and give a small speed boost at night.

## Tiny Steps

1. Add `Glow Boots` item.
2. Add boot texture.
3. Add language entry.
4. Add crafting recipe using leather boots, glowstone dust, and copper.
5. Make right-click give `Speed I` for 10 seconds.
6. Add durability loss when activated.
7. Make the effect happen only when worn.
8. Check world light level around player.
9. If light level is low, give small speed boost.
10. Add glowing particles at player feet.
11. Add tooltip: `Shines brighter in the dark.`
12. Balance speed, durability, and recipe cost.

## Good Learning Topics
- Armor
- Light levels
- Conditional logic
- Status effects
- Particles
- Game balance

---

# Project 3: Pocket Bridge Builder

## Final Goal
A tool that places temporary blocks in front of the player to help cross gaps.

## Tiny Steps

1. Add `Pocket Bridge Builder` item.
2. Add placeholder texture.
3. Add language entry.
4. Add crafting recipe using planks, iron, and redstone.
5. On right-click, place one dirt block in front of player.
6. Change dirt to custom temporary bridge block.
7. Prevent placing inside the player.
8. Place 3 blocks in a line.
9. Add cooldown.
10. Make blocks disappear after 10 seconds.
11. Add durability cost per use.
12. Add particles when blocks disappear.
13. Add tooltip: `Creates a short temporary bridge.`
14. Balance length, cooldown, and durability.

## Good Learning Topics
- Raycasting / player direction
- Block placement
- Custom blocks
- Timers
- Safety checks
- World interaction

---

# Project 4: Snack Wand

## Final Goal
A magic food tool that consumes durability to feed the player or nearby animals.

## Tiny Steps

1. Add `Snack Wand` item.
2. Add texture.
3. Add language entry.
4. Add recipe using stick, bread, and gold nugget.
5. On right-click, restore 1 hunger.
6. Add cooldown.
7. Add durability loss.
8. Prevent use when hunger is full.
9. Add particles around player.
10. Add sound effect.
11. Feed nearby animals within 5 blocks.
12. Make animals enter breeding mode if valid.
13. Add tooltip: `Right-click to snack. Animals like it too.`
14. Balance durability and recipe cost.

## Good Learning Topics
- Player hunger
- Entity searching
- Cooldowns
- Durability
- Animal behavior
- Area effects

---

# Project 5: Weather Compass

## Final Goal
A craftable item that predicts or changes weather with limited uses.

## Tiny Steps

1. Add `Weather Compass` item.
2. Add texture.
3. Add language entry.
4. Add recipe using compass, amethyst, copper, and glass.
5. Right-click prints current weather in chat.
6. Add tooltip.
7. Add alternate behavior: sneaking + right-click clears rain.
8. Add cooldown.
9. Add durability loss.
10. Require lapis or amethyst as fuel.
11. Add particles when weather changes.
12. Add sound effect.
13. Add advancement for first use.
14. Balance so weather-changing feels special.

## Good Learning Topics
- Chat messages
- World state
- Sneak/right-click behavior
- Durability
- Fuel checks
- Advancements

---

# Suggested Session Format

## Each Coding Session

1. Pick one tiny step.
2. Predict what file needs to change.
3. Ask the LLM for a hint, not the full answer.
4. Make the edit manually.
5. Run Minecraft.
6. Test the result.
7. Fix one bug if needed.
8. Commit the working change.
9. Write one sentence in `MOD_JOURNAL.md`.

## Good LLM Prompts

- `Explain this file like I'm in middle school.`
- `What is the smallest next change to make this item visible in game?`
- `Give me a hint, but don't write the full code.`
- `Explain this error message.`
- `What should I test in Minecraft after this change?`
- `Review this diff and tell me if anything looks risky.`
- `Give me three possible next features, ranked easiest to hardest.`

## Rule of Thumb

The LLM may generate examples, but the learner should always make at least one intentional change and explain what it does before the feature counts as done.