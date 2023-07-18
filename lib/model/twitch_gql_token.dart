
class TwitchGQLToken {

    String? _channelLogin;
    String? _apiToken;
    String? _deviceId;
    String? _authorization;
    String? _oauth;
    String? _clientId;
    String? _userId;

    TwitchGQLToken(
      {String? channelLogin,
      String? apiToken,
      String? deviceId,
      String? authorization,
      String? oauth,
      String? clientId,
      String? userId}) {
        if (channelLogin != null) {
            this._channelLogin = channelLogin;
        }
        if (apiToken != null) {
            this._apiToken = apiToken;
        }
        if (deviceId != null) {
            this._deviceId = deviceId;
        }
        if (authorization != null) {
            this._authorization = authorization;
        }
        if (oauth != null) {
            this._oauth = oauth;
        }
        if (clientId != null) {
            this._clientId = clientId;
        }
        if (userId != null) {
            this._userId = userId;
        }
    }

    String? get channelLogin => _channelLogin;
    set channelLogin(String? channelLogin) => _channelLogin = channelLogin;

    String? get apiToken => _apiToken;
    set apiToken(String? apiToken) => _apiToken = apiToken;

    String? get deviceId => _deviceId;
    set deviceId(String? deviceId) => _deviceId = deviceId;

    String? get authorization => _authorization;
    set authorization(String? authorization) => _authorization = authorization;

    String? get oauth => _oauth;
    set oauth(String? oauth) => _oauth = oauth;

    String? get clientId => _clientId;
    set clientId(String? clientId) => _clientId = clientId;

    String? get userId => _userId;
    set userId(String? userId) => _userId = userId;

    TwitchGQLToken.fromJson(Map<String, dynamic> json) {
        _channelLogin = json['channel_login'];
        _apiToken = json['api_token'];
        _deviceId = json['device_id'];
        _authorization = json['authorization'];
        _oauth = json['oauth'];
        _clientId = json['client_id'];
        _userId = json['user_id'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['channel_login'] = this._channelLogin;
        data['api_token'] = this._apiToken;
        data['device_id'] = this._deviceId;
        data['authorization'] = this._authorization;
        data['oauth'] = this._oauth;
        data['client_id'] = this._clientId;
        data['user_id'] = this._userId;
        return data;
    }

    @override
    String toString() {
        return 'TwitchGQLToken{channel_login: $channelLogin, api_token: $apiToken, device_id: $deviceId, authorization: $authorization, oauth: $oauth, client_id: $clientId, user_id: $userId}';
    }

}