import 'dart:io';

import 'package:dio/dio.dart';
import 'package:otaqu_test/constant.dart';
import 'package:otaqu_test/model/models.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part 'local/db.dart';
part 'local/dao/destination_dao.dart';
part 'local/repository/destination_repository.dart';
part 'api/avail_services.dart';
part 'api/bearer_services.dart';
part 'api/destination_services.dart';