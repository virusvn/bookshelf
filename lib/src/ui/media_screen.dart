import 'package:bookshelf/src/models/media.dart';
import 'package:flutter/material.dart';
import '../blocs/groups_bloc.dart';
import './magazine_screen.dart';

class MediaScreen extends StatefulWidget {
  final MediaModel media;
  MediaScreen({Key key, @required this.media}) : super(key: key);
  _MediaScreenState createState() => _MediaScreenState(media: this.media);
}

class _MediaScreenState extends State<MediaScreen>
    with SingleTickerProviderStateMixin {
  final MediaModel media;
  AnimationController _animationController;
  _MediaScreenState({Key key, @required this.media});
  @override
  void initState() {
    _animationController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    bloc.fetchMedia(media);
    super.initState();
    // start animation
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    // We can't dispose this bloc, because it needs to add magazines later
    // bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(media.name),
      ),
      body: StreamBuilder(
        stream: bloc.media,
        builder: (context, AsyncSnapshot<MediaModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.magazines.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MagazineScreen(
                            magazine: snapshot.data.magazines[index]),
                      ),
                    );
                  },
                  child: new AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return new Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(_animationController.value * 45.0),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      child:
                          Image.network(snapshot.data.magazines[index].image),
                    ),
                  ),
                );
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
