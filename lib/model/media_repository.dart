import 'package:mvvm_flutter_app/model/media.dart';
import 'package:mvvm_flutter_app/model/services/media_service.dart';

class MediaRepository {
  MediaService _mediaService = MediaService();

  Future<List<Media>> fetchMediaList(String value) async {
    dynamic response = await _mediaService.get(value);
    final jsonData = response['results'] as List;
    List<Media> mediaList =
        jsonData.map((tagJson) => Media.fromJson(tagJson)).toList();
    return mediaList;
  }
}
