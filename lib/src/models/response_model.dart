import "media_group.dart";

class ResponseModel{
    String _domain;
    String _api_version;
    List<MediaGroupModel> _groups = [];
    ResponseModel.fromJson(Map<String, dynamic> parsedJson ) {
        _domain = parsedJson["meta"]["domain"];
        _api_version = parsedJson["response"]["version"];
        List<MediaGroupModel> _tmp_groups = [];
        for (int i =0; i< parsedJson["response"]["groups"].length; i++){

        }

    }
    String get domain => _domain;
    String get api_version => _api_version;
    List<MediaGroupModel> get groups => _groups;

}