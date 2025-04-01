import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get unsplashBaseUrl => dotenv.env['UNSPLASH_BASE_URL'] ?? '';
  static String get unsplashApiKey => dotenv.env['UNSPLASH_API_KEY'] ?? '';
}
