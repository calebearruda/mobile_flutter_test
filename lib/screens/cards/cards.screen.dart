import 'package:Flipper_Teste/screens/cards/store/cards.store.dart';
import 'package:Flipper_Teste/screens/cards/widgets/flipper_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CardsScreenState();
  }
}

class _CardsScreenState extends State<CardsScreen> {
  CardsStore? _store;

  @override
  void didChangeDependencies() {
    _store ??= Provider.of<CardsStore>(context);
    _store?.findGreatherTotal();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _store?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 235, 246, 1),
      body: Observer(builder: (_) {
        return _store!.wealthSummaryResult!.id != null
            ? Center(
                child: FlipperCard(
                  total: _store!.wealthSummaryResult!.total,
                  cdi: _store!.wealthSummaryResult!.cdi,
                  monthGain: _store!.wealthSummaryResult!.gain,
                  monthProfitability:
                      _store!.wealthSummaryResult!.profitability,
                ),
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}
