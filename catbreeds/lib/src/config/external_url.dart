import 'package:url_launcher/url_launcher.dart';

class ExternalUrl {
  static Future<void> launchExternalUrl(String url) async {
    if(await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
