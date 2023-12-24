class RecommendedEntity {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  RecommendedEntity(
      {this.id,
      this.aisle,
      this.image,
      this.consistency,
      this.name,
      this.nameClean,
      this.original,
      this.originalName,
      this.amount,
      this.unit,
      this.meta,
      this.measures});

  // RecommendedEntity.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   aisle = json['aisle'];
  //   image = json['image'];
  //   consistency = json['consistency'];
  //   name = json['name'];
  //   nameClean = json['nameClean'];
  //   original = json['original'];
  //   originalName = json['originalName'];
  //   amount = json['amount'];
  //   unit = json['unit'];
  //   meta = json['meta'].cast<String>();
  //   measures = json['measures'] != null
  //       ? new Measures.fromJson(json['measures'])
  //       : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['aisle'] = this.aisle;
  //   data['image'] = this.image;
  //   data['consistency'] = this.consistency;
  //   data['name'] = this.name;
  //   data['nameClean'] = this.nameClean;
  //   data['original'] = this.original;
  //   data['originalName'] = this.originalName;
  //   data['amount'] = this.amount;
  //   data['unit'] = this.unit;
  //   data['meta'] = this.meta;
  //   if (this.measures != null) {
  //     data['measures'] = this.measures!.toJson();
  //   }
  //   return data;
  // }
}

class Measures {
  Us? us;
  Us? metric;

  Measures({this.us, this.metric});

  // Measures.fromJson(Map<String, dynamic> json) {
  //   us = json['us'] != null ? new Us.fromJson(json['us']) : null;
  //   metric = json['metric'] != null ? new Us.fromJson(json['metric']) : null;
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.us != null) {
  //     data['us'] = this.us!.toJson();
  //   }
  //   if (this.metric != null) {
  //     data['metric'] = this.metric!.toJson();
  //   }
  //   return data;
  // }
}

class Us {
  double? amount;
  String? unitShort;
  String? unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  // Us.fromJson(Map<String, dynamic> json) {
  //   amount = json['amount'];
  //   unitShort = json['unitShort'];
  //   unitLong = json['unitLong'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['amount'] = this.amount;
  //   data['unitShort'] = this.unitShort;
  //   data['unitLong'] = this.unitLong;
  //   return data;
  // }
}
