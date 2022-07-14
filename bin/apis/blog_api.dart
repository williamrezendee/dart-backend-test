import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../services/generic_service.dart';

class BlogApi {
  final GenericService _service;

  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    // Read
    router.get('/blog/news', (Request request) {
      // _service.findAll();
      return Response.ok('Reading news');
    });

    // Create
    router.post('/blog/news', (Request request) {
      // _service.save('value');
      return Response.ok('Creating news');
    });

    // Update
    router.put('/blog/news', (Request request) {
      String? id = request.url.queryParameters['id'];
      // _service.save('value');

      return Response.ok('Updating news');
    });

    router.delete('/blog/news', (Request request) {
      String? id = request.url.queryParameters['id'];
      // _service.delete(1);

      return Response.ok('Deleting news');
    });

    return router;
  }
}
