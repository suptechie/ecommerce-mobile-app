/*
 *   Webkul Software.
 *   @package Mobikul Application Code.
 *   @Category Mobikul
 *   @author Webkul <support@webkul.com>
 *   @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *   @license https://store.webkul.com/license.html
 *   @link https://store.webkul.com/license.html
 */

import 'dart:developer';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../utils/app_global_data.dart';
import '../utils/server_configuration.dart';
import '../utils/shared_preference_helper.dart';

String appDocPath = "";

class GraphQlApiCalling {
  final loggerLink = LoggerLink();
  final authLink = AuthLink(
    getToken: appStoragePref.getCustomerToken,
  );


  GraphQLClient clientToQuery() {
    final httpLink =
    HttpLink(baseUrl, defaultHeaders: {
      "Cookie": appStoragePref.getCookieGet(),
      "x-currency": GlobalData.currencyCode,
      "x-locale": GlobalData.locale
    });


    log("authLink---->${appStoragePref.getCustomerToken()}");
    log("headers ----> ${httpLink.defaultHeaders}");
    log("baseUrl ----> $baseUrl");
    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      queryRequestTimeout: const Duration(seconds: 40),
      link: loggerLink.concat(authLink.concat(httpLink)),
    );
  }
}

class LoggerLink extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) {
    log("\nOperation -> ${request.operation}\n\n");
    return forward!(request);
  }
}
