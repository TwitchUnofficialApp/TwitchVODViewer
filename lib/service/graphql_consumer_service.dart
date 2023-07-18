import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../helper/gql_helper.dart';
import '../helper/twitch_helper.dart';

class GraphQLConsumerService {

  GraphQLConsumerService();

  Future<void> performQuery(String query, Map<String, dynamic> params) async {

    final Link _link = HttpLink('https://gql.twitch.tv/gql', defaultHeaders: {
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
    });

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: params,
      fetchPolicy: FetchPolicy.networkOnly
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    } else {
      print(result.data.toString());
    }
    
    //final Context persistedQueryContext = Context.fromMap({'persistedQuery': {'version': 1, 'sha256Hash': GQLHelper.hashQuery(query)}});

  }
  
}