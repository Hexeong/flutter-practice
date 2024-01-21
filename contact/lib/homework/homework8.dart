import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class Homework8 extends StatefulWidget {
  const Homework8({super.key});

  @override
  State<Homework8> createState() => _Homework8State();
}

class _Homework8State extends State<Homework8> {
    getPermission() async {
      var status = await Permission.contacts.status;
      if(status.isGranted) {
        print('허락됨');
        var contacts = await ContactsService.getContacts(withThumbnails: false);
        setState(() {
          info.clear();
          for(var i = 0; i < contacts.length; i++) {
            print(contacts[i].givenName.toString());
            info.add((contacts[i].givenName.toString(), contacts[i].phones![0].value.toString()));
          }
        });
      } else {
        print('거절됨');
        Permission.contacts.request();
    }
  }

  addContacts(name, phone) async {
    print("추가 시작");
    var c = new Contact();
    c.givenName = name;

    var p = new Item();
    p.label = "Phone"; p.value = phone;

    if(c.phones == null) {
      c.phones = [];
      c.phones!.add(p);
    } else {
      c.phones!.add(p);
    }

    await ContactsService.addContact(c);

    setState(() {
      info.add((name, phone));
    });
  }

  deleteContacts(index) async {
    var status = await Permission.contacts.status;
    if(status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts(withThumbnails: false);
      ContactsService.deleteContact(contacts[index]);
      setState(() {
        info.removeAt(index);
      });
    } else {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  var info = [];

  var nameData = TextEditingController();
  var phoneData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(info.length.toString()),
        actions: [
          IconButton(
              onPressed: (){getPermission();},
              icon: Icon(Icons.contacts))
        ],
      ),
      body: ListView.builder(
          itemCount: info.length,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Image.asset("assets/profile.png", width: 30, height: 30,),
              title: Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(info[i].$1 + "(" + info[i].$2 + ")"),
              ),
              trailing: TextButton(
                onPressed: () {
                  setState(() {
                    deleteContacts(i);
                  });
                },
                child: Text("삭제"),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Text('add'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("List 추가"),
                  content: Column(
                    children: [
                      TextField(
                        controller: nameData,
                      ),
                      TextField(
                        controller: phoneData,
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: (){
                          addContacts(nameData.text, phoneData.text);
                          Navigator.pop(context);
                        },
                        child: Text("추가"),
                    ),
                    TextButton(
                      onPressed: (){
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text("취소"),
                    ),
                  ],
                );
              }
          );
        },
      ),
    );
  }
}
