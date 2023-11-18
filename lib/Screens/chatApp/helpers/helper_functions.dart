import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  Future<void> sendMessage(String senderID, String message) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference colRef = await firestore.collection('Chat');
    DocumentReference docRef = await colRef.add({
      'senderID': '0',
      'receiverID': '1',
    });

    await firestore
        .collection('Chat')
        .doc(docRef.id)
        .collection('messages')
        .doc()
        .set({
      'message': message,
      'senderId': '0',
      'timestamp': FieldValue.serverTimestamp()
    }).then((value) {
      print('sent data scucessfully');
    });
  }
}
