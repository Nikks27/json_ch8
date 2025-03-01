
import 'package:flutter/material.dart';

class Usermodal {
  late int id;
  late String name, email, username, phone, website;
  late Address address;
  late Company company;

  Usermodal(
      {required this.id,
        required this.name,
        required this.email,
        required this.username,
        required this.phone,
        required this.website,
        required this.company,
        required this.address});

  factory Usermodal.fromJson(Map m1)
  {
    return Usermodal(id: m1['id'], name: m1['name'], email: m1['email'], username: m1['username'], phone: m1['phone'], website: m1['phone'], company: Company.fromJson(m1['company']), address: Address.fromJson(m1['address']));
  }
}

class Address {
  late String street, suite, city, zipcode;
  late Geo geo;

  Address(
      {required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo});

  factory Address.fromJson(Map m1) {
    return Address(
        street: m1['street'],
        suite: m1['suite'],
        city: m1['city'],
        zipcode: m1['zipcode'],
        geo: Geo.fromJson(m1['geo']));
  }
}

class Geo {
  late String lat, lng;

  Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map m1) {
    return Geo(lat: m1['lat'], lng: m1['lng']);
  }
}

class Company {
  late String name, catchPhrase, bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map m1) {
    return Company(
        name: m1['name'], catchPhrase: m1['catchPhrase'], bs: m1['bs']);
  }
}