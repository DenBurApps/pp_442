import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pp_442/features/hobbies/domain/entities/completed_hobby/completed_hobby.dart';

class CompletedHobbyCubit extends Cubit<List<CompletedHobby>> {
  final Box<CompletedHobby> _box;

  CompletedHobbyCubit({
    required Box<CompletedHobby> box,
  })  : _box = box,
        super([]) {
    readAll();
  }

  Future<void> create(CompletedHobby completedHobby) async {
    await _box.put(completedHobby.id, completedHobby);
    emit([...state, completedHobby]);
  }

  void readAll() => emit(_box.values.toList());

  Future<void> update(CompletedHobby completedHobby) async {
    await _box.put(completedHobby.id, completedHobby);
    final updatedState = state
        .map((t) => t.id == completedHobby.id ? completedHobby : t)
        .toList();
    emit(updatedState);
  }

  Future<void> delete(CompletedHobby completedHobby) async {
    await _box.delete(completedHobby.id);
    final updatedState = state.where((t) => t.id != completedHobby.id).toList();
    emit(updatedState);
  }
}
