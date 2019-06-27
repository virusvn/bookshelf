import 'package:bookshelf/src/models/media_group.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../models/response_model.dart';
import '../blocs/groups_bloc.dart';
import './media_screen.dart';

class MediaGroupScreen extends StatefulWidget {
  MediaGroupScreen({Key key}) : super(key: key);

  _MediaGroupScreenState createState() => _MediaGroupScreenState();
}

class _MediaGroupScreenState extends State<MediaGroupScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllGroups();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
    return ListView.builder(
      itemBuilder: (context, index) {
        if (snapshot.data.groups[index].separator != "") {
          return Column(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: '${snapshot.data.groups[index].separator}',
              ),
              buildMediaList(snapshot.data.groups[index])
            ],
          );
        }
        return Column(
          children: <Widget>[buildMediaList(snapshot.data.groups[index])],
        );
      },
      itemCount: snapshot.data.groups.length, // this is a hardcoded value
    );
  }

  Widget buildMediaList(MediaGroupModel group) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: group.media_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          if (group.media_list[index].image != "") {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MediaScreen(media: group.media_list[index]),
                    ),
                  );
                },
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: '${group.media_list[index].image}',
                  fit: BoxFit.fitHeight,
                ));
          }
          return Text("No image");
        });
  }
}
