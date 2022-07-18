import 'package:shelf/shelf.dart';

class MiddlewareInterception {
  Middleware get middleware => createMiddleware(
    responseHandler: (Response response) => response.change(
      headers: {'content-type':'application/json'},
    ),
  );
}