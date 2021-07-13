import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlipperCard extends StatelessWidget {
  final double? total;
  final double? monthProfitability;
  final double? cdi;
  final double? monthGain;

  FlipperCard({
    Key? key,
    this.total,
    this.monthProfitability,
    this.cdi,
    this.monthGain,
  }) : super(key: key);

  Widget _buildLine(context, String subtitle, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14, right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _percentFormatter =
        NumberFormat.decimalPercentPattern(locale: 'pt_BR', decimalDigits: 3);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 30, 24, 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Seu resumo',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Icon(
                  Icons.more_vert,
                  size: 24,
                  color: Color.fromRGBO(154, 163, 188, 1),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: Column(
                  children: [
                    Text(
                      'Valor investido',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        NumberFormat.currency(
                          locale: 'pt_BR',
                          symbol: 'R\$',
                        ).format(total),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _buildLine(
              context,
              'Rentabilidade/mês',
              _percentFormatter.format((monthProfitability! / 100)),
            ),
            _buildLine(
              context,
              'CDI',
              _percentFormatter.format(cdi! / 100),
            ),
            _buildLine(
              context,
              'Ganho/mês',
              NumberFormat.currency(
                locale: 'pt_BR',
                symbol: 'R\$',
              ).format(monthGain),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Divider(
                color: Color.fromRGBO(154, 163, 188, 1),
                height: 0.5,
                endIndent: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                  elevation: 2,
                  side: const BorderSide(
                    color: Color.fromRGBO(59, 92, 184, 1),
                    width: 1,
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  'VER MAIS',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
