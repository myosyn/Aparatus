import 'package:dotenv/dotenv.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

import '../libs/src/commands/info.dart';
import '../libs/src/commands/ping.dart';

void main() async {
  final env = DotEnv(includePlatformEnvironment: true)..load();
  final token = env["TOKEN"];
  final bot = NyxxFactory.createNyxxWebsocket(
      token!,
      GatewayIntents.guildBans |
      GatewayIntents.directMessages |
      GatewayIntents.guildInvites
  );

  final command = CommandsPlugin(
      prefix: mentionOr((_) => "<3")
  );
  
  command
    ..addCommand(ping)
    ..addCommand(info);

  bot
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(command);

  await bot.connect();
}