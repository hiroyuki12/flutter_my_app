import 'package:flutter/material.dart';
import 'package:flutter_my_app/model/chat_model.dart';

class ListView2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ListView2> with SingleTickerProviderStateMixin{
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      value: 1.0,
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  bool favorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView2"),
        ),
      body: ListView.builder(
          itemCount: ChatModel.dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            ChatModel _model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                Divider(
                  height: 12.0,
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(_model.avatarUrl),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(_model.name),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        _model.datetime,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message),
                  trailing: new FlatButton(
                    child: new ScaleTransition(
                      scale: CurvedAnimation(
                        parent: animationController,
                        curve: Curves.elasticOut,
                      ),
                      child: Icon(
                        //Icons.arrow_forward_ios,
                        favorite == true ? Icons.favorite : Icons.favorite_border,
                        color: favorite == true ? Colors.red : Colors.black38,
                        size: 16.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (favorite != true) {
                        //ハートが押されたときにfavoriteにtrueを代入している
                          favorite = true;
                        } else {
                          favorite = false;
                        }
                      });
                    },
                  ),
                ),
               ],
             );
          }),
    );
  }

  
}

