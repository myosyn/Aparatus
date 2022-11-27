import 'package:dotenv/dotenv.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

void main() async {
  final env = DotEnv(includePlatformEnvironment: true)..load();
  final token = env["TOKEN"];
  final bot = NyxxFactory.createNyxxWebsocket(
      token!,
      GatewayIntents.guildBans |
      GatewayIntents.directMessages |
      GatewayIntents.guildInvites
  );

  bot
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration());

  CommandsPlugin commands = CommandsPlugin(
    prefix: (message) => "<3"
  );

  bot.registerPlugin(commands);

  await bot.connect();
}