import 'dart:io';

const String GET_USER = r'''
    query GetUser($login: String!) {
        user(login: $login) {
            id
            login
            displayName
            description
            createdAt
            roles {
                isPartner
            }
            stream {
                id
                title
                type
                viewersCount
                createdAt
                game {
                    name
                }
            }
        }
    }
''';

const String GET_CHANNEL = r'''
    query GetChannel($login: String!) {
        user(id: $channelID) {
            videos {
                edges {
                    node {
                        id
                        games {
                            id
                            name
                        }
                    }
                }
            }
        }
    }
''';


const String GET_FILTERABLE_VIDEO_TOWER = '[{"operationName": "FilterableVideoTower_Videos","variables": {"limit": 2,"channelOwnerLogin": "\$channelID","broadcastType": "ARCHIVE","videoSort": "TIME"},"extensions": {"persistedQuery": {"version": 1,"sha256Hash": "a937f1d22e269e39a03b509f65a7490f9fc247d7f83d6ac1421523e3b68042cb"}}}]';

// const String GET_CHANNEL_VIDEO_SHELVES_QUERY = r'''
//     query GetChannelVideoShelves($channelID: ID!) {
//         user(id: $channelID) {
//             videos {
//                 edges {
//                     node {
//                         id
//                         title
//                         publishedAt
//                         viewCount
//                         lengthSeconds
//                         thumbnailURLs {
//                             url
//                             width
//                             height
//                         }
//                         games {
//                             id
//                             name
//                         }
//                     }
//                 }
//             }
//         }
//     }
// ''';

// const String GET_STREAM = r'''
//     query GetStream($login: String!) {
//         user(login: $login) {
//             stream {
//                 id
//                 title
//                 type
//                 viewersCount
//                 createdAt
//                 game {
//                     name
//                 }
//             }
//         }
//     }
// ''';