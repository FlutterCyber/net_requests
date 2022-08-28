import 'package:flutter/material.dart';
import 'package:net_requests/model/emplist_model.dart';
import 'package:net_requests/model/empone_model.dart';

import '../model/emp_model.dart';
import '../model/user_model.dart';
import '../servives/http_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];

  String data = "";

  void _apiEmpList() {
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMP_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  // void _apiCreateUser(User user1) {
  //   Network.POST(Network.API_CREATE, Network.paramsCreate(user1))
  //       .then((response) => {
  //             print(response),
  //             _showResponse(response!),
  //           });
  // }
  //
  // void _apiUpdateUser(User user1) {
  //   Network.PUT(Network.API_UPDATE + user1.id.toString(),
  //           Network.paramsUpdate(user1))
  //       .then((var response) => {
  //             print(response),
  //             _showResponse(response!),
  //           });
  // }
  //
  // void _apiDeleteUser(User user1) {
  //   Network.DELETE(
  //           Network.API_DELETE + user1.id.toString(), Network.paramsDelete())
  //       .then((response) => {
  //             print(response),
  //             _showResponse(response!),
  //           });
  // }

  void _showResponse(String response) {
    if (response.isEmpty) {
      EmpList emplist = Network.parseEmpList(response);
      // EmpOne empone = Network.parseEmpOne(response);
      // print("Salary is: ${empone.data.employee_salary}");
      setState(() {
        items = emplist.data;
      });
    } else {
      print("TRY AGAIN!!!");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    //var user = new User(id: 1, name: "Muhammad", salary: "10200", age: "999");
    super.initState();
    _apiEmpList();
    //_apiEmpOne(4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, i) {
            return itemsOflist(items[i]);
          },
        ),
      ),
    );
  }

  Widget itemsOflist(Employee emp) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emp.employee_name + ": " + emp.employee_age.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            emp.employee_salary.toString() + "\$",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
