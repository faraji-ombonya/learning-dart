import 'package:command_runner/command_runner.dart';

const version = "0.0.1";

void main(List<String> arguments) async {
  final verboseOption = Option(
    'verbose',
    type: OptionType.flag,
    abbr: 'v',
    help: 'Display extra logging information.',
  );

  print('Defined option: ${verboseOption}');
  print('Usage: ${verboseOption.usage}');
}
