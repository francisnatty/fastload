import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastload/Screens/chatApp/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/image.dart';

class TryChat extends StatefulWidget {
  const TryChat(
      {Key? key,
      required this.friendId,
      required this.chatId,
      required this.friendName})
      : super(key: key);

  final String chatId;
  final String friendId;
  final String friendName;

  @override
  State<TryChat> createState() => _TryChatState();
}

class _TryChatState extends State<TryChat> {
  bool? hasChatted;
  var docId;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(Images.userAvatar),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              widget.friendName,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Chat')
                    .doc(widget.chatId)
                    .collection('messages')
                    .orderBy('timestamp', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData) {
                    //var messages = snapshot.data!.docs;
                    if (snapshot.data!.docs.isNotEmpty)
                      hasChatted = true;
                    else
                      hasChatted = false;

                    List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: documents.length,
                        itemBuilder: (context, index) {
                          print(documents[index]['photo']);
                          String message = documents[index]['message'];
                          var senderID = documents[index]['senderId'];
                          Timestamp timestamp = documents[index]['timestamp'];
                          DateTime date = timestamp.toDate();
                          String formattedDate =
                              "${date.hour} : ${date.minute}";

                          String photo = documents[index]['photo'];
                          // String photo = '';

                          if (senderID == '0') {
                            return _buildMessageRow(
                                photo, message, true, formattedDate);
                          } else {
                            return _buildMessageRow(
                                photo, message, false, formattedDate);
                          }
                        },
                      ),
                    );

                    //     });
                  } else if (snapshot.hasError) {
                    print('error');
                    return Text(snapshot.error.toString());
                  } else {
                    return Text('poor');
                  }
                },
              ),
              _buildBottomBar(context),
            ],
          )),
    );
  }

  Container _buildBottomBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(children: [
        Icon(
          Icons.photo_album_outlined,
          size: 30,
        ),
        SizedBox(
          width: 15,
        ),
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
            if (hasChatted != null && hasChatted == true) {
              MessageService()
                  .sendMessage(widget.chatId, 'thanks..catch you later');
            } else {
              MessageService().firstTimeMessage('0', 'see you later');
            }
          },
          icon: const Icon(Icons.send),
          color: Colors.red,
        )
      ]),
    );
  }

  Row _buildMessageRow(
      String photo, String message, bool current, String date) {
    return Row(
      mainAxisAlignment:
          current ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          current ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: current ? 30.0 : 20),
        if (!current) ...[
          CircleAvatar(
            backgroundImage: AssetImage(Images.naijaFlag),
            // backgroundImage: AssetImage(current ? avatars[0] : avatars[1]),
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
                        photo.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  message,
                                  style: TextStyle(
                                      color: current
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SizedBox(
                                  height: 200, width: 200,

                                  //  width: MediaQuery.sizeOf(context).width / 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      photo,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                date,
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
            backgroundImage: AssetImage(Images.userAvatar),
            radius: 10.0,
          )
        ],
        SizedBox(
          width: current ? 20 : 30,
        )
      ],
    );
  }
}
