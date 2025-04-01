import 'package:argsparser/argsparser.dart';

void main(List<String> arguments) {
  final argsparser = Argsparser(arguments);

  argsparser.addArgument(
    '--hello-world',
    abberivation: '-h',
    required: false,
  );
  
  print('arguments: ${argsparser.arguments}');
}
