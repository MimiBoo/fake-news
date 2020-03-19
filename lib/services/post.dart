import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake/models/post.dart';

class PostService {
  // collection reference
  final userCollection = Firestore.instance.collection('Posts');

  // create new user or update existing
  Future updateUserData(
      String title, String content, String time, String posterUid) async {
    return await userCollection.document().setData({
      'title': title,
      'content': content,
      'time': time,
      'posterUid': posterUid,
    });
  }
}
