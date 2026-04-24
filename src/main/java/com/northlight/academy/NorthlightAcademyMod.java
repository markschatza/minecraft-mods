package com.northlight.academy;

import static net.minecraft.server.command.CommandManager.literal;

import java.util.List;
import java.util.Random;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.minecraft.text.Text;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NorthlightAcademyMod implements ModInitializer {
	public static final String MOD_ID = "northlight_academy";
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

	private static final Random RANDOM = new Random();

	private static final List<String> CODING_QUESTS = List.of(
			"Change one word in this message, then run the mod again.",
			"Add a fourth quest to the CODING_QUESTS list.",
			"Make a new command by copying the /academy quest command.",
			"Find the LOGGER line and change what appears in the console."
	);

	@Override
	public void onInitialize() {
		LOGGER.info("Northlight Academy loaded. Type /academy quest in a world.");

		CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> dispatcher.register(
				literal("academy")
						.then(literal("hello").executes(context -> {
							context.getSource().sendFeedback(() -> Text.literal("Welcome to Northlight Academy!"), false);
							return 1;
						}))
						.then(literal("quest").executes(context -> {
							String quest = randomQuest();
							context.getSource().sendFeedback(() -> Text.literal("Coding quest: " + quest), false);
							return 1;
						}))
		));
	}

	private static String randomQuest() {
		int index = RANDOM.nextInt(CODING_QUESTS.size());
		return CODING_QUESTS.get(index);
	}
}
