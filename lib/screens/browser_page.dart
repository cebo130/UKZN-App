import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:webview_flutter/webview_flutter.dart';



//import '../downloader.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({Key? key}) : super(key: key);

  @override
  _BrowserPageState createState() => _BrowserPageState();
}
class _BrowserPageState extends State<BrowserPage> {
  //late BannerAd bannerAd;
  //bool isLoaded=false;
  //start*******************
  late BannerAd bannerAd;
  bool isLoaded=false;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3875532731600828/6950838343",//done
      listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isLoaded=true;
            });
            print("succes");
          },
          onAdFailedToLoad: (ad, error){
            ad.dispose();
          }
      ),
      request: AdRequest(),
    );
    bannerAd.load();
  }
  //end*********************
  final link = "https://sc.ukzn.ac.za/Achievements/Results.aspx";
  String changed = "UKZN - App";
  WebViewController? _controller;
  bool _showDialogButton = false;
  void checkUrl()async{
    if(await _controller!.currentUrl() == "https://learn2022.ukzn.ac.za/"){
      setState(() {
        _showDialogButton = false;
      });
    }
    //mine

    else{
      setState(() {
        _showDialogButton = true;
      });
    }
  }
  bool showWidget = false;
  bool _isShow = false;
  bool show=false;
  String hold = "";

  String? currentUrl="";
  void main2() async {
    Future<String?> stringFuture = _getMockData();
    currentUrl = await stringFuture;
    print(currentUrl); // will print one on console.

  }
  Future<String?> _getMockData() {
    return Future.value(_controller!.currentUrl());
  }
  bool marks = false;
  bool back = false;
  void showIt(){
    if(currentUrl == "https://sc.ukzn.ac.za/Achievements/ClassMarks.aspx/"){
      show=true;
    }else if(currentUrl == "https://sc.ukzn.ac.za/Achievements/Results.aspx/"){
      show=true;
    }else if(currentUrl == "https://sc.ukzn.ac.za/Home/StudentHome.aspx/"){
  show=true;
  }
  }
  @override
  Widget build(BuildContext context) {

    //final AdWidget adWidget = AdWidget(ad: myBanner);
    //checkUrl();
    return WillPopScope(
      onWillPop: ()async {
        if(await _controller!.canGoBack()){
          _controller!.goBack();
          //mine

        }
        return false;
      },

      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(30.0),
          child: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text(
                "$changed",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
            leading: back ? IconButton(
              onPressed: (){
                _controller?.loadUrl("https://learn2022.ukzn.ac.za");
              },
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
            ): Container(),
          ),
        ),
        endDrawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/uk.png"),
                      scale: 1,)
                ),
                child: Text("",style: TextStyle(color: Colors.lightBlueAccent,fontSize: 19),),
              ),
              ListTile(
                title: Center(child: Text(
                    "Ukzn-App",
                  style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),
                ),),
                onTap: (){
                  showToast();
                },
              ),
              SizedBox.shrink(),
              Divider(color:Colors.grey),
              ListTile(
                leading: const Icon(Icons.import_contacts),
                title: Center(child: const Text(
                  'Learn - 2022',
                  style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent),
                )),
                iconColor: Colors.lightBlueAccent,
                onTap: () {
                  setState(() {
                    changed = "Learn 2022";
                    show=false;
                    back=false;
                  });
                  _controller?.loadUrl("https://learn2022.ukzn.ac.za");
                  Navigator.pop(context);
                },
              ),
              Divider(color:Colors.grey,),
              ListTile(
                leading: const Icon(Icons.check_box),
                title: Center(child: const Text(
                  'Final Results',
                  style: TextStyle(fontSize: 19,color: Colors.lightBlueAccent),
                )),
                iconColor: Colors.lightBlueAccent,
                onTap: () {
                  setState(() {
                    changed = "Final Results";
                    showIt();
                    back=true;

                    print("here it iz**********************");
                    //print(currentUrl().toString());
                    currentUrl = "https://sc.ukzn.ac.za/Achievements/Results.aspx";
                    main2();

                  });
                  _controller?.loadUrl("https://sc.ukzn.ac.za/Achievements/Results.aspx");
                  //////////////////////////https://facebook.com/groups/353907292165476/
                  Navigator.pop(context);
                },
              ),

              Divider(color:Colors.grey,),
              ListTile(
                leading: const Icon(Icons.check_circle),
                title: Center(child: const Text(
                  'Class Marks',
                  style: TextStyle(fontSize: 19,color: Colors.lightBlueAccent),
                )),
                iconColor: Colors.lightBlueAccent,
                onTap: () {
                  setState(() {
                    changed = "Class Marks";
                    showIt();
                    back=true;
                  });
                  _controller?.loadUrl("https://sc.ukzn.ac.za/Achievements/ClassMarks.aspx");
                  Navigator.pop(context);
                },
              ),
              Visibility(
                visible: _isShow,
                child: Column(
                  children: [

                    /*Visibility(
                      visible: _isShow,
                      child: Text("clicked"),
                    ),*/

                    Divider(color:Colors.grey,),
                    ListTile(
                      leading: const Icon(Icons.facebook_outlined),
                      title: Center(child: const Text(
                        'Main Campus Page',
                        style: TextStyle(fontSize: 19,color: Colors.lightBlueAccent),
                      )),
                      iconColor: Colors.lightBlueAccent,
                      onTap: () {
                        setState(() {
                          changed = "MainCampus Page";
                          back=true;
                        });
                        _controller?.loadUrl("https://facebook.com/groups/353907292165476/");
                        //////////////////////////https://facebook.com/groups/353907292165476/
                        Navigator.pop(context);
                      },
                    ),

                    Divider(color:Colors.grey,),
                    ListTile(
                      leading: const Icon(Icons.account_tree_outlined),
                      title: Center(child: const Text(
                        'Application Status Check',
                        style: TextStyle(fontSize: 19,color: Colors.pinkAccent),
                      )),
                      iconColor: Colors.pinkAccent,
                      onTap: () {
                        setState(() {
                          changed = "Application Status Check";
                          back=true;
                        });
                        _controller?.loadUrl("https://caocheck.ukzn.ac.za/Start.aspx");
                        Navigator.pop(context);
                      },
                    ),
                    //start**********************************************
                    Divider(color:Colors.grey,),
                    ListTile(
                      leading: const Icon(Icons.account_tree_outlined),
                      title: Center(child: const Text(
                        'Student Enabler',
                        style: TextStyle(fontSize: 19,color: Colors.lightBlueAccent),
                      )),
                      iconColor: Colors.lightBlueAccent,
                      onTap: () {
                        setState(() {
                          changed = "Student Enabler";
                          back=true;
                        });
                        _controller?.loadUrl("https://erpweb.ukzn.ac.za/pls/ukznint/w99pkg.mi_login");
                        Navigator.pop(context);
                      },
                    ),
                    Divider(color:Colors.grey,),
                    ListTile(
                      leading: const Icon(Icons.account_tree_outlined),
                      title: Center(child: const Text(
                        'Timetabling & Venue Booking',
                        style: TextStyle(fontSize: 16,color: Colors.lightBlueAccent),
                      )),
                      iconColor: Colors.lightBlueAccent,
                      onTap: () {
                        setState(() {
                          changed = "Timetabling & Venue Booking";
                          back=true;
                        });
                        _controller?.loadUrl("http://timetable.ukzn.ac.za/2013CALENDAR.aspx");
                        Navigator.pop(context);
                      },
                    ),
                    //start**********************************************
                    Divider(color:Colors.grey,),
              ListTile(
                leading: const Icon(Icons.contact_mail_outlined),
                title: Center(child: const Text(
                  'Developer Details',
                  style: TextStyle(fontSize: 19,color: Colors.lightBlueAccent),
                )),
                iconColor: Colors.lightBlueAccent,
                onTap: () {
                  setState(() {
                    changed = "Developer Details";
                    back=true;
                  });
                  _controller?.loadUrl("https://alldownloader.site/cebo/");
                  Navigator.pop(context);
                },
              ),
                  ],
                ),
              ),
              Container(
                //color: Colors.white,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                  ),
                  onPressed: () {
                    setState(
                          () {
                        _isShow = !_isShow;
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20,),
                      Text(
                        _isShow ? 'Show Less' : 'Show More',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        _isShow ? Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

            ],


          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    child: WebView(
                      initialUrl: link,
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller){
                        setState((){
                          _controller = controller;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
              Positioned(
                top: 485,
              left: 10,
              child: Container(
                height: 50,
                width: 340,
                child: isLoaded ? Container(height:50,child: AdWidget(ad: bannerAd),) : Text("loading...",style: TextStyle(color: Colors.lightBlue,)),
              ),
            )
          ],
        ),
        /*floatingActionButton:_showDialogButton == false ? Container() : FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed:()async{
            final url = await _controller!.currentUrl();
            final title = await _controller!.getTitle();
            print(title);
            /*Download().downloadVideo(
              url!, "$title"
            );*/
          },
          child: Icon(Icons.download),
        ),*/
        floatingActionButton: show ? FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed:()async{
            setState(() {

              if(changed == "Class Marks"){
                hold = "https://sc.ukzn.ac.za/Achievements/Results.aspx";
                changed = "Final Results";
                _controller?.loadUrl(hold);
                marks = false;
                back=true;
              }else if(changed == "Final Results"){
                hold = "https://sc.ukzn.ac.za/Achievements/ClassMarks.aspx";
                changed = "Class Marks";
                _controller?.loadUrl(hold);
                marks = true;
                back=true;
              }
            });
          },
          icon: const Icon(Icons.remove_red_eye_outlined,color: Colors.lightBlue,),
          label: marks ? Text('View Results',style: TextStyle(color: Colors.lightBlue),) : Text('View Marks',style: TextStyle(color: Colors.lightBlue),) ,
        ) : Container() ,
      ),
    );
  }
  void showToast() => Fluttertoast.showToast(
    msg: "Rotate your Phone to log in to learn",
    fontSize: 20,
    backgroundColor: Colors.lightBlue,
    textColor: Colors.green,
  );
}
