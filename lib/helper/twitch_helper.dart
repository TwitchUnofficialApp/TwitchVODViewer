import 'package:html/dom.dart' as html;
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

import '../service/rest_api_consumer_service.dart';

class TwitchHelper {

    static Future<String> getTwitchClientId() async {

        String baseUrl = "https://twitch.tv/";
        String endpoint = "";
        Map<String, String> headers = {
            "Accept": "application/json",
            "Content-Type": "text/plain",
            //"User-Agent": "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"
        };

        RestApiConsumerService service = new RestApiConsumerService(baseUrl: baseUrl, endpoint: endpoint, headers: headers);
        var response = await service.get();
        
        var clientId = "";

        var document = parse(response);
        var scripts = document.getElementsByTagName('script');
        for (var script in scripts) {
            var text = script.outerHtml;
            if (text.contains('"Client-ID":') || text.contains('clientId=')) {
                var pattern = RegExp(r'clientId="([^"]+)"');
                var match = pattern.firstMatch(text);
                if (match != null) {
                    var tempClientId = match.group(1);
                    clientId = (tempClientId != null) ? tempClientId : "";
                    break;
                }
            }
        }

        return clientId;

    }


}