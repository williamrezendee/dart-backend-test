import 'package:shelf/shelf.dart';
import 'dart:io';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:backend/server_access.dart';

void main() async {
  var serverAccess = ServerAccess();

  try {
    final server = await shelf_io.serve(serverAccess.handler, 'localhost', 9090);
    print('Serving at http://${server.address.host}:${server.port}');
  } catch (e) {
    print('Não foi possível iniciar o servidor.');
    e.toString();
  } 
}
