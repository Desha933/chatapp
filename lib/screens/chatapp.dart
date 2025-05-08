import 'package:chatapp/constant.dart';
import 'package:chatapp/models/massage.dart';
import 'package:chatapp/widgets/custombubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  ChatApp([this.documentId]);

  static String id = 'chatapp';
  ScrollController scrollController = ScrollController();

  CollectionReference massages =
      FirebaseFirestore.instance.collection(kMassagesCollection);
  final TextEditingController _controller = TextEditingController();
  String? documentId;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: massages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Massage> massagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            massagelist.add(Massage.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kBottomcolor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(height: 50, image: AssetImage(klogo)),
                  Text(
                    kChatName,
                    style:
                        TextStyle(color: Colors.white, fontFamily: kPacifico),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: massagelist.length,
                      itemBuilder: (context, index) {
                        return CustomBubble(
                          massage: massagelist[index],
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: TextField(
                    onSubmitted: (data) {
                      massages.add({
                        kMassagesCollection: data,
                        kCreatedAt: DateTime.now(),
                      });
                      scrollController.animateTo(
                        0,
                        duration: Duration(microseconds: 1),
                        curve: Curves.easeOut,
                      );

                      _controller.clear();
                    },
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.send),
                      hintText: 'Send Massage',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
