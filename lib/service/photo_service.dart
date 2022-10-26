import 'package:homework2/models/photo.dart';
import 'package:homework2/service/api_service.dart';
import 'package:image_picker/image_picker.dart';

import '../models/User.dart';

extension PhotoService on APIService {
  Future<Photo> uploadPhoto({
    required XFile file,
  }) async {
    final result = await request(path: '/api/upload', file: file);
    final photo = Photo.fromJson(result);

    return photo;
  }
}