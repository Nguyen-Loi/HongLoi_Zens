import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  Api(this.pathCollection) {
    ref = FirebaseFirestore.instance.collection(pathCollection);
  }
  final String pathCollection;
  late CollectionReference ref;

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Future<String?> addDocument(Map data) async {
    try {
      Map<String, Object> newData = Map.from(data);
      ref.add(newData);
      log('Thêm data thành công vào bảng $pathCollection');
      return null;
    } catch (e) {
      log('Thêm data thất bại: $e');
      return 'Đã có lỗi xãy ra';
    }
  }

  Future<String?> updateDocument(Map data, {required String id}) async {
    try {

      await ref.doc(id).update(Map.from(data));
      return null;
    } catch (e) {
      return 'Có lỗi xãy ra khi cập nhật thông tin';
    }
  }

}
