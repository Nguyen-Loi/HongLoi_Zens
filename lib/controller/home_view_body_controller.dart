import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter_zens/app/info_device.dart';
import 'package:test_flutter_zens/app/methods.dart';
import 'package:test_flutter_zens/controller/base_controller.dart';
import 'package:test_flutter_zens/model/joke.dart';
import 'package:test_flutter_zens/service/api.dart';

class HomeViewBodyController extends BaseController {
  bool isFinish = false;

  int currentIndex = 0;

  String deviceID = '';

  List<Map<String, Object>> dataVote = [];

  void init() async {
    InfoDevice info = InfoDevice();
    await info
        .initPlatformState()
        .whenComplete(() => deviceID = info.deviceID.values.first);
  }

  @override
  Future<QuerySnapshot<Object?>?>? loadData() async {
    Api apiJoke = Api('Joke');

    return apiJoke.getDataCollection();
  }

  List<JokeModel> get list => data.map((e) => JokeModel(e)).toList();

  void voteSubmit(bool isFunny) {
    if (!isFinish) {
      currentIndex += 1;
      dataVote.add({
        'deviceID': deviceID,
        'JokeID': list[currentIndex].id,
        'isFunny': isFunny
      });

      if (currentIndex == list.length - 1) {
        isFinish = true;
        voteData(isFunny);
      }
    }
  }

  void voteData(bool isFunny) async {
    QuerySnapshot<Map<String, dynamic>> dataByDeviceID = await FirebaseFirestore
        .instance
        .collection('Vote')
        .where('deviceID', isEqualTo: deviceID)
        .get();

    if (dataByDeviceID.docs.isEmpty) {
      _insert();
    } else {
      _update(data: dataByDeviceID);
    }
  }

  void _insert() async {
    Api api = Api('Vote');
    for (int i = 0; i < dataVote.length; i++) {
      await api.addDocument(dataVote[i]);
    }
  }

  void _update({required QuerySnapshot<Map<String, dynamic>> data}) async {
    Api api = Api('Vote');
    List<Map<String, dynamic>> listVote = data.toListMap();
    for (int i = 0; i < listVote.length; i++) {
      String currentVoteID = Methods.getString(listVote[i], 'id');
      await api.updateDocument(dataVote[i], id: currentVoteID);
    }
  }
}
