part of 'student_bloc.dart';

@immutable
abstract class StudentBlocState extends Equatable {
const StudentBlocState();

  @override
  List<Object> get props => [];
}

class StudentBlocInitial extends StudentBlocState {

}

class StudentBlocSucess extends StudentBlocState {
 final List<Student?>? studentsList;
 const StudentBlocSucess({this.studentsList});

@override
  List<Object> get props => [studentsList!];
}

class StudentBlocEoor extends StudentBlocState {
final String? errorMessge;
StudentBlocEoor({this.errorMessge});
}
