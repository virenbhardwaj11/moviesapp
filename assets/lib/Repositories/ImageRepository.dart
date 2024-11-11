import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Imagemodel.dart';

class ImageRepository {
  final String apiUrl = 'https://pixabay.com/api/?key=21449781-36365976501da12c601fc9577&q=video+games&image_type=photo';

  Future<List<ImageData>> fetchImages() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List images = jsonData['hits'];

      return images.map((data) => ImageData.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
