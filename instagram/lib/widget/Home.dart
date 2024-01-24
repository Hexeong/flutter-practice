import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram/widget/Profile.dart';

import '../style/homeStyle.dart' as style;

class Home extends StatefulWidget {
  const Home({super.key, this.list, this.moreData});
  final list;
  final moreData;


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if(scroll.position.pixels == scroll.position.maxScrollExtent) {
        widget.moreData();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(widget.list.length != 0) {
      return Theme(
        data: style.theme,
        child: Container(
          child: ListView.builder(
              controller: scroll,
              itemCount: widget.list.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.list[i]["image"],
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("좋아요 "+widget.list[i]["likes"].toString()+"  "+widget.list[i]["date"], style: Theme.of(context).textTheme.bodyText2,),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => Profile(),
                                      transitionsBuilder: (c, a1, a2, child) => 
                                          FadeTransition(opacity: a1, child: child,),
                                      transitionDuration: Duration(milliseconds: 500)
                                    )
                                  );
                                      // CupertinoPageRoute(builder: (c) => Profile(username: widget.list[i]["user"],)));
                                      // MaterialPageRoute(builder: (c) => Profile(username: widget.list[i]["user"],))); 이동 애니메이션이 단조로움
                                },
                                child: Text(widget.list[i]["user"],),
                              ),
                              Text(widget.list[i]["content"])
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      );
    } else {
      return Theme(
          data: style.theme,
          child: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
      );
    }
  }
}

// return FutureBuilder(
//     future: widget.list,
//     builder: (context, snapshot) {
//       if(snapshot.hasData) {
//         return Theme(
//           data: style.theme,
//           child: Container(
//             child: ListView.builder(
//                 controller: scroll,
//                 itemCount: widget.list.length,
//                 itemBuilder: (context, i) {
//                   return ListTile(
//                     title: Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.network(widget.list[i]["image"], height: 300, width: double.infinity,),
//                           Container(
//                             width: double.infinity,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("좋아요 "+widget.list[i]["likes"].toString()+"  "+widget.list[i]["date"], style: Theme.of(context).textTheme.bodyText2,),
//                                 Text(widget.list[i]["user"]),
//                                 Text(widget.list[i]["content"])
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//             ),
//           ),
//         );
//       }
//       return Theme(
//           data: style.theme,
//           child: Container(
//             alignment: Alignment.center,
//             child: CircularProgressIndicator(),
//           )
//       );
//     }
// );