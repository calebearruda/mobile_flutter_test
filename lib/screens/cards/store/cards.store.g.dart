// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardsStore on _CardsStore, Store {
  final _$wealthSummaryResultAtom =
      Atom(name: '_CardsStore.wealthSummaryResult');

  @override
  WealthSummary? get wealthSummaryResult {
    _$wealthSummaryResultAtom.reportRead();
    return super.wealthSummaryResult;
  }

  @override
  set wealthSummaryResult(WealthSummary? value) {
    _$wealthSummaryResultAtom.reportWrite(value, super.wealthSummaryResult, () {
      super.wealthSummaryResult = value;
    });
  }

  final _$findGreatherTotalAsyncAction =
      AsyncAction('_CardsStore.findGreatherTotal');

  @override
  Future findGreatherTotal() {
    return _$findGreatherTotalAsyncAction.run(() => super.findGreatherTotal());
  }

  final _$_CardsStoreActionController = ActionController(name: '_CardsStore');

  @override
  dynamic reset() {
    final _$actionInfo =
        _$_CardsStoreActionController.startAction(name: '_CardsStore.reset');
    try {
      return super.reset();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic init() {
    final _$actionInfo =
        _$_CardsStoreActionController.startAction(name: '_CardsStore.init');
    try {
      return super.init();
    } finally {
      _$_CardsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wealthSummaryResult: ${wealthSummaryResult}
    ''';
  }
}
