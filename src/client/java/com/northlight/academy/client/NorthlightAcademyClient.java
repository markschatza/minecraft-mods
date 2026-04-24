package com.northlight.academy.client;

import net.fabricmc.api.ClientModInitializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NorthlightAcademyClient implements ClientModInitializer {
	private static final Logger LOGGER = LoggerFactory.getLogger("northlight_academy");

	@Override
	public void onInitializeClient() {
		LOGGER.info("Northlight Academy client loaded.");
	}
}
