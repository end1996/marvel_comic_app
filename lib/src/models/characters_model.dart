// class Characters {
//   List<Result> characters = [];
//   Characters.fromJsonList(Map<String, dynamic> jsonList) {

//     if (jsonList == null) return;
//     for (var element in jsonList) {
//       final character = Characters.fromJsonMap(element)
//     }
//   }
// }

// class Character {
//   int? code;
//   String? status;
//   String? copyright;
//   String? attributionText;
//   String? attributionHtml;
//   String? etag;
//   Data? data;

//   Character({
//     this.code,
//     this.status,
//     this.copyright,
//     this.attributionText,
//     this.attributionHtml,
//     this.etag,
//     this.data,
//   });
// }

// class Data {
//   int? offset;
//   int? limit;
//   int? total;
//   int? count;
//   List<Result>? results;

//   Data({
//     this.offset,
//     this.limit,
//     this.total,
//     this.count,
//     this.results,
//   });
// }

// class Result {
//   int? id;
//   String? name;
//   String? description;
//   String? modified;
//   Thumbnail? thumbnail;
//   String? resourceUri;
//   Comics? comics;
//   Comics? series;
//   Stories? stories;
//   Comics? events;
//   List<Url>? urls;

//   Result({
//     this.id,
//     this.name,
//     this.description,
//     this.modified,
//     this.thumbnail,
//     this.resourceUri,
//     this.comics,
//     this.series,
//     this.stories,
//     this.events,
//     this.urls,
//   });

//   // Result.fromJsonMap(Map<String, dynamic> json) {
    
//   //     id = json['id'];
//   //     name = json['name'];
//   //     description = json['description'];
//   //     modified = json['modified'];
//   //     thumbnail = json['thumbnail'];
//   //     resourceUri = json['resourceUri'];
//   //     comics = json['comics'];
//   //     series = json['series'];
//   //     stories = json['stories'];
//   //     events = json['events'];
//   //     urls = json['urls'];
    
//   // }
// }

// class Comics {
//   int? available;
//   String? collectionUri;
//   List<ComicsItem>? items;
//   int? returned;

//   Comics({
//     this.available,
//     this.collectionUri,
//     this.items,
//     this.returned,
//   });
// }

// class ComicsItem {
//   String? resourceUri;
//   String? name;

//   ComicsItem({
//     this.resourceUri,
//     this.name,
//   });
// }

// class Stories {
//   int? available;
//   String? collectionUri;
//   List<StoriesItem>? items;
//   int? returned;

//   Stories({
//     this.available,
//     this.collectionUri,
//     this.items,
//     this.returned,
//   });
// }

// class StoriesItem {
//   String? resourceUri;
//   String? name;
//   ItemType? type;

//   StoriesItem({
//     this.resourceUri,
//     this.name,
//     this.type,
//   });
// }

// enum ItemType { COVER, INTERIOR_STORY, EMPTY }

// class Thumbnail {
//   String? path;
//   Extension? extension;

//   Thumbnail({
//     this.path,
//     this.extension,
//   });
// }

// enum Extension { JPG, GIF }

// class Url {
//   UrlType? type;
//   String? url;

//   Url({
//     this.type,
//     this.url,
//   });
// }

// enum UrlType { DETAIL, WIKI, COMICLINK }

