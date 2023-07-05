class Environments {
  final String env;
  Environments(this.env);
  static final String API_HOST = "https://reqres.in";
  static final String API_HOST_WITHOUT_HTTPS = "reqres.in";

  static final String API_BASE_URL = API_HOST + "/api";

  static String clientName = "";
  static String clientAuth = "";
  static String clienVersion = '1.0';

  Map<String, String> headerNoAuth = {
    "Authorization": clientAuth,
    'Content-Type': 'application/json',
    "User-Agent": clientName + "/1.0"
  };

  Map<String, String> headerJsonNoAuth = {
    "Authorization": clientAuth,
    'Content-Type': 'application/json',
    "User-Agent": "$clientName/$clienVersion"
  };
}
