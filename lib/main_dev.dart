import 'core/config/app_config.dart';
import 'core/config/init_app.dart';

void main() async {
  AppConfig.create(appDevConfig);
  initApp();
}
