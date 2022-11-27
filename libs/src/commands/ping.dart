import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand ping = ChatCommand(
    "ping",
    "Pings Aparatus",
    id("ping", (IChatContext context) async {
      final gatewayLatency = (context.client as INyxxWebsocket)
          .shardManager
          .gatewayLatency
          .inMilliseconds;

      final embed = EmbedBuilder()
        ..addField(name: "Gateway Latency", content: "${gatewayLatency}ms", inline: true);

        


    }));
