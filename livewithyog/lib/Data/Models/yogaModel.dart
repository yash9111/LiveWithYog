import 'dart:convert';
import 'package:http/http.dart' as http;

class Yoga {
  final int id;
  final String englishName;
  final String sanskritNameAdapted;
  final String sanskritName;
  final String translationName;
  final String poseDescription;
  final String poseBenefits;
  final String urlSvg;
  final String urlPng;
  final String urlSvgAlt;

  Yoga({
    required this.id,
    required this.englishName,
    required this.sanskritNameAdapted,
    required this.sanskritName,
    required this.translationName,
    required this.poseDescription,
    required this.poseBenefits,
    required this.urlSvg,
    required this.urlPng,
    required this.urlSvgAlt,
  });

  factory Yoga.fromJson(Map<String, dynamic> json) {
    return Yoga(
      id: json['id'],
      englishName: json['english_name'],
      sanskritNameAdapted: json['sanskrit_name_adapted'],
      sanskritName: json['sanskrit_name'],
      translationName: json['translation_name'],
      poseDescription: json['pose_description'],
      poseBenefits: json['pose_benefits'],
      urlSvg: json['url_svg'],
      urlPng: json['url_png'],
      urlSvgAlt: json['url_svg_alt'],
    );
  }
}

