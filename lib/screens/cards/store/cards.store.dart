import 'package:Flipper_Teste/models/models.dart';
import 'package:Flipper_Teste/repositories/flipper_api_repository.dart';
import 'package:mobx/mobx.dart';

part 'cards.store.g.dart';

class CardsStore extends _CardsStore with _$CardsStore {
  CardsStore(IFlipperApiRepository repository) : super(repository);
}

abstract class _CardsStore with Store {
  IFlipperApiRepository _repository;

  _CardsStore(this._repository) {
    this.init();
  }

  @action
  reset() {
    this.init();
  }

  @action
  init() {
    wealthSummaryResult = new WealthSummary();
  }

  @observable
  WealthSummary? wealthSummaryResult;

  @action
  findGreatherTotal() async {
    this.wealthSummaryResult = await _repository.findGreatherTotal();
  }
}
