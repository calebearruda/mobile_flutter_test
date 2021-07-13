import 'package:Flipper_Teste/models/models.dart';
import 'package:graphql/client.dart';

abstract class IFlipperApiDataSource {
  Future<WealthSummary?> findGreatherTotal();
}

class FlipperApiDataSource implements IFlipperApiDataSource {
  FlipperApiDataSource(this._client);

  final GraphQLClient _client;

  @override
  Future<WealthSummary?> findGreatherTotal() async {
    try {
      const String query = r'''
        query {
          wealthSummary(order_by: {total: desc}, limit: 1) {
            cdi
            gain
            hasHistory
            id
            profitability
            total
          }
        }
      ''';

      final response = await _client.query(
        QueryOptions(
          document: gql(query),
        ),
      );

      if (response.hasException) throw response.exception!;

      final data = Data.fromJson(response.data!);
      return data.result![0];
    } catch (e) {
      throw e;
    }
  }
}
