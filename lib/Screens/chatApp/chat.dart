import 'dart:math';

import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController? controller;
  final List<String> avatars = [Images.userAvatar, Images.naijaFlag];
  final List<Message> messages = [
    Message(user: 0, description: 'My name is francis Natty'),
    Message(
        user: 0,
        description:
            'and i am a student of federal univeristy of technology minna'),
    Message(user: 1, description: 'Nice to meet you'),
    Message(user: 1, description: 'I am Zainab from Lapai'),
    Message(user: 0, description: 'its really nice hearing from you'),
  ];

  final rand = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(children: [
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  Message m = messages[index];
                  if (m.user == 0) return _buildMessageRow(m, current: true);
                  return _buildMessageRow(m, current: false);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: messages.length)),
        _buildBottomBar(context)
      ]),
    );
  }

  Row _buildMessageRow(Message message, {required bool current}) {
    return Row(
      mainAxisAlignment:
          current ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: current ? 30.0 : 20),
        if (!current) ...[
          CircleAvatar(
            backgroundImage: AssetImage(current ? avatars[0] : avatars[1]),
            radius: 20.0,
          ),
          const SizedBox(
            width: 5.0,
          )
        ],
        //chat bubbles
        Container(
          padding: const EdgeInsets.only(bottom: 5, right: 5),
          child: Column(
            crossAxisAlignment:
                current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    minHeight: 40,
                    maxHeight: 250,
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                    minWidth: MediaQuery.of(context).size.width * 0.1),
                decoration: BoxDecoration(
                    color: current ? Colors.red : Colors.grey.withOpacity(0.2),
                    borderRadius: current
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20))
                        : const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 5, right: 5),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: current
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            message.description,
                            style: TextStyle(
                                color: current ? Colors.white : Colors.black),
                          ),
                        ),
                        const Icon(
                          Icons.done_all,
                          size: 14,
                        )
                      ]),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "2:02",
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              )
            ],
          ),
        ),
        if (current) ...[
          const SizedBox(
            width: 5.0,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(current ? avatars[0] : avatars[1]),
            radius: 10.0,
          )
        ],
        SizedBox(
          width: current ? 20 : 30,
        )
      ],
    );
  }

  Container _buildBottomBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Row(children: [
        Expanded(
          child: TextField(
            textInputAction: TextInputAction.send,
            controller: controller,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Aa'),
          ),
        ),
        IconButton(
          onPressed: () async {
            // FirebaseFirestore firestore = FirebaseFirestore.instance;
            // CollectionReference colRef = await firestore.collection('Chat');
            // DocumentReference docRef = await colRef.add({
            //   'senderID': 2,
            //   'myID': 0,
            // });

            // await firestore
            //     .collection('Chat')
            //     .doc(docRef.id)
            //     .collection('messages')
            //     .doc()
            //     .set({
            //   'message': 'haha,dude!!',
            // }).then((value) {
            //   print('sent data scucessfully');
            // });
            FirebaseFirestore firestore = FirebaseFirestore.instance;
            QuerySnapshot querySnapshot = await firestore
                .collection('Chat')
                .where('senderID', isEqualTo: 2)
                .where('myID', isEqualTo: 0)
                .get();

            if (querySnapshot.docs.isNotEmpty) {
              print(true);
              querySnapshot.docs.forEach((doc) async {
                QuerySnapshot querySnapshot = await firestore
                    .collection('Chat')
                    .doc(doc.id)
                    .collection('messages')
                    .get();

                List<QueryDocumentSnapshot> documents = querySnapshot.docs;
                for (var document in documents) {
                  //accessing fields in the documents;
                  var message = document.data();
                  print(message);
                }
              });
            } else {
              print(false);
            }

            // print(data);
          },
          icon: const Icon(Icons.send),
          color: Colors.red,
        )
      ]),
    );
  }
}

class Message {
  final int user;
  final String description;

  Message({
    required this.user,
    required this.description,
  });
}
