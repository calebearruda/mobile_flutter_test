import 'package:Flipper_Teste/datasources/flipper_api_datasource.dart';
import 'package:Flipper_Teste/repositories/flipper_api_repository.dart';
import 'package:Flipper_Teste/screens/cards/cards.screen.dart';
import 'package:Flipper_Teste/screens/cards/store/cards.store.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  GraphQLClient? _client;
  IFlipperApiDataSource? _flipperApiDataSource;
  IFlipperApiRepository? _flipperApiRepository;

  @override
  void initState() {
    final Link _link = HttpLink(
      'https://harura-fliper-test.herokuapp.com/v1/graphql',
      defaultHeaders: {
        'x-hasura-admin-secret': dotenv.env['SECRET_HASURA']!,
      },
    );

    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );

    _flipperApiDataSource = FlipperApiDataSource(_client!);
    _flipperApiRepository = FlipperApiRepository(_flipperApiDataSource!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => CardsStore(_flipperApiRepository!),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Milliard',
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
              color: Color.fromRGBO(59, 92, 184, 1),
            ),
            headline2: TextStyle(
              fontSize: 18,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(59, 92, 184, 1),
            ),
            headline3: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(59, 92, 184, 1),
            ),
            bodyText1: TextStyle(
              fontSize: 17,
              letterSpacing: 0.6,
              color: Color.fromRGBO(96, 99, 119, 1),
            ),
          ),
          shadowColor: const Color.fromRGBO(154, 163, 188, 1),
        ),
        home: CardsScreen(),
      ),
    );
  }
}
