// part of 'fcm_topic_cubit.dart';

// @immutable
// sealed class FcmTopicState extends Equatable {
//   final Set<TopicFcm> topics;
//   final bool isSystemEnable;

//   bool isSubscribed(TopicFcm topic) => topics.contains(topic);

//   bool get isMainTopicEnable {
//     return topics.contains(TopicFcm.all);
//   }

//   const FcmTopicState({required this.topics, required this.isSystemEnable});
//   @override
//   List<Object?> get props => [topics, isSystemEnable];
// }

// final class FcmTopicInitial extends FcmTopicState {
//   const FcmTopicInitial({required super.topics, required super.isSystemEnable});
// }

// final class FcmTopicUpdated extends FcmTopicState {
//   const FcmTopicUpdated({required super.topics, required super.isSystemEnable});
// }

// final class FcmTopicError extends FcmTopicState {
//   const FcmTopicError({required super.topics, required super.isSystemEnable});
// }
