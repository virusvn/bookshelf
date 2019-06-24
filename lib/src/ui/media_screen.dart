import 'package:bookshelf/src/models/media.dart';
import 'package:flutter/material.dart';
import '../blocs/groups_bloc.dart';

class MediaScreen extends StatelessWidget {
  // Declare a field that holds the media.
  final MediaModel media;

  // In the constructor, require a media.
  MediaScreen({Key key, @required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.fetchMedia(media);

    // Use the media to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(media.name),
      ),
      body: StreamBuilder(
        stream: bloc.media,
        builder: (context, AsyncSnapshot<MediaModel> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.magazines);
            return ListView.builder(
              itemCount: snapshot.data.magazines.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data.magazines[index].number);
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
