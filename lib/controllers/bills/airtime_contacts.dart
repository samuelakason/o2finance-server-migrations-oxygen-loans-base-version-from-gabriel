import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AirtimeContactsController extends GetxController {
  final TextEditingController contactTextEditingController =
      TextEditingController();
  List<Contact>? contacts = [];
  List<Contact>? contactsFiltered = [];
  String currentDialed = "";
  File? imgFile;
  String appTheme = "";
  bool contactPermission = false;
  bool isSearching = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    contactTextEditingController.addListener(() {
      filterContacts();
    });
    checkStateOfPermissions();
    isSearching = contactTextEditingController.text.isNotEmpty;
  }

  filterContacts() {
    List<Contact>? _contacts = [];
    _contacts.addAll(contacts!.toList());
    if (contactTextEditingController.text.isNotEmpty) {
      _contacts.retainWhere((element) {
        String searchterm = contactTextEditingController.text.toLowerCase();
        String displayUserName = element.displayName!.toLowerCase();
        return displayUserName.contains(searchterm);
      });

      contactsFiltered = _contacts;
      update();
    }
  }

  Future<void> getContacts() async {
    final List<Contact> _contacts = (await ContactsService.getContacts(
      withThumbnails: false,
      photoHighResolution: false,
    ))
        .toList();

    contacts = _contacts;
    update();
  }

  checkStateOfPermissions() async {
    var _contacts = await Permission.contacts.status;

    if (_contacts.isDenied) {
      contactPermission = false;
      requestPermission();
    }
    if (_contacts.isGranted) {
      getContacts();
      contactPermission = true;
    }
  }

  Future<void> requestPermission() async {
    if (contactPermission == false) {
      await Permission.contacts.request();
      var check = await Permission.contacts.status;
      checkStateOfPermissions();
    }
  }
}
