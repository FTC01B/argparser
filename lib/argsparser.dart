import 'dart:io';
import 'operands.dart';

class Parser {
  String name;
  bool required;
  Type type;
  String? abbreviation;

  Parser(this.name, {this.required = true, this.type = String, this.abbreviation});
}

class Argsparser {
  List<String> rawArguments;
  List<Parser> parser = [Parser('--help', abbreviation: '-h', required: false, type: String)];
  Map<String, dynamic> arguments = {};
  
  Argsparser(this.rawArguments);

  void addArgument(String name, {bool required = true, Type type = String, String? abbreviation}) {
    if (parser.where((arg) => arg.name == name || arg.abbreviation == abbreviation || arg.name == abbreviation || arg.abbreviation == name).isNotEmpty) {
      print('name: $name, abbreviation: ${abbreviation ?? '[none set]'} already taken');
      exit(1);
    }

    parser.add(Parser(
      name,
      required: required,
      type: type,
      abbreviation: abbreviation,
    ));
  }

  void help() {
    final requiredArguments = parser.where((arg) => arg.required);
    final optionalArguments = parser.where((arg) => !arg.required);

    print();

    exit(1);
  }

  void passArguments() {
    final requiredArguments = parser.where((arg) => arg.required);

    for (var argument in requiredArguments) {
      if (xor(rawArguments.contains(argument.name), rawArguments.contains(argument.abbreviation))) {
        continue;
      }
      print('missing argument ${argument.name}');
      help();
    }

    if (arguments['--help']) {
      help();
    }

    print(requiredArguments);
  }
}