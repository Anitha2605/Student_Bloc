import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_bloc_demo/student_bloc/bloc/student_bloc.dart';

import 'create_update_student.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StudentBloc? _studentBloc;

  @override
  void initState() {
    super.initState();

    _studentBloc = BlocProvider.of<StudentBloc>(context);
    _studentBloc?.add(GetStudentList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<StudentBloc, StudentBlocState>(
        builder: (context, state) {
          if (state is StudentBlocInitial) {
            return Center(
              child: Text('Loading..'),
            );
          } else if (state is StudentBlocEoor) {
            return Center(
              child: Text('Something went wrong..'),
            );
          } else if (state is StudentBlocSucess) {
            return ListView.separated(
              itemCount: state.studentsList!.length,
              separatorBuilder: (context, index) =>
                  Container(color: Colors.black, height: 1),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.studentsList![index]!.name.toString()),
                      Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CreateStudent(
                                        student: state.studentsList![index])));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                      SizedBox(width: 10),
                      IconButton(
                          onPressed: () {
                            _studentBloc?.add(StudentDelete(
                                studentId: state.studentsList![index]!.id));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.blue,
                          )),
                    ],
                  ),
                );
              },
            );
          }

          return Center(
            child: Text('Loading..'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CreateStudent()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
