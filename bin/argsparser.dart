import 'package:argsparser/argsparser.dart';

void main(List<String> arguments) {
  final argsparser = Argsparser(arguments);

  argsparser.addArgument(
    '--hello-world',
    // abbreviation: '-h',
    required: false,
  );
  
  argsparser.passArguments();
  
  print('arguments: ${argsparser.arguments}');
}
