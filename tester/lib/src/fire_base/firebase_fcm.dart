// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// enum _FcmType {
//   onMessageOpenedApp,
//   initMessage,
// }

// abstract final class NotificationManager {
//   static const platform = MethodChannel("com.farmext.app/notification");

//   static Future<void> clearBadge() async {
//     try {
//       var result = await platform.invokeMethod('clearBadge');
//       logger.t("Clear app badge result: $result");
//     } on PlatformException catch (e) {
//       logger.e("Failed to clear app badge: '${e.message}'.");
//     }
//   }
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   String? _fCMToken;

//   String get fCMToken => _fCMToken ?? "";

//   Future<AuthorizationStatus> checkNotificationPermission() async {
//     NotificationSettings settings =
//         await _firebaseMessaging.getNotificationSettings();

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       logger.i('User has granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       logger.i('User has provisional permission');
//     } else {
//       logger.i('User has not granted permission');
//     }
//     return settings.authorizationStatus;
//   }

//   Future<void> requestUserPermission() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       logger.i('User granted permission');
//     } else {
//       logger.i(
//           'User declined or has not yet responded to the permission request');
//     }
//   }

//   Future<void> initNotification() async {
//     try {
//       await _firebaseMessaging.requestPermission();
//       _fCMToken = await _firebaseMessaging.getToken();
//       logger.f("Firebase token: $_fCMToken");
//       _initPushNotification();
//     } catch (e) {
//       logger.e(e);
//     }
//     // _subscribeTopic(TopicFcm.all);
//     logger.i(">>==== Firebase message init completed ====<<");
//   }

//   static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
//     // logger.w(["onBackgroundMessage: ", message]);
//     debugPrint("onBackgroundMessage: $message");
//   }

//   void _handleForegroundMessage(RemoteMessage? message) {
//     if (message == null) return;
//     var body = message.notification?.body;
//     var title = message.notification?.title;
//     logger.f([
//       "Push notification Foreground message: $message",
//       "Title: $title",
//       "Body: $body"
//     ]);
//     BuildContext? currentContext = RouteService.getNavigateContext;
//     if (currentContext == null) {
//       logger.e(["Current context is null"]);
//       return;
//     }
//     if (title == null && body == null) return;
//     if (isAndroid) {
//       _showFcmSnackbar(
//           currentContext: currentContext,
//           title: title,
//           body: body,
//           onTap: () {
//             _routerToScreen(message.data, currentContext);
//           });
//     }
//   }

//   ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showFcmSnackbar(
//       {required BuildContext currentContext,
//       String? title,
//       String? body,
//       void Function()? onTap}) {
//     return currentContext.showBlurSnackbar(
//         title: title ?? currentContext.local.notification_title_cap,
//         message: body,
//         onTap: onTap);
//   }

//   void _handleMessageOnInitOrOpenApp(RemoteMessage? message, _FcmType type) {
//     if (message == null) return;
//     logger.f(["** $type **  Push notification message: $message"]);
//     BuildContext? currentContext = RouteService.getNavigateContext;
//     if (currentContext == null) {
//       logger.e(["Current context is null"]);
//       Future.delayed(const Duration(milliseconds: 100), () {
//         currentContext = RouteService.getNavigateContext;
//         if (currentContext != null) {
//           _routerToScreen(message.data, currentContext!);
//         }
//       });
//       return;
//     }

//     var data = message.data;
//     _routerToScreen(data, currentContext);
//   }

//   void _routerToScreen(Map<String, dynamic> data, BuildContext currentContext) {
//     logger.f(["Data from push notification: $data"]);
//     try {
//       NotificationItemEntity notificationItem =
//           NotificationItemModel.fromJson(data['announcement']).toEntity();
//       notificationItem.typePage.pushToPage(
//         currentContext,
//         item: notificationItem,
//       );
//       getIt<NotificationBloc>()
//           .add(NotificationSeenEvent(id: notificationItem.id));
//     } catch (e) {
//       logger.e(e);
//       logger.e("data['announcement']: ${data['announcement']}");
//       // currentContext.goNamed(HomeSession.notification.name);
//       currentContext
//           .read<HomeRouteProvider>()
//           .switchHomeView(currentContext, session: HomeSession.notification);
//     }
//   }

//   /// Function to initialize background settings
//   Future _initPushNotification() async {
//     try {
//       await FirebaseMessaging.instance
//           .setForegroundNotificationPresentationOptions(
//               alert: true, badge: true, sound: true);

//       /// Handle foreground message
//       FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

//       /// Handle notification if the app was terminated and now opened
//       FirebaseMessaging.instance.getInitialMessage().then((message) =>
//           _handleMessageOnInitOrOpenApp(message, _FcmType.initMessage));
//       FirebaseMessaging.onMessageOpenedApp.listen((message) =>
//           _handleMessageOnInitOrOpenApp(message, _FcmType.onMessageOpenedApp));
//       FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
//     } catch (e) {
//       logger.e("Init push notification error $e");
//     }
//   }

//   /// Unused function
//   Future<void> deleteToken() {
//     logger.f("Firebase token deleted");
//     return _firebaseMessaging.deleteToken();
//   }
// }

// // https://firebase.flutter.dev/docs/messaging/usage

// // State	            Description

// // Foreground	        When the application is open, in view & in use.
// // Background	        When the application is open, however in the background (minimised). This typically occurs when the user has pressed the "home" button on the device, has switched to another app via the app switcher or has the application open on a different tab (web).
// // Terminated	        When the device is locked or the application is not running. The user can terminate an app by "swiping it away" via the app switcher UI on the device or closing a tab (web).


