import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/news.dart';
import '../services/generic_service.dart';

class BlogApi {
  final GenericService<News> _service;

  BlogApi(this._service);

  Handler get handler {
    Router router = Router();

    // Read
    router.get('/blog/news', (Request request) {
      List<News> news = _service.findAll();
      List<Map> mapNews = news.map((e) => e.toJson()).toList();
      return Response.ok(jsonEncode(mapNews));
    });

    // Create
    router.post('/blog/news', (Request request) async {
      var body = await request.readAsString();
      _service.save(News.fromJson(jsonDecode(body)));
      return Response(201);
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
