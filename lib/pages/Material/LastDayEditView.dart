import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_app/model/LastDayModel.dart';
import 'package:flutter_my_app/repositories/LastDayBloc.dart';
import 'package:intl/intl.dart';

// import '../main.dart';
import 'LastDayListView.dart';

class LastDayEditView extends StatelessWidget {

  final DateFormat _format = DateFormat("yyyy-MM-dd HH:mm");

  final LastDayBloc lastDayBloc;
  final LastDay lastDay;
  final LastDay _newLastDay = LastDay.newLastDay();

  LastDayEditView({Key key, @required this.lastDayBloc, @required this.lastDay}){
    // Dartでは参照渡しが行われるため、lastDayをそのまま編集してしまうと、
    // 更新せずにリスト画面に戻ったときも値が更新されてしまうため、
    // 新しいインスタンスを作る
    _newLastDay.id = lastDay.id;
    _newLastDay.title = lastDay.title;
    _newLastDay.lastDate = lastDay.lastDate;
    _newLastDay.note = lastDay.note;
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ConstText.lastDayEditView)),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            _titleTextFormField(),
            _lastDateTimeFormField(),
            _noteTextFormField(),
            _confirmButton(context)
          ],
        ),
      )
    );
  }

  Widget _titleTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "タイトル"),
    // initialValue: _newLastDay.title,
    initialValue: 'test',
    onChanged: _setTitle,
    onTap: () => _newLastDay.title = 'test',
  );
  
  void _setTitle(String title) {
    _newLastDay.title = title;
  }

  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _lastDateTimeFormField() => DateTimeField(
    format: _format,
    decoration: InputDecoration(labelText: "締切日"),
    initialValue: _newLastDay.lastDate ?? DateTime.now(),
    onChanged: _setLastDate,
    onShowPicker: (context, currentValue) async {
      final date = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));
      if (date != null) {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
              currentValue ?? DateTime.now()),
        );
        return DateTimeField.combine(date, time);
      } else {
        return currentValue;
      }
    }
  );
 
  void _setLastDate(DateTime dt) {
    _newLastDay.lastDate = dt;
  }

  Widget _noteTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "メモ"),
    initialValue: _newLastDay.note,
    maxLines: 3,
    onChanged: _setNote,
  );

  void _setNote(String note) {
    _newLastDay.note = note;
  }

  Widget _confirmButton(BuildContext context) => RaisedButton.icon(
    icon: Icon(
      Icons.tag_faces,
      color: Colors.white,
    ),
    label: Text("決定"),
    onPressed: () { 
      if (_newLastDay.id == null) {
        lastDayBloc.create(_newLastDay);
      } else {
        lastDayBloc.update(_newLastDay);
      }
      
      Navigator.of(context).pop();
    },
    shape: StadiumBorder(),
    color: Colors.green,
    textColor: Colors.white,
  );
}
