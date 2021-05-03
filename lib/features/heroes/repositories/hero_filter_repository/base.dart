import 'package:rick_and_morty_wiki/domain/hero.dart';

abstract class HeroFilterRepository {
  Future<List<AliveState>> getSelectedAliveStates();

  Future toggleAliveState(AliveState state);

  Future<List<Sex>> getSelectedSex();

  Future toggleSex(Sex sex);
}
