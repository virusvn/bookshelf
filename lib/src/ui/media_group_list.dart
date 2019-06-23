import 'package:bookshelf/src/models/media_group.dart';
import 'package:flutter/material.dart';
import '../models/response_model.dart';
import '../blocs/groups_bloc.dart';

class MediaGroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllGroups();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookshelf'),
      ),
      body: StreamBuilder(
        stream: bloc.allGroups,
        builder: (context, AsyncSnapshot<ResponseModel> snapshot) {
          if (snapshot.hasData) {
            return buildGroupList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
  Widget buildGroupList(AsyncSnapshot<ResponseModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.groups.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
            if (snapshot.data.groups.length > 0){
                print('${snapshot.data.domain}${snapshot.data.groups[index].separator}');
        //   return Image.network(
        //     '${snapshot.data.domain}${snapshot.data.groups[index].separator}',
        //     fit: BoxFit.cover,
        //   );
            return buildMediaList(snapshot.data.domain, snapshot.data.groups[index]);
          }
          return Text("No image");
        });
  }
  Widget buildMediaList(String domain, MediaGroupModel group) {
    return GridView.builder(
        itemCount: group.media_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
            if (group.media_list[index].image != ""){
          return Image.network(
            '${domain}${group.media_list[index].image}',
            fit: BoxFit.cover,
          );
          }
          return Text("No image");
        });
  }
}

