import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TryChat extends StatefulWidget {
  const TryChat({super.key, required int friendId, required String messageid});

  @override
  State<TryChat> createState() => _TryChatState();
}

class _TryChatState extends State<TryChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Chat')
              .where(
                'senderID',
                isEqualTo: 1,
              )
              .where('myID', isEqualTo: 0)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              var dcuments = snapshot.data!.docs;

              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: dcuments.length,
                    itemBuilder: (context, index) {
                      var docId = dcuments[index].id;

                      return StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Chat')
                            .doc(docId)
                            .collection('messages')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            var messages = snapshot.data!.docs;
                            // String message = '';

                            List<QueryDocumentSnapshot> documents =
                                snapshot.data!.docs;
                            for (var document in documents) {
                              //accessing fields in the documents;
                              var message =
                                  document.data() as Map<String, dynamic>;
                              //  String msg = message['message'];
                              var id = message['senderID'];
                              if (id == '2') {
                                return Text('');
                              } else {
                                return Text('');
                              }
                            }

                            return Center(child: Text(''));

                            // return ListView.builder(
                            //     itemCount: messages.length,
                            //     itemBuilder: (context, index) {
                            //       print(messages[index].id);
                            //       List<QueryDocumentSnapshot> documents =
                            //           snapshot.data!.docs;

                            //     });
                          } else if (snapshot.hasError) {
                            print('error');
                            return Text(snapshot.error.toString());
                          } else {
                            return Text('poor');
                          }
                        },
                      );
                    });
              } else {
                return Center(
                  child: Text('No Messages'),
                );
              }
            } else {
              return Center(child: Text('poor internet'));
            }
          },
        ),
      ),
    );
  }
}
