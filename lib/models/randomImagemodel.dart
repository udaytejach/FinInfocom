// To parse this JSON data, do
//
//     final randomImages = randomImagesFromJson(jsonString);

import 'dart:convert';

RandomImages randomImagesFromJson(String str) =>
    RandomImages.fromJson(json.decode(str));

String randomImagesToJson(RandomImages data) => json.encode(data.toJson());

class RandomImages {
  String message;
  String status;

  RandomImages({
    required this.message,
    required this.status,
  });

  factory RandomImages.fromJson(Map<String, dynamic> json) => RandomImages(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
