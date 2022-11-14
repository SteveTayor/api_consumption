// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:api_consumption/models/article_model.dart';
import 'package:api_consumption/network/network_enums.dart';
import 'package:api_consumption/network/network_helpers.dart';
import 'package:api_consumption/network/network_service.dart';
import 'package:api_consumption/static/static_values.dart';
import 'package:flutter/material.dart';

import '../network/query_parameter.dart';
import 'article.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;

  @override
  initState() {
    // at the beginning, all users are shown
    data = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Articles'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.none &&
                snapshot.hasData) {
              final List<Article> articles = snapshot.data as List<Article>;
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return ApiCalling(article: articles[index]);
                }),
                itemCount: articles.length,
              );
            } else if (snapshot.hasError) {
              // print('Error is $snapshot');
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 28,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(snapshot.error.toString()),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<List<Article>?> getData() async {
    final response = await NetworkService.sendRequest(
      requestType: RequestType.get,
      url: StaticValues.apiUrl,
      queryParam: QP.apiQP(
        apiKey: StaticValues.apiKey,
        country: StaticValues.apiCountry,
      ),
    );
    print(response?.statusCode);
    return NetworkHelper.filterResponse(
        callBack: _listOfArticlesFromJson,
        response: response,
        parameterName: CallBackParameterName.articles,
        onFailureCallBackWithMessage: (errorType, msg) {
          print('Error type=$errorType - Message $msg');
          return null;
        });
  }

  List<Article> _listOfArticlesFromJson(json) => (json as List)
      .map((e) => Article.fromJson(e as Map<String, dynamic>))
      .toList();
}
