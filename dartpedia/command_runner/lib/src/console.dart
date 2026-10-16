import 'dart:io';

const String ansiEscapeLiteral = '\x1b';

/// Splits strings on `\n` characters, then writes each line to the cconsole.
/// [duration] defines how many milliseconds there will be between each line print
Future<void> write(String text, {int duration = 50}) async {
  final List<String> lines = text.split('\n');
  for (final String l in lines) {
    await _delayedPrint("$l \n", duration: duration);
  }
}

/// Prints line-by-line
Future<void> _delayedPrint(String text, {int duration = 50}) async {
  return Future<void>.delayed(
    Duration(microseconds: duration),
    () => stdout.write(text),
  );
}

enum ConsoleColor {
  /// Sky blue - #b8eafe
  lightBlue(184, 234, 254),

  /// Accent colors from Dart's brand guidlines
  /// Warm red - #F25d50
  red(242, 93, 80),

  /// Light yellow - #F9F8C4
  yellow(249, 248, 196),

  /// Light grey, good for text, #F8F9FA
  grey(240, 240, 240),

  ///
  white(255, 255, 255);

  const ConsoleColor(this.r, this.g, this.b);

  final int r;
  final int g;
  final int b;

  // Change color of all future output (untill reset)
  String get enableForeground => '$ansiEscapeLiteral[38;2;$r;$g;${b}m';

  // Change color of all future output (untill reset)
  String get enableBackground => '$ansiEscapeLiteral[48;2;$r;$g;${b}m';

  // Reset text and background color to terminal defaults
  static String get reset => '$ansiEscapeLiteral[0m';

  // Sets text color for the input
  String applyForeground(String text) {
    return '$ansiEscapeLiteral[38;2;$r;$g;${b}m$text$reset';
  }

  // Sets background color and then resets the color change
  String applyBackground(String text) {
    return '$ansiEscapeLiteral[48;2;$r;$g;${b}m$text$ansiEscapeLiteral[0m';
  }
}
