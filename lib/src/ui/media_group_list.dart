import 'package:flutter/material.dart';
import '../models/response_model.dart';
import '../blocs/groups_bloc.dart';

class MediaGroupList extends StatefulWidget {
  MediaGroupList({Key key}) : super(key: key);

  _MediaGroupListState createState() => _MediaGroupListState();
}

class _MediaGroupListState extends State<MediaGroupList> {
  @override
  Widget build(BuildContext context) {
      bloc.fetchAllGroups();
    
    return Container(
       child: Text('MediaGroupList'),
    );
  }
}