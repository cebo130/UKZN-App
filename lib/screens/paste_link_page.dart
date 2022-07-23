import 'package:flutter/material.dart';


//import '../downloader.dart';
class PasteLinkPage extends StatefulWidget {
  const PasteLinkPage({Key? key}) : super(key: key);

  @override
  _PasteLinkPageState createState() => _PasteLinkPageState();
}

class _PasteLinkPageState extends State<PasteLinkPage> {
  TextEditingController _textController = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height:30),
            TextFormField(
                focusNode: myFocusNode,
              controller: _textController,
          decoration: InputDecoration(
           // hintText: 'Paste Link here...',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            labelText: "Paste Link here...", labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Colors.orange : Colors.grey
          ),
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            ),)),

            SizedBox(height:30),
            ElevatedButton(

              onPressed: () {
                if(_textController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please paste link"),backgroundColor: Colors.grey,));
                }else{
                  //Download().downloadVideo(_textController.text.trim(), "All Vid Downloader.");
                }
                _textController.text = "";
              },

              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
                shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(200, 60), //////// HERE
              ),
              child: Text("Download Video", style: TextStyle(color:Colors.white, fontSize:20)),
            ),
          ],
        )
      ),
    );
  }
}
