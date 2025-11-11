// import 'dart:io';

// class AnalyticsService {
//   static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
//   static final FirebaseAnalyticsObserver _observer =
//       FirebaseAnalyticsObserver(analytics: _analytics);

//   static FirebaseAnalyticsObserver getObserver() => _observer;

//   static Future<void> userLogin({
//     required String loginMethod,
//     required String userName,
//   }) async {
//     var platForm = Platform.operatingSystem;
//     _analytics.setUserId(id: userName);
//     return _analytics.logLogin(loginMethod: loginMethod, parameters: {
//       'platForm': platForm,
//       'userName': userName,
//     });
//   }

//   static Future<void> userSignUp({
//     required String signUpMethod,
//     required String userName,
//     required String fullName,
//   }) async {
//     _analytics.setUserId(id: userName);
//     return _analytics.logSignUp(
//         signUpMethod: signUpMethod,
//         parameters: {'userName': userName, 'fullName': fullName});
//   }

//   static Future<void> setCurrentScreen(
//       String screenName, String screenClassOverride) async {
//     // await _analytics.logScreenView(
//     //   screenName: screenName,
//     //   screenClass: screenClassOverride,
//     //   // screenClassOverride: screenClassOverride,
//     // );
//   }

//   static Future<void> logEvent(
//       {required String screenPath, required String screenName}) async {
//     try {
//       await _analytics.logEvent(
//         name: screenName.isEmpty ? 'detail_router_know_more' : screenName,
//         parameters: {
//           'detail_router': screenPath,
//           "variable": "test tham so",
//         },
//       );

//       _analytics.setUserProperty(
//         name: 'last_alert',
//         value: screenPath,
//       );

//       _analytics.setUserProperty(
//         name: 'detail_router',
//         value: screenPath,
//       );
//     } catch (e) {
//       logger.w(
//           'Analytics logEvent error: ${e.toString()} - screenPath: $screenPath - screenName: $screenName');
//     }
//   }

//   static Future<void> setUserAnalytics(String name) {
//     return _analytics.setUserId(id: name);
//   }
// }
