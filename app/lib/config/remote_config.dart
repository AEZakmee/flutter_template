import 'package:domain/model/remote_config/feature_favorite.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'constants.dart';

class RemoteConfig {
  RemoteConfig({
    required FirebaseRemoteConfig firebaseRemoteConfig,
  }) : _firebaseRemoteConfig = firebaseRemoteConfig;

  final FirebaseRemoteConfig _firebaseRemoteConfig;

  FeatureFavorite get featureFavorite {
    final typeId = _firebaseRemoteConfig.getInt(
      RemoteConfigConsts.featureFavorite,
    );
    return FeatureFavorite.getType(typeId);
  }
}
