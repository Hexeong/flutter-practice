import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key,});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Store2>().getData();
    print(context.read<Store2>().profileImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<Store1>().name),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset("assets/blank_profile.png", height: 70, width: 70,),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    width: 200,
                    child: Text("팔로워 ${context.watch<Store2>().follower}명",),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<Store2>().Follow();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                      ),
                      child: Text("팔로우")
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (c, i) => Container(child: Image.network(context.read<Store2>().profileImage[i]),),
                childCount: context.read<Store2>().profileImage.length
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)
          )
          // Container(
          //   child: Column(
          //     children: [
          //       GridView.builder(
          //            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //            itemCount: context.read<Store2>().profileImage.length,
          //            itemBuilder: (c, i) {
          //              return Container(color: Colors.grey,);
          //            }
          //        ) CustomScrollView를 같이 안쓰면 위와 같이 쓰면 됨
          //     ],
          //   ),
          // )
        ],
      )
    );
  }
}
