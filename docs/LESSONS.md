# First Lessons

Each lesson should be small enough to finish in one sitting. Commit after each one.

## Lesson 1: Change Text

File: `src/main/java/com/northlight/academy/NorthlightAcademyMod.java`

Find:

```java
"Welcome to Northlight Academy!"
```

Change the message, run `gradlew runClient`, and try `/academy hello`.

You just changed a Java string.

## Lesson 2: Add A Quest

Find the `CODING_QUESTS` list.

Add another line inside the list. Remember that every line except the last one needs a comma.

You just changed a Java list.

## Lesson 3: Make A New Command

Copy the `/academy hello` command block and make a new command named `joke`, `secret`, or `mission`.

You just reused code and changed one part of it.

## Lesson 4: Make A Helper Method

Add a method like this:

```java
private static Component academyMessage(String message) {
	return Component.literal("[Academy] " + message);
}
```

Then use it in one command.

You just made a function.

## Lesson 5: Make A Rule

Change the quest command so it prints a different message when the random quest has the word `command` in it.

You just wrote a conditional.

## Lesson 6: Read An Error

Delete a semicolon, run the build, and read the compiler error. Then put the semicolon back.

You just practiced debugging.
