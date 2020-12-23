import 'dart:collection';
import 'package:album/model/description.dart';
import 'package:flutter/cupertino.dart';

class DescNotifier with ChangeNotifier {
  List<Description> _desclist = [];
  Description _currentDesc;

  UnmodifiableListView<Description> get decslist =>
      UnmodifiableListView(_desclist);

  Description get currentDecs => _currentDesc;

  set desclist(List<Description> desclist) {
    _desclist = desclist;
    notifyListeners();
  }

  set currentDesc(Description desc) {
    _currentDesc = desc;
    notifyListeners();
  }
}
