import 'dart:async';

import 'arguments.dart';

class HelpCommmand extends Command {
  HelpCommmand() {
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'When true, prints each command and its options.',
    );

    addOption(
      'command',
      abbr: 'c',
      help: 'Prints verbose usage for the specifianed command.',
    );
  }

  @override
  String get name => 'help';

  @override
  String get description => 'Prints usage information to the command line.';

  @override
  String? get help => 'Prints this usage information';

  @override
  Future<Object?> run(args) async {
    var usage = runner.usage;

    for (var command in runner.commands) {
      usage += '\n ${command.usage}';
    }

    return usage;
  }
}
