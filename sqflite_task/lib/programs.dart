import 'package:flutter/material.dart';
import 'program_model.dart';
import 'db_helper.dart';

class Programs extends StatefulWidget {
  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  final ProgramHelper helper = ProgramHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeeee),
      appBar: AppBar(
        title: Text(
          'Compatible Programs',
          textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: ListView.separated(
          itemCount: programList.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('${programList[index].id}'),
              title: Text('${programList[index].value}'),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    programList[index].selected = !programList[index].selected;
                  });
                  helper.insertProgram(Program(
                      id: programList[index].id,
                      value: programList[index].value));
                },
                child: Icon(
                  programList[index].selected
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              // selected: programList[index].selected,
            );
          },
        ),
      ),
    );
  }
}
