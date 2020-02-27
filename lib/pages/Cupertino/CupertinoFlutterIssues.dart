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
class _State extends State<CupertinoFlutterIssues> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if(type==0) url = 'https://api.github.com/repositories/31792824/issues';
    else        url = 'https://api.github.com/repositories/31792824/commits';
    final res = await http.get(url);
    final data = json.decode(res.body);
    setState(() {
      _buildIssuesCommits(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(navigationBarTitle, style: myTextStyle),
        trailing: _buildTrailingButton(),
        backgroundColor: const Color(0xff333333),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if(type == 0) {
            if (index >= _issues.length) {
              return null;
            }

            final issue = _issues[index];
            return _buildIssueRow(issue);
          }
          else {
            if (index >= _commits.length) {
              return null;
            }

            final commit = _commits[index];
            String message = commit.message;
            int maxLength = 80;
            if(message.length > maxLength) {
              message = commit.message.substring(0, maxLength);
            }
            return _buildCommitRow(commit, message);
          }
        },
      ),
    );
  }

  Widget _buildTrailingButton() {
    return FlatButton(
      child: Text(buttonTitle,
        style: myTextStyle) , 
        onPressed: (){setState(() {
          if(type==0) {
            navigationBarTitle = 'Flutter Commits';
            buttonTitle = 'Issues';
            type = 1;
          }
          else {
            navigationBarTitle = 'Flutter Issues';
            buttonTitle = 'Commits';
            type = 0;
          }
          _load();
        });
      },
    );
  }

  Widget _buildIssueRow(Issue issue) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: ClipOval(
            child: Image.network(issue.avatarUrl,
              width: 50,),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(issue.title, 
                style: myTextStyle,),
              Text('#' + issue.number + '  opened  ' + issue.updatedAt, 
                style: mySubTitleTextStyle,),
            ],
          )
        ),
      ],
    );
  }

  Widget _buildCommitRow(Commit commit, String message) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          // padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: ClipOval(
            child: Image.network(commit.avatarUrl,
              width: 50,height: 55,),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(message , 
                    style: myTextStyle,),
                  Text(commit.login + ' committed  ' + commit.date , 
                    style: mySubTitleTextStyle,),
                ],
              ),
            ],
          )
        ),
      ],
    );
  }
}

class Issue {
  Issue({
    this.title,
    this.avatarUrl,
    this.number,
    this.updatedAt,
  });

  final String title;
  final String avatarUrl;
  final String number;
  final String updatedAt;
}

class Commit {
  Commit({
    this.message,
    this.avatarUrl,
    this.sha,
    this.date,
    this.login,
  });

  final String message;
  final String avatarUrl;
  final String sha;
  final String date;
  final String login;
}

var myTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 16,
  color: CupertinoColors.white);

var mySubTitleTextStyle = new TextStyle(
  fontWeight: FontWeight.w100,
  decoration: TextDecoration.none,
  fontSize: 14,
  color: CupertinoColors.white);

// 0:Flutter Issues
// 1:Flutter Commits
int type = 0;

List<Issue> _issues = <Issue>[];
List<Commit> _commits = <Commit>[];

void _buildIssuesCommits(final data)
{
  if(type==0) {
    final issues = data as List;
    issues.forEach((dynamic element) {
      final issue = element as Map;
      _issues.add(Issue(
        title: issue['title'] as String,
        avatarUrl: issue['user']['avatar_url'] as String,
        number: issue['number'].toString() as String,
        updatedAt: issue['updatedAt'] as String,
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
        login: commit['author']['login'] as String,
      ));
    });
  }
}

String navigationBarTitle = 'Flutter Issues';
String buttonTitle = 'Commits';

String url = '';