import 'package:hive/hive.dart';

part 'theme_type_cache.g.dart';

@HiveType(typeId: 1)
enum ThemeTypeCache {
  @HiveField(0)
  light,
  @HiveField(1)
  dark
}
