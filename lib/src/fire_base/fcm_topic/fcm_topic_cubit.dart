// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:core/base_objects/enum/enum_firebase.dart';
// import 'package:core/cache/share_preference_manager.dart';
// import 'package:core/export_packages.dart';
// import 'package:core/utilities/logger/logger.dart';
// import 'package:domain/auth/repository/auth_repo.dart';
// import 'package:farmext/core_ui/extension/context_extension.dart';
// import 'package:farmext/firebase/firebase_fcm.dart';
// import 'package:farmext/global_bloc/auth/auth_bloc.dart';
// import 'package:flutter/material.dart';

// import '../../global_bloc/mixin_support/bloc_mixin.dart';

// part 'fcm_topic_state.dart';

// extension TopicFcmEx on TopicFcm {
//   bool get isMainTopic {
//     return this == TopicFcm.all;
//   }

//   String title(BuildContext context) {
//     switch (this) {
//       case TopicFcm.all:
//         return context.local.allow_notification;
//       case TopicFcm.price:
//         return context.local.price_tilte_cap;
//       case TopicFcm.news:
//         return context.local.news_title_cap;
//       case TopicFcm.eShopOrder:
//         return context.local.order;
//       case TopicFcm.eShopVoucher:
//         return "Voucher";
//       case TopicFcm.eShopProduct:
//         return context.local.eshop_product;
//       case TopicFcm.updateVersion:
//         return context.local.version_update_new_version;
//       case TopicFcm.device:
//         return context.local.device;
//       case TopicFcm.manage:
//         return context.local.manage_title_cap;
//       case TopicFcm.eshop:
//         return context.local.user_eshop_common;
//     }
//   }
// }

// /// Key: isSubscribed, Value: Topic
// // typedef _TopicToggle = MapEntry<bool, TopicFcm>;

// class _TopicToggle {
//   final bool isSubscribed;
//   final TopicFcm topic;

//   _TopicToggle(this.isSubscribed, this.topic);
// }

// class FcmTopicCubit extends Cubit<FcmTopicState> with BlocMixin {
//   static const _topicKey = 'fcm_subscribed_topics';
//   // final _firebaseMessaging = FirebaseMessaging.instance;

//   final SharePreferenceManager _sharedPreferencesManager;
//   final AuthRepo _authRepo;
//   final FirebaseApi _firebaseApi;

//   final AuthBloc _authBloc;
//   StreamSubscription<AuthState>? _authStream;
//   FcmTopicCubit(this._authBloc, this._sharedPreferencesManager, this._authRepo,
//       this._firebaseApi)
//       : super(const FcmTopicInitial(topics: {}, isSystemEnable: false)) {
//     _authStream = _authBloc.stream.listen(
//       (event) {
//         if (event.isAuthenticated) {
//           logger.t('User authenticated, init topics cubit');
//           _initTopicWhenUseAuthenticated();
//         }
//       },
//     );
//   }

//   bool _hasChange = false;

//   void _initTopicWhenUseAuthenticated() async {
//     List<TopicFcm>? subscribedTopics = await _getSubscribedTopics();

//     logger.d("Subscribed topics: $subscribedTopics");

//     /// New user: subscribe to all topics
//     var isNewUser = subscribedTopics == null;

//     /// Check if the user is use topic for the first time
//     bool isTopicEnable = _sharedPreferencesManager.isTopicWasEnable();

//     if (isNewUser || !isTopicEnable) {
//       _saveSubscribedTopics(TopicFcm.values, ignoreAutoHandleFailure: true);
//       _sharedPreferencesManager.confirmTopicHaveBeenEnable();
//     } else {
//       _saveSubscribedTopics(subscribedTopics, ignoreAutoHandleFailure: true);

//       if (!isClosed) {
//         emit(FcmTopicUpdated(
//             topics: subscribedTopics.toSet(),
//             isSystemEnable: state.isSystemEnable));
//       }
//     }
//   }

//   void initWhenOpenNotificationScreen() {
//     _hasChange = false;
//   }

//   /// Re-subscribe to saved topics
//   void reSubscribeTopics() async {
//     /// If have change, do nothing to avoid duplicate subscribe
//     if (_hasChange) return;

//     Set<TopicFcm>? subscribedTopics = (await _getSubscribedTopics())?.toSet();
//     logger.d("Subscribed topics: $subscribedTopics");

//     /// If topics in local store is not null : old user
//     if (subscribedTopics != null) {
//       logger.d("Old user: Already subscribed to topics: $subscribedTopics");

//       /// Subscribe and unsubscribe again to make sure the user is subscribed to the correct topics
//       _saveSubscribedTopics(subscribedTopics.toList());
//       // for (var topic in subscribedTopics) {
//       //   await _subscribeTopic(topic);
//       // }
//       // var unsubscribedTopics = TopicFcm.values
//       //     .where((topic) => !subscribedTopics.contains(topic))
//       //     .toList();
//       // for (var topic in unsubscribedTopics) {
//       //   await _unsubscribeTopic(topic);
//       // }
//     } else {
//       logger.d("New user: Subscribe to all topics");

//       /// New user: subscribe to all topics
//       for (var topic in TopicFcm.values) {
//         await _subscribeTopic(topic);
//       }
//     }
//     // subscribedTopics = await _getSubscribedTopics();
//   }

//   void toggleTopic(bool isSubscribed, TopicFcm topic) {
//     _hasChange = true;
//     if (isSubscribed) {
//       _unsubscribeTopic(topic);
//     } else {
//       _subscribeTopic(topic);
//     }
//   }

//   /// Subscribe to a topic
//   Future<void> _subscribeTopic(TopicFcm topic) {
//     // await _firebaseMessaging.subscribeToTopic(topic.name);
//     logger.i("Subscribed to topic: ${topic.name}");
//     var topics = [...state.topics, topic];
//     return _saveSubscribedTopics(topics,
//         topicToggle: _TopicToggle(true, topic));
//   }

//   /// Unsubscribe from a topic
//   Future<void> _unsubscribeTopic(TopicFcm topic) {
//     // await _firebaseMessaging.unsubscribeFromTopic(topic.name);
//     logger.i("Unsubscribed from topic: ${topic.name}");
//     var listTopic = state.topics.where((t) => t != topic).toList();
//     return _saveSubscribedTopics(listTopic,
//         topicToggle: _TopicToggle(false, topic));
//   }

//   Future<void> _saveSubscribedTopics(List<TopicFcm> updateTopic,
//       {_TopicToggle? topicToggle, bool ignoreAutoHandleFailure = false}) {
//     List<String> topicNames = updateTopic.map((topic) => topic.name).toList();
//     logger.d("Save subscribed topics: $topicNames");

//     String token = _firebaseApi.fCMToken;
//     emit(FcmTopicUpdated(
//         topics: updateTopic.toSet(), isSystemEnable: state.isSystemEnable));
//     return executeRequest(
//       ignoreAutoHandleFailure: ignoreAutoHandleFailure,
//       useCaseCall:
//           _authRepo.updateTopicFcm(topic: updateTopic, fcmToken: token),
//       onSuccess: (entity) async {
//         bool saveLocalSuccess = await _sharedPreferencesManager.saveStringList(
//             _topicKey, topicNames);
//         if (!saveLocalSuccess) {
//           logger.e("Save local topic failed");
//         }
//       },
//       onFailure: (failure) async {
//         Set<TopicFcm> reverseTopic = Set.of(state.topics);
//         if (topicToggle != null) {
//           /// Reverse the topic if the request fails to keep the UI in sync
//           if (topicToggle.isSubscribed) {
//             reverseTopic.remove(topicToggle.topic);
//           } else {
//             reverseTopic.add(topicToggle.topic);
//           }
//         }
//         if (!isClosed) {
//           emit(FcmTopicError(
//               topics: reverseTopic, isSystemEnable: state.isSystemEnable));
//         }
//       },
//     );
//   }

//   Future<List<TopicFcm>?> _getSubscribedTopics() async {
//     List<String>? topicNames =
//         _sharedPreferencesManager.getStringList(_topicKey);
//     try {
//       if (topicNames == null) return null;
//       return topicNames
//           .map((name) =>
//               TopicFcm.values.firstWhere((topic) => topic.name == name))
//           .toList();
//     } catch (e) {
//       logger.e("Error get subscribed topics: $e");
//       return [];
//     }
//   }

//   void toggleSystemStatus(bool isEnable) {
//     emit(FcmTopicUpdated(topics: state.topics, isSystemEnable: isEnable));
//   }

//   @override
//   Future<void> close() {
//     logger.d('AUTH STREAM CLOSE ON FCM TOPIC CUBIT');
//     _authStream?.cancel();
//     return super.close();
//   }
// }
