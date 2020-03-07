import 'dart:async';
import 'dart:core';
import 'package:flutter_my_app/model/LastDayModel.dart';

import 'DBProvider.dart';

class LastDayBloc {

  final _lastDayController = StreamController<List<LastDay>>();
  Stream<List<LastDay>> get lastDayStream => _lastDayController.stream;

  getLastDays() async {
    _lastDayController.sink.add(await DBProvider.db.getAllLastDays());
  }

  LastDayBloc() {
    getLastDays();
  }

  dispose() {
    _lastDayController.close();
  }

  create(LastDay lastDay) {
    lastDay.assignUUID();
    DBProvider.db.createLastDay(lastDay);
    getLastDays();
  }

  update(LastDay lastDay) {
    DBProvider.db.updateLastDay(lastDay);
    getLastDays();
  }

  delete(String id) {
    DBProvider.db.deleteLastDay(id);
    getLastDays();
  }
}