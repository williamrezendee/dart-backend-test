import 'package:shelf/shelf.dart';

import 'api/blog_api.dart';
import 'api/login_api.dart';
import 'infra/custom_server.dart';
import 'utils/custom_env.dart';

void main() async {
  var cascadeHandler = Cascade() // Build Pattern
      .add(LoginApi().handler)
      .add(BlogApi().handler)
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascadeHandler);

  String address = await CustomEnv.get<String>(key: 'server_address');
  int port = await CustomEnv.get<int>(key: 'server_port');

  print(address);

  await CustomServer().initialize(
    handler: handler, 
    address: address,
    port: port,
  );
}
