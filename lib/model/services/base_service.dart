abstract class BaseService {
  final String mediaBaseUrl = "https://itunes.apple.com/search?term=";

  Future<dynamic> getResponse(String url);

}