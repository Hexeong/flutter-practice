import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../style/homeStyle.dart' as style;

class Home extends StatefulWidget {
  const Home({super.key, this.list});
  final list;

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
        print("맨 밑까지 내려감");
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if(widget.list != null) {
      return Theme(
        data: style.theme,
        child: Container(
          child: ListView.builder(
              controller: scroll,
              itemCount: 3,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(widget.list[i]["image"], height: 300, width: double.infinity,),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("좋아요 "+widget.list[i]["likes"].toString()+"  "+widget.list[i]["date"], style: Theme.of(context).textTheme.bodyText2,),
                              Text(widget.list[i]["user"]),
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