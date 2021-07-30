import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_bloc_demo/student_bloc/bloc/student_bloc.dart';
import 'package:student_bloc_demo/student_bloc/bloc/student_model.dart';

class CreateStudent extends StatefulWidget {
  final Student? student;
  CreateStudent({this.student});

  @override
  _CreateStudentState createState() => _CreateStudentState();
}

class _CreateStudentState extends State<CreateStudent> {
  final txtStudentId = TextEditingController();
  final txtStudentName = TextEditingController();
  final txtStudentPhoneNum = TextEditingController();
  final txtStudentBranch = TextEditingController();

  @override
  void initState() {
    if (widget.student != null) {
      txtStudentId.text = widget.student!.id.toString();
      txtStudentName.text = widget.student!.name!;
      txtStudentPhoneNum.text = widget.student!.phoneNum!;
      txtStudentBranch.text = widget.student!.brach!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: txtStudentId,
                  decoration: InputDecoration(
                    labelText: "Student Id",
                    hintText: "Student Id",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtStudentName,
                  decoration: InputDecoration(
                    labelText: "Student Name",
                    hintText: "Student Name",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtStudentPhoneNum,
                  decoration: InputDecoration(
                    labelText: "Student Phone",
                    hintText: "Student Phone",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtStudentBranch,
                  decoration: InputDecoration(
                    labelText: "Student Branch",
                    hintText: "Student Branch",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  widget.student != null
                      ? ElevatedButton(
                          onPressed: () {
                            Student pStudent = Student(
                                id: int.parse(txtStudentId.text),
                                name: txtStudentName.text,
                                phoneNum: txtStudentPhoneNum.text,
                                brach: txtStudentBranch.text);
                            StudentBloc _studentBloc =
                                BlocProvider.of<StudentBloc>(context);
                            _studentBloc
                                .add(StudentUpdate(studentObj: pStudent));
                            Navigator.pop(context);
                          },
                          child: Text("Update"))
                      : ElevatedButton(
                          onPressed: () {
                            Student pStudent = Student(
                                id: int.parse(txtStudentId.text),
                                name: txtStudentName.text,
                                phoneNum: txtStudentPhoneNum.text,
                                brach: txtStudentBranch.text);
                            StudentBloc _studentBloc =
                                BlocProvider.of<StudentBloc>(context);
                            _studentBloc
                                .add(StudentCreate(studentObj: pStudent));
                            Navigator.pop(context);
                          },
                          child: Text("Create")),
                ])
              ]),
        ),
      ),
    );
  }
}
