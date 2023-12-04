import 'package:flutter/material.dart';

class MessageTile extends StatefulWidget {
  final String studentProfileImage;
  final String studentName;
  final String message;
  final String reply;
  final String time;
  final bool isReply;
  final bool isRead; // Add isRead property

  const MessageTile({
    Key? key,
    required this.studentProfileImage,
    required this.studentName,
    required this.message,
    required this.reply,
    required this.time,
    required this.isReply,
    required this.isRead, // Pass isRead
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          print('Read');

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: InkWell(
                  onTap: () {
                    // Visit User Profile(student profile)
                  },
                  child:  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.amber,
                    child: CircleAvatar(
                      radius: 33,
                      backgroundImage: NetworkImage(
                        // user profile image address
                        widget.studentProfileImage,
                      ),
                    ),
                  ),
                ),
                title: Container(
                  //color: widget.isRead ? Colors.white : Colors.amber.shade50, // Example highlighting
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.studentName),
                ),
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(widget.message),
                      ),
                      Visibility(
                        visible: widget.isReply,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text('Your Reply :- \n\n${widget.reply}'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      obscureText: false,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Write Reply...',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: () {
                            // Send message.
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                          child: Text(
                            'Read',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.isRead ? Colors.white : Colors.amber.shade200, // Example highlighting
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                spreadRadius: 0.0,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.green,
              ),
              child:  CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white54,
                child: CircleAvatar(
                  radius: 33,
                  backgroundImage: NetworkImage(
                    widget.studentProfileImage,
                  ),
                ),
              ),
            ),
            title: Text(widget.studentName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text(
              widget.message,
              style: const TextStyle(color: Colors.black45, fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(widget.time),
          ),
        ),
      ),
    );
  }
}
