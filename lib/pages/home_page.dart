import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../servives/http_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  void _apiGetList() {
    Network.GET(Network.API_GET_LIST, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiCreateUser(User user1) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(user1))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiUpdateUser(User user1) {
    Network.PUT(Network.API_UPDATE + user1.id.toString(),
            Network.paramsUpdate(user1))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiDeleteUser(User user1) {
    Network.DELETE(Network.API_DELETE + user1.id.toString(),
            Network.paramsDelete())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response1) {
    setState(() {
      data = response1;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    var user = new User(id: 1, name: "Muhammad", salary: "10200", age: "999");

    super.initState();
    //_apiGetList();
    //_apiCreateUser(user);
    _apiUpdateUser(user);
    //_apiDeleteUser(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          //child: Text(data ?? "No data"),
          child: Text(
            data != null ? data : "No data",
            style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
