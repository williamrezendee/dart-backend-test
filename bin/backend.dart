import 'package:shelf/shelf.dart';

import 'apis/blog_api.dart';
import 'apis/login_api.dart';
import 'infra/custom_server.dart';
import 'infra/middleware_interception.dart';
import 'services/news_service.dart';
import 'utils/custom_env.dart';

void main() async {
  var cascadeHandler = Cascade() // Build Pattern
      .add(LoginApi().handler)
      .add(BlogApi(NewsService()).handler)
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addMiddleware(MiddlewareInterception().middleware).addHandler(cascadeHandler);

  //String address = await CustomEnv.get<String>(key: 'server_address');
  String address = 'localhost';
  int port = await CustomEnv.get<int>(key: 'server_port');

  print(address.runtimeType);

  await CustomServer().initialize(
    handler: handler,
    address: address,
    port: port,
  );
}
