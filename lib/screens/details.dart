import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailScreen extends StatefulWidget {
   DetailScreen({required this.datadetails}) ;
  StudenDataModel datadetails;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // https://drive.google.com/drive/folders/1TCXA8qIEHxoDhcpARlUFBIuJH3AQ-v2t
  getimage ()async{
   var respons= await Dio().get("https://drive.google.com/drive/folders/1TCXA8qIEHxoDhcpARlUFBIuJH3AQ-v2t");
   print(respons.data);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getimage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("details"),
      ),
      body:  Column(
        children: [
          Text(widget.datadetails.name ?? ""),
          ListView.builder(
            shrinkWrap: true,
              itemCount: widget.datadetails.scores ?.length,
              itemBuilder: (context,i){
                return Row(
                  children: [
                    Text(widget.datadetails.scores ?[i].type == Type.EXAM ?"Exam":widget.datadetails.scores ?[i].type==Type.QUIZ ?"Quiz":"Homework"),
                    Text((widget.datadetails.scores?[i].score ??"").toString()),
                  ],
                );
              })
        ],
      ),

    );
  }
}
