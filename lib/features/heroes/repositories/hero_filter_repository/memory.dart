import 'package:rick_and_morty_wiki/domain/hero.dart';
import 'package:rick_and_morty_wiki/features/heroes/repositories/hero_filter_repository/base.dart';

class HeroFilterRepositoryInMemory extends HeroFilterRepository {
  final List<AliveState> _selectedAliveStates = [];
  final List<Sex> _selectedSexes = [];

  @override
  Future<List<AliveState>> getSelectedAliveStates() {
    return Future.value(_selectedAliveStates);
  }

  @override
  Future toggleAliveState(AliveState state) async {
    if (_selectedAliveStates.contains(state)) {
      _selectedAliveStates.remove(state);
    } else {
      _selectedAliveStates.add(state);
    }
  }

  @override
  Future<List<Sex>> getSelectedSex() {
    return Future.value(_selectedSexes);
  }

  @override
  Future toggleSex(Sex state) async {
    if (_selectedSexes.contains(state)) {
      _selectedSexes.remove(state);
    } else {
      _selectedSexes.add(state);
    }
  }
}
