class UserModel {
  int id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  UserModel({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? "",
        username = json['username'] ?? "",
        email = json['email'] ?? "",
        address = (json['address'] as Map<String, dynamic>?) != null
            ? Address.fromJson(json['address'] as Map<String, dynamic>)
            : null,
        phone = json['phone'] ?? "",
        website = json['website'] ?? "",
        company = (json['company'] as Map<String, dynamic>?) != null
            ? Company.fromJson(json['company'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toJson(),
        'phone': phone,
        'website': website,
        'company': company?.toJson()
      };
}

class Address {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'] ?? "",
        suite = json['suite'] ?? "",
        city = json['city'] ?? "",
        zipcode = json['zipcode'] ?? "",
        geo = (json['geo'] as Map<String, dynamic>?) != null
            ? Geo.fromJson(json['geo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toJson()
      };
}

class Geo {
  String? lat;
  String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  Geo.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] ?? "",
        lng = json['lng'] ?? "";

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        catchPhrase = json['catchPhrase'] ?? "",
        bs = json['bs'] ?? "";

  Map<String, dynamic> toJson() =>
      {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
}
