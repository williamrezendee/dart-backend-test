import '../models/news.dart';
import 'generic_service.dart';

import '../utils/list_extension.dart';

class NewsService implements GenericService<News> {

  final List<News> _fakeDB = [];
  @override
  bool delete(int id) {
    _fakeDB.removeWhere((element) => element.id == id);
    return true;
  }

  @override
  List<News> findAll() {
    return _fakeDB;
  }

  @override
  News findOne(int id) {
    return _fakeDB.firstWhere((element) => element.id == id);

  }

  @override
  bool save(News value) {
    News? news = _fakeDB.firstWhereOrNull((element) => element.id == value.id);
    if (news == null) {
      _fakeDB.add(value);
    } else {
      var index = _fakeDB.indexOf(news);
      _fakeDB[index] = value;
    }
    return true;
  }
}
