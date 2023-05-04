import 'package:intl/intl.dart';

class Comic {
  int? id;
  String? title;
  String? thumbnailUrl;
  Price? price;
  Date? date;
  // List<Price>? prices;

  Comic({this.id, this.title, this.thumbnailUrl, this.price, this.date});

  factory Comic.fromJson(Map<String, dynamic> json) {
    //Esto lo muestra como lista, no todos los comics contienen precio digital
    // List<dynamic> priceList = json['prices'];
    // List<Price> prices = priceList.map((priceJson) => Price.fromJson(priceJson)).toList();

    return Comic(
      id: json['id'],
      title: json['title'],
      thumbnailUrl:
          '${json['thumbnail']['path']}.${json['thumbnail']['extension']}',
      price: Price.fromJson(json['prices'][0]),
      date: Date.fromJson(json['dates'][0]),
      // prices: prices,
    );
  }
}

class Price {
  String? type;
  double? price;

  Price({this.type, this.price});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      type: json['type'],
      price: json['price'].toDouble(),
    );
  }
   @override
  String toString() {
    return '${price?.toStringAsFixed(2)}';
    // return '$type: \$${price?.toStringAsFixed(2)}';
  }
}

class Date {
  String? type;
  DateTime? date;

  Date({
    this.type,
    this.date,
  });

  factory Date.fromJson(Map<String,dynamic> json) {
    return Date(
      type: json['type'],
      date: DateTime.parse(json['date']),
    );
  }
   @override
  String toString() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(date!);
    return formatted;
  }
}
