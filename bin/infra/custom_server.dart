import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class CustomServer {
  Future<void> initialize(Handler handler) async {
    String url = 'localhost';
    int port = 8080;

    await shelf_io.serve(handler, url, port);
    print('Server started -> http://$url:$port');
  }
}
