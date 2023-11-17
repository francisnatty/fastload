import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastload/Screens/chatApp/tryChat.dart';
import 'package:fastload/constants/image.dart';
import 'package:flutter/material.dart';

class mcsreen extends StatefulWidget {
  const mcsreen({Key? key}) : super(key: key);

  @override
  State<mcsreen> createState() => _mcsreenState();
}

class _mcsreenState extends State<mcsreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Chat Screen',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Chat')
              .where('myID', isEqualTo: 0)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else {
              var documents = snapshot.data!.docs;

              if (documents == null) {
                return Text('No messages');
              }
              return ListView.separated(
                  separatorBuilder: ((context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  }),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var id = documents[index]['senderID'];
                    var name = documents[index]['senderName'];

                    var messageid = documents[index].id;

                    return Center(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TryChat(
                                      friendId: id,
                                      messageid: messageid,
                                    )));
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                Image.asset(Images.naijaFlag).image,
                          ),
                          Column(
                            //  mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(id.toString()),
                            ],
                          ),
                        ],
                      ),
                    ));
                  });
            }
          },
        ),
      ),
    );
  }
}
