import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';
import 'package:pp_442/features/hobbies/domain/state_management/completed_hobby_cubit.dart';

class HobbyCubit extends Cubit<List<Hobby>> {
  final Box<Hobby> box;
  final CompletedHobbyCubit completedHobbyCubit;

  HobbyCubit({
    required this.box,
    required this.completedHobbyCubit,
  }) : super([]) {
    readAll();
  }

  Future<void> create(Hobby hobby) async {
    await box.put(hobby.id, hobby);
    emit([...state, hobby]);
  }

  void readAll() => emit(box.values.toList());

  Future<void> update(Hobby hobby) async {
    await box.put(hobby.id, hobby);
    final updatedState =
        state.map((t) => t.id == hobby.id ? hobby : t).toList();
    emit(updatedState);
  }

  Future<void> delete(Hobby hobby) async {
    final completedHobbies =
        completedHobbyCubit.state.where((e) => e.hobbyId == hobby.id);
    for (final completedHobby in completedHobbies) {
      completedHobbyCubit.delete(completedHobby);
    }
    await box.delete(hobby.id);
    final updatedState = state.where((t) => t.id != hobby.id).toList();
    emit(updatedState);
  }
}
