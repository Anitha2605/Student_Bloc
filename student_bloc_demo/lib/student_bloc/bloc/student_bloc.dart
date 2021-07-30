import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:student_bloc_demo/student_bloc/bloc/student_model.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentBlocState> {
  StudentBloc() : super(StudentBlocInitial());

  @override
  Stream<StudentBlocState> mapEventToState(
    StudentEvent event,
  ) async* {
    final listState = state;

    if (event is GetStudentList) {
      if (listState is StudentBlocInitial) {
        yield StudentBlocSucess(studentsList: []);
      }

      if (listState is StudentBlocSucess) {
        yield StudentBlocSucess(studentsList: listState.studentsList);
      }
    } else if (event is StudentCreate) {
      if (listState is StudentBlocSucess) {
        final List<Student> studentsArray =
            List<Student>.from(listState.studentsList!)
              ..insert(0, event.studentObj!);
        yield StudentBlocSucess(studentsList: studentsArray);
      }
    } else if (event is StudentUpdate) {
      if (listState is StudentBlocSucess) {
            final List<Student?> updatedItems =
            List<Student>.from(listState.studentsList!)
                .map((Student item) {
          return item.id == event.studentObj?.id
              ? item.copyWith(id: event.studentObj?.id, name: event.studentObj?.name, phoneNum: event.studentObj?.phoneNum, brach: event.studentObj?.brach)
              : item;
        }).toList();

        yield StudentBlocSucess(studentsList: updatedItems);
      }
    } else if (event is StudentDelete) {
      if (listState is StudentBlocSucess) {
  final List<Student?> updatedItems =
              List<Student>.from(listState.studentsList!)..removeWhere(
                   (item) => item.id == event.studentId);

        yield StudentBlocSucess(studentsList: updatedItems);
      }
    }
  }
}
