
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../helper/twitch_helper.dart';

class GraphQLHttpConsumerService {

    final String baseUrl = "https://gql.twitch.tv";
    final String endpoint = "gql";
    
    GraphQLHttpConsumerService();
    
    Future<String> performQuery(String query, Map<String, dynamic> params) async {

        final Map<String, String> headers = {
            "accept": "*/*",
            "accept-language": "en-US",
            "authorization": 'undefined',
            "client-id": await TwitchHelper.getTwitchClientId(),
            "content-type": "text/plain;charset=UTF-8",
            "sec-ch-ua": "\"Chromium\";v=\"106\", \"Microsoft Edge\";v=\"106\", \"Not;A=Brand\";v=\"99\"",
            "sec-ch-ua-mobile": "?0",
            "sec-ch-ua-platform": "\"Windows\"",
            "sec-fetch-dest": "empty",
            "sec-fetch-mode": "cors",
            "sec-fetch-site": "same-site",
            "cache-control": "no-cache",
            "Referer": "https://www.twitch.tv/", 
            "Referrer-Policy": "strict-origin-when-cross-origin",
            "method": "POST",
            "mode": "cors",
            "credentials": "include"
        };

        final response = await http.post(Uri.parse('$baseUrl/$endpoint'), headers: headers, 
            body: params.entries.map((entry) => query.replaceAll(entry.key, entry.value)).join());

        if (response.statusCode == 200) {
            return utf8.decode(response.bodyBytes);
        } else {
            throw Exception('Failed to post data');
        }
        
    }
        
}