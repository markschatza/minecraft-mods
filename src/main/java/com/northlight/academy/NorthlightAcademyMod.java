package com.northlight.academy;

import static net.minecraft.commands.Commands.argument;
import static net.minecraft.commands.Commands.literal;

import java.io.InputStream;
import java.util.List;
import java.util.Random;

import net.fabricmc.api.ModInitializer;
import net.fabricmc.fabric.api.command.v2.CommandRegistrationCallback;
import net.minecraft.network.chat.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import static com.mojang.brigadier.arguments.StringArgumentType.word;
import static com.mojang.brigadier.arguments.StringArgumentType.getString;
import static com.mojang.brigadier.arguments.StringArgumentType.greedyString;
import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import net.fabricmc.loader.api.FabricLoader;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.entity.EquipmentSlotGroup;
import net.minecraft.world.entity.ai.attributes.AttributeModifier;
import net.minecraft.world.item.Item;
import net.minecraft.world.item.component.ItemAttributeModifiers;
import net.minecraft.world.entity.EquipmentSlotGroup;
import net.minecraft.world.entity.ai.attributes.AttributeModifier;
import net.minecraft.world.entity.ai.attributes.Attributes;
import net.minecraft.world.item.component.ItemAttributeModifiers;

public class NorthlightAcademyMod implements ModInitializer {
	public static final String MOD_ID = "northlight_academy";
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);
	public static final Item RUNE_BLADE = Registry.register(
			BuiltInRegistries.ITEM,
			ResourceLocation.fromNamespaceAndPath(MOD_ID, "rune_blade"),
			new Item(new Item.Properties().attributes(
		ItemAttributeModifiers.builder()
				.add(
						Attributes.ATTACK_DAMAGE,
						new AttributeModifier(
								ResourceLocation.fromNamespaceAndPath(MOD_ID, "rune_blade_damage"),
								8.0,
								AttributeModifier.Operation.ADD_VALUE
						),
						EquipmentSlotGroup.MAINHAND
				)
				.build()
))

	);
	private static final Random RANDOM = new Random();
 	public static final Path configPath = FabricLoader.getInstance()
        .getConfigDir()
        .resolve("config.yaml");

	private static final List<String> CODING_QUESTS = List.of(
			"Change one word in this message, then run the mod again.",
			"Add a fourth quest to the CODING_QUESTS list.",
			"Hello, it's me!", 
			"Make a new command by copying the /academy quest command.",
			"Find the LOGGER line and change what appears in the console."
	);
	public String  myString = "";

	@Override
	public void onInitialize() {
		LOGGER.info("Northlight Academy loaded. Type /academy quest in a world.");
		// load in config
		Yaml yaml = new Yaml();

		try (InputStream input = Files.newInputStream(configPath)) {
			Map<String, Object> data = yaml.load(input);

			myString = (String) data.get("myString");
		} catch (Exception e) {
			LOGGER.error("Failed to load config.yaml", e);
		}

		CommandRegistrationCallback.EVENT.register((dispatcher, registryAccess, environment) -> dispatcher.register(
				literal("academy")
						.then(literal("hello").executes(context -> {
							context.getSource().sendSuccess(() -> Component.literal("Welcome to Northlight Academy!"), false);
							return 1;
						}))
						.then(literal("quest").executes(context -> {
							String quest = randomQuest();
							context.getSource().sendSuccess(() -> Component.literal("Coding quest: " + quest), false);
							return 1;
						}))
						.then(literal("knock-knock").executes(context -> {
							context.getSource().sendSuccess(() -> Component.literal("Who's there?"), false);
							
							return 1;
						}))
						.then(literal("say")
							.then(argument("message", greedyString()).executes(context -> {
							String message = getString(context, "message");
							context.getSource().sendSuccess(() -> Component.literal(message), false);
							
							return 1;
						})))
						.then(literal("save")
							.then(argument("message", greedyString()).executes(context -> {
							myString = getString(context, "message");
							writeConfig(myString);
							context.getSource().sendSuccess(() -> Component.literal("Now saved: " + myString), false);
							
							return 1;
						})))
						.then(literal("123").executes(context -> {
							context.getSource().sendSuccess(() -> Component.literal("Loaded: " + myString), false);
							
							return 1;
						}))
		));
	}

	private static String randomQuest() {
		int index = RANDOM.nextInt(CODING_QUESTS.size());
		return CODING_QUESTS.get(index);
	}
	private static void writeConfig(String myString) {
		Yaml yaml = new Yaml();
		Map<String, Object> data = Map.of("myString", myString);

		try {
			yaml.dump(data, Files.newBufferedWriter(configPath));
		} catch (Exception e) {
			LOGGER.error("Failed to write to config.yaml", e);
		}
	}
}
