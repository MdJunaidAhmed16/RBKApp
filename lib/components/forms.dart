// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  FormScreen({Key? key}) : super(key: key);

  get onPressed => null;
  final TextEditingController _areaController = TextEditingController();
  String dropdownvalue1 = "Paddy";
  var items1 = [
    'Paddy',
    'Wheat',
    'Ladies Finger',
    'Tomato',
    'Sugarcane',
  ];
  // String? value1;
  // String dropdownvalue2="Paddy vari1";
  // var items2=[
  //   "Pd1",
  //   "Pd2",
  // ];
  Widget _buildName() {
    return Container(
      child: Row(children: [
        const Text(
          "Name",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          width: 60,
        ),
        DropdownButton(
          value: dropdownvalue1,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items1.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue1 = newValue!;
            });
          },
        ),
      ]),
    );
  }

  // Widget _buildVariety(){
  //   return Container(
  //       child: Row(children: [
  //         Text("Variety"),
  //         SizedBox(width: 60,),
  //         DropdownButton(
  //             value: dropdownvalue2,
  //             icon: Icon(Icons.keyboard_arrow_down),
  //             items: items2.map((String items) {
  //                       return DropdownMenuItem(
  //                         value: items,
  //                         child: Text(items),
  //                       );
  //                     }).toList(),
  //             onChanged: (String? newValue){
  //               setState((){
  //                 dropdownvalue1=newValue!;
  //               });
  //             }
  //           ),
  //       ]),
  //   );
  // }
  Widget _buildArea() {
    return Row(
      children: [
        SizedBox(
          width: 60,
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: _areaController,
          decoration: InputDecoration(
            hintText: 'In hectres',
          ),
        ),
      ],
    );
  }

  // Widget _buildSeed(){
  //   return null;
  // }
  // Widget _buildStage(){
  //   return null;
  // }
  // Widget _buildPest(){
  //   return null;
  // }
  // Widget _buildRecomm(){
  //   return null;
  //
  //
  //
  // Widget _buildRecomm(){
  //   return null;}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Report")),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              _buildName(),
              SizedBox(
                height: 20,
              ),
              // _buildVariety(),
              SizedBox(
                height: 10,
              ),
              _buildArea(),
              // _buildSeed(),
              // _buildStage(),
              // _buildPest(),
              // _buildRecomm(),
              SizedBox(
                height: 100,
              ),
              // ignore: deprecated_member_use
              //_buildSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
