import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oxygen_loans/services/app_exceptions.dart';

class ApiService {
  Future<dynamic> get(
      String url, Map<String, String> headers, http.Client client) async {
    try {
      http.Response response = await client.get(
        Uri.parse(url),
        headers: headers,
      );
      debugPrint(response.body);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw response.body;
      }

      return response;
    } on SocketException {
      throw FetchDataException;
    }
  }

  Future<dynamic> post(
      String url, Map payload, apiHeaders, http.Client client) async {
    try {
      String body = jsonEncode(payload);
      http.Response response =
          await client.post(Uri.parse(url), headers: apiHeaders, body: body);
      debugPrint(response.body);
      if (response.statusCode < 200 ||
          response.statusCode > 299 ||
          response.statusCode == 203) {
        throw response.body;
      }

      return response;
    } on SocketException {
      throw FetchDataException;
    }
  }

  Future<dynamic> delete(
      String url, Map payload, apiHeaders, http.Client client) async {
    try {
      String body = jsonEncode(payload);
      http.Response response =
          await client.delete(Uri.parse(url), body: body, headers: apiHeaders);
      debugPrint(response.body);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw response.body;
      }

      return response;
    } on SocketException {
      throw FetchDataException;
    }
  }

  Future<dynamic> patch(
      String url, Map payload, apiHeaders, http.Client client) async {
    try {
      String body = jsonEncode(payload);
      http.Response response =
          await client.patch(Uri.parse(url), headers: apiHeaders, body: body);
      debugPrint(response.body);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw response.body;
      }

      return response;
    } on SocketException {
      throw FetchDataException;
    }
  }

  Future<dynamic> put(
      String url, Map payload, apiHeaders, http.Client client) async {
    try {
      String body = jsonEncode(payload);
      http.Response response =
          await client.put(Uri.parse(url), headers: apiHeaders, body: body);
      debugPrint(response.body);
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw response.body;
      }

      return response;
    } on SocketException {
      throw FetchDataException;
    }
  }
}
