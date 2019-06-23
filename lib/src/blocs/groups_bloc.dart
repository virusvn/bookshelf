import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/response_model.dart';

class GroupsBloc {
  final _repository = Repository();
  final _groupsFetcher = PublishSubject<ResponseModel>();

  Observable<ResponseModel> get allGroups => _groupsFetcher.stream;

  fetchAllGroups() async {
    ResponseModel itemModel = await _repository.fetchAllGroups();
    _groupsFetcher.sink.add(itemModel);
  }

  dispose() {
    _groupsFetcher.close();
  }
}

final bloc = GroupsBloc();