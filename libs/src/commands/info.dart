import 'dart:io';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

String getCurrentMemoryString() {
  final current = (ProcessInfo.currentRss / 1024 / 1024).toStringAsFixed(2);
  final rss = (ProcessInfo.maxRss / 1024 / 1024).toStringAsFixed(2);
  return '$current/$rss MB';
}

ChatCommand info = ChatCommand("info", "Info about aparatus",
  id("info", (IChatContext context) async {
    final embed = EmbedBuilder()
        ..title = "Aparatus' Statistics"
        ..addField(name: "Cached Guilds:", content: context.client.guilds.length, inline: true)
        ..addField(name: "Cached Users:", content: context.client.users.length, inline: true)
        ..addField(name: "Cached Channels:", content: context.client.channels.length, inline: true)
        ..addField(name: "Memory Usage:", content: getCurrentMemoryString(), inline: true);

    await context.respond(
      MessageBuilder.embed(embed)
    );
  })
);