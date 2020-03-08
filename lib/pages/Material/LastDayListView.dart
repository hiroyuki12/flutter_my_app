import 'package:flutter/material.dart';
import 'package:flutter_my_app/model/LastDayModel.dart';
import 'package:flutter_my_app/repositories/LastDayBloc.dart';
import 'package:provider/provider.dart';

import '../../model/LastDayModel.dart';
import '../../repositories/LastDayBloc.dart';
import 'LastDayEditView.dart';

class LastDayListView extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    final _bloc = Provider.of<LastDayBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(ConstText.lastDayListView)),
      body: StreamBuilder<List<LastDay>>( 
        stream: _bloc.lastDayStream,
        builder: (BuildContext context, AsyncSnapshot<List<LastDay>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                
                LastDay lastDay = snapshot.data[index];

                return Dismissible(
                  key: Key(lastDay.id),
                  background: _backgroundOfDismissible(),
                  secondaryBackground: _secondaryBackgroundOfDismissible(),
                  onDismissed: (direction) {
                    _bloc.delete(lastDay.id);
                  },
                  child: Card(
                    child: ListTile(
                      onTap: (){ 
                        _moveToEditView(context, _bloc, lastDay); 
                      },
                      title: Text("${lastDay.title}", style: TextStyle(fontSize: 24),),
                      // subtitle: Text("${lastDay.note}"),
                      subtitle: Text("${lastDay.lastDate.toLocal().toString()}"),
                      // trailing: Text("${lastDay.lastDate.toLocal().toString()}"),
                      trailing: Text("${lastDay.note}"),
                      isThreeLine: true,
                    )
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ _moveToCreateView(context, _bloc); },
        child: Icon(Icons.add, size: 40),
      ),
    );
  }

  _moveToEditView(BuildContext context, LastDayBloc bloc, LastDay lastDay) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LastDayEditView(lastDayBloc: bloc, lastDay: lastDay))
  );

  _moveToCreateView(BuildContext context, LastDayBloc bloc) => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LastDayEditView(lastDayBloc: bloc, lastDay: LastDay.newLastDay()))
  );

  _backgroundOfDismissible() => Container(
    alignment: Alignment.centerLeft,
    color: Colors.green,
    child: Padding( 
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Icon(Icons.done, color: Colors.white),
    )
  );

  _secondaryBackgroundOfDismissible() => Container(
    alignment: Alignment.centerRight,
    color: Colors.green,
    child: Padding( 
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Icon(Icons.done, color: Colors.white),
    )
  );
}

class ConstText {
  static final appTitle = "Simple LastDay App";
  static final lastDayListView = "LastDay List";
  static final lastDayEditView = "LastDay Edit";
  static final lastDayCreateView = "New LastDay";
}