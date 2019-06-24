import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/response_model.dart';
import '../models/media.dart';

class GroupsBloc {
  final _repository = Repository();
  final _groupsFetcher = PublishSubject<ResponseModel>();
  final _mediaFetcher = PublishSubject<MediaModel>();

  Observable<ResponseModel> get allGroups => _groupsFetcher.stream;
  Observable<MediaModel> get media => _mediaFetcher.stream;

  fetchAllGroups() async {
    ResponseModel itemModel = await _repository.fetchAllGroups();
    _groupsFetcher.sink.add(itemModel);
  }

  fetchMedia(MediaModel media) async {
    MediaModel itemModel = await _repository.fetchMedia(media);
    _mediaFetcher.sink.add(itemModel);
  }

  dispose() {
    _groupsFetcher.close();
    _mediaFetcher.close();
  }
}

final bloc = GroupsBloc();
