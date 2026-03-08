import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {

  static String get apiUrl=>dotenv.get('API_URL', fallback: 'http://172.20.10.8:8000/api/');

  static String get host=>dotenv.get('HOST', fallback: '172.20.10.8');

  static String get appkey=>dotenv.get('APPKEY', fallback: 'afrdhkbhjuygbvcfghnkiolkjngtgbju');

  static int get port=>dotenv.getInt('PORT', fallback: 8000);

  static int get wsport=>dotenv.getInt('WSPORT', fallback: 8080);

  static String get developpement=>'.env';

  static String get production=>'.env.production';

  static bool get isLocal=>true;

}