import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CupertinoFlutterIssues extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
    return _State();
  }
}

class Issue {
  Issue({
    this.title,
    this.avatarUrl,
    this.number,
    this.updated_at,
  });

  final String title;
  final String avatarUrl;
  final String number;
  final String updated_at;
}

class Commit {
  Commit({
    this.message,
    this.avatarUrl,
    this.sha,
    this.date,
  });

  final String message;
  final String avatarUrl;
  final String sha;
  final String date;
}
class _State extends State<CupertinoFlutterIssues> {
  var myTextStyle = new TextStyle(
    fontWeight: FontWeight.w100,
    decoration: TextDecoration.none,
    fontSize: 16,
    color: CupertinoColors.white);

  List<Issue> _issues = <Issue>[];
  List<Commit> _commits = <Commit>[];
  @override
  void initState() {
    super.initState();
    _load(type);
  }

  int type = 0;

  Future<void> _load(int type) async {

    String url = '';
    if(type==0) url = 'https://api.github.com/repositories/31792824/issues';
    else        url = 'https://api.github.com/repositories/31792824/commits';
    final res = await http.get(url);
    final data = json.decode(res.body);
    setState(() {
      if(type==0) {
        final issues = data as List;
        issues.forEach((dynamic element) {
          final issue = element as Map;
          _issues.add(Issue(
            title: issue['title'] as String,
            avatarUrl: issue['user']['avatar_url'] as String,
            number: issue['number'].toString() as String,
            updated_at: issue['updated_at'] as String,
          ));
        });
      }
      else {
        final commits = data as List;
        commits.forEach((dynamic element) {
          final commit = element as Map;
          _commits.add(Commit(
            message: commit['commit']['message'] as String,
            avatarUrl: commit['author']['avatar_url'] as String,
            sha: commit['sha'] as String,
            date: commit['commit']['committer']['date'] as String,
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("CupertinoFlutterIssues", style: myTextStyle),
        trailing: FlatButton(
          child: Text("Commits", 
            style: myTextStyle) , 
          onPressed: (){setState(() {
            type = 1;
            _load(type);
          });},),
        backgroundColor: const Color(0xff333333),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if(type == 0)
          {
            if (index >= _issues.length) {
              return null;
            }

            final issue = _issues[index];
            return Row(
              children: <Widget>[
                Padding(
                  //padding: const EdgeInsets.all(6.0),
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ClipOval(
                    child: Image.network(issue.avatarUrl,
                      width: 50,),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(issue.title, 
                        style: myTextStyle,),
                      Text(issue.updated_at, 
                        style: myTextStyle,),
                    ],
                  )
                ),
              ],
            );
          }
          else
          {
            if (index >= _commits.length) {
              return null;
            }

            final commit = _commits[index];
            String message = commit.message;
            if(message.length > 60) {
              message = commit.message.substring(0,50);
            }
            return Row(
              children: <Widget>[
                Padding(
                  //padding: const EdgeInsets.all(6.0),
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: ClipOval(
                    child: Image.network(commit.avatarUrl,
                      width: 50,),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(message , 
                        style: myTextStyle,),
                      // Text(commit.date, 
                      //   style: myTextStyle,),
                    ],
                  )
                ),
              ],
            );
          }

        },
      ),
    );
  }
}