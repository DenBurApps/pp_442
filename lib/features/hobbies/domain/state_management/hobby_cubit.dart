import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby/hobby.dart';

class HobbyCubit extends Cubit<List<Hobby>> {
  final Box<Hobby> _box;

  HobbyCubit({
    required Box<Hobby> box,
  })  : _box = box,
        super([]) {
    readAll();
  }

  Future<void> create(Hobby hobby) async {
    await _box.put(hobby.id, hobby);
    emit([...state, hobby]);
  }

  void readAll() => emit(_box.values.toList());

  Future<void> update(Hobby hobby) async {
    await _box.put(hobby.id, hobby);
    final updatedState =
        state.map((t) => t.id == hobby.id ? hobby : t).toList();
    emit(updatedState);
  }

  Future<void> delete(Hobby hobby) async {
    await _box.delete(hobby.id);
    final updatedState = state.where((t) => t.id != hobby.id).toList();
    emit(updatedState);
  }
}
