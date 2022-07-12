import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerAccess {

  Handler get handler {
    final router = Router();

    router.get('/', (Request request){
      return Response(200, body: 'First Route');
    });

    router.get('/ola/mundo/<user>', (Request request, String user){
      return Response.ok("Ola Mundo $user");
    });

    router.get('/query', (Request request){
      String? name = request.url.queryParameters['name'];
      String? age = request.url.queryParameters['age'];
      return Response.ok('Query: name $name, age $age');
    });

    router.post('/login', (Request request) async {
      var result = await request.readAsString();
      Map json = jsonDecode(result);

      var user = json['user'];
      var password = json['password'];

      if (user == 'admin' && password == '123') {
        return Response.ok('Welcome $user');
      } else {
        return Response.forbidden('Access Denied');
      }
    });
    
    return router;
  }

}