import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pp_442/features/hobbies/domain/entities/hobby_time/hobby_time.dart';

class HobbyTimeCubit extends Cubit<List<HobbyTime>> {
  final Box<HobbyTime> _box;

  HobbyTimeCubit({
    required Box<HobbyTime> box,
  })  : _box = box,
        super([]) {
    readAll();
  }

  Future<void> create(HobbyTime hobbyTime) async {
    await _box.put(hobbyTime.id, hobbyTime);
    emit([...state, hobbyTime]);
  }

  void readAll() => emit(_box.values.toList());

  Future<void> delete(HobbyTime hobbyTime) async {
    await _box.delete(hobbyTime.id);
    final updatedState = state.where((t) => t.id != hobbyTime.id).toList();
    emit(updatedState);
  }
}
