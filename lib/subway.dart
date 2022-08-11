import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway/provider.dart';
import 'package:subway/subway_view_model.dart';

import 'debounce.dart';

class Subway extends StatefulWidget {
  const Subway({Key? key}) : super(key: key);

  @override
  State<Subway> createState() => _SubwayState();
}

class _SubwayState extends State<Subway> {
  final _texteditingcontroller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);


  @override
  void dispose() {
    _texteditingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SubwayScreenViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('지하철 앱 연습'),
      ),
      body: Center(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: _texteditingcontroller,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _debouncer.run(()=> viewModel.fetchArrivalLists(_texteditingcontroller.text));
              }
            },
            decoration: InputDecoration(
                hintText: '역이름 입력',
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      viewModel.fetchArrivalLists(_texteditingcontroller.text);
                    });
                  },
                  child: const Icon(Icons.search),
                )),
          ),
        ),
        Expanded(
            child: ListView(
          children: viewModel.modelList.map((SubwayModel arrivalList) {
            return Column(
              children: [
                Text(arrivalList.trainLineNm),
                Text(arrivalList.arvlMsg2),
                const Divider(),
              ],
            );
          }).toList(),
        ))
      ])),
    );
  }
}
