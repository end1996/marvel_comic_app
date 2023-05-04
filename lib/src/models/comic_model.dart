// class Comics {

//   List<Comic> items = [];
//   Comics();
//   Comics.fromJsonList(List<dynamic> jsonList) {
//     // ignore: unnecessary_null_comparison
//     if(jsonList == null) return;
//     for (var element in jsonList) {
//       final comic = Comic.fromJsonMap(element);
//       items.add(comic);
//     }

//   }
// }
class Marvel {
  String? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  Data? data;
  String? etag;

  Marvel({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.data,
    this.etag,
  });
}

class Data {
  String? offset;
  String? limit;
  String? total;
  String? count;
  List<Comic>? results;

  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });
}

class Comic {
  String? id;
  String? digitalId;
  String? title;
  String? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  String? pageCount;
  List<TextObject>? textObjects;
  String? resourceUri;
  List<Url>? urls;
  Series? series;
  List<Series>? variants;
  List<Series>? collections;
  List<Series>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  Characters? creators;
  Characters? characters;
  Stories? stories;
  Events? events;

  Comic({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  
  // Comic.fromJsonMap(Map<String,dynamic> json) {
  //   id = json['id'];
  //   digitalId = json['digital_id'];
  //   title = json['title'];
  //   issueNumber = json['issue_number'];
  //   variantDescription = json['variant_description'];
  //   description = json['description'];
  //   modified = json['modified'];
  //   isbn = json['isbn'];
  //   upc = json['upc'];
  //   diamondCode = json['diamond_code'];
  //   ean = json['ean'];
  //   issn = json['issn'];
  //   format = json['format'];
  //   pageCount = json['page_count'];
  //   textObjects = json['text_objects'];
  //   resourceUri = json['resource_uri'];
  //   urls = json['urls'];
  //   series = json['series'];
  //   variants = json['variants'];
  //   collections = json['collections'];
  //   collectedIssues = json['collected_issues'];
  //   dates = json['dates'];
  //   prices = json['prices'];
  //   thumbnail = json['thumbnail'];
  //   images = json['images'];
  //   creators = json['creators'];
  //   characters = json['characters'];
  //   stories = json['stories'];
  //   events = json['events'];
  // }
}

class Characters {
  String? available;
  String? returned;
  String? collectionUri;
  List<CharactersItem>? items;

  Characters({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });
}

class CharactersItem {
  String? resourceUri;
  String? name;
  String? role;

  CharactersItem({
    this.resourceUri,
    this.name,
    this.role,
  });
}

class Series {
  String? resourceUri;
  String? name;

  Series({
    this.resourceUri,
    this.name,
  });
}

class Date {
  String? type;
  String? date;

  Date({
    this.type,
    this.date,
  });
}

class Events {
  String? available;
  String? returned;
  String? collectionUri;
  List<Series>? items;

  Events({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({
    this.path,
    this.extension,
  });
}

class Price {
  String? type;
  String? price;

  Price({
    this.type,
    this.price,
  });
}

class Stories {
  String? available;
  String? returned;
  String? collectionUri;
  List<StoriesItem>? items;

  Stories({
    this.available,
    this.returned,
    this.collectionUri,
    this.items,
  });
}

class StoriesItem {
  String? resourceUri;
  String? name;
  String? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });
}

class TextObject {
  String? type;
  String? language;
  String? text;

  TextObject({
    this.type,
    this.language,
    this.text,
  });
}

class Url {
  String? type;
  String? url;

  Url({
    this.type,
    this.url,
  });
}
