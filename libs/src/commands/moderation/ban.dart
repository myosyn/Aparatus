import 'dart:ffi';
import 'dart:html';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

ChatCommand ban = ChatCommand(
    "ban",
    "Bans a user from the server",
    id("ban", (
        IChatContext context,
        @Description("The name of the user being banned") Snowflake user,
        @Description("The reason why the user is being banned") String reason,
        @Description("Enables if a message will be sent to their direct messages or not") Bool dm,
        ) async {


  })
);