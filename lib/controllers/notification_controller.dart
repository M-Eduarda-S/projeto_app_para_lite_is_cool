import '../models/notification_model.dart';
import '../models/user_model.dart';
import '../utils/date_utils.dart';

class NotificationController {
  static final NotificationController _instance = NotificationController._internal();
  factory NotificationController() => _instance;
  NotificationController._internal();

  final UserModel user = const UserModel(
    name: 'Juliana Simon',
    role: 'Bolsista',
  );

  final List<NotificationModel> notifications = [
    NotificationModel(
      id: '1',
      title: 'Relatório',
      content: 'Quinta-feira chegou! Vamos anotar tudo que aconteceu neste dia incrível!',
      iconType: 'report',
    ),
    NotificationModel(
      id: '2',
      title: 'Presenças',
      content: 'Os alunos chegaram! Vamos marcas quem veio hoje?',
      iconType: 'attendance',
    ),
    NotificationModel(
      id: '3',
      title: 'Calendário',
      content: 'Que tal dar uma checadinha no que temos para hoje?',
      iconType: 'calendar',
    ),
    NotificationModel(
      id: '4',
      title: 'Fotos',
      content: 'Que tal uns cliques do encontro de hoje? Já tirou as fotos do dia?',
      iconType: 'photos',
    ),
  ];

  String get formattedToday => AppDateUtils.formattedToday;

  void clearAll() {
    notifications.clear();
  }

  void restoreDefaults() {
    if (notifications.isEmpty) {
      notifications.addAll([
        NotificationModel(
          id: '1',
          title: 'Relatório',
          content: 'Quinta-feira chegou! Vamos anotar tudo que aconteceu neste dia incrível!',
          iconType: 'report',
        ),
        NotificationModel(
          id: '2',
          title: 'Presenças',
          content: 'Os alunos chegaram! Vamos marcas quem veio hoje?',
          iconType: 'attendance',
        ),
        NotificationModel(
          id: '3',
          title: 'Calendário',
          content: 'Que tal dar uma checadinha no que temos para hoje?',
          iconType: 'calendar',
        ),
        NotificationModel(
          id: '4',
          title: 'Fotos',
          content: 'Que tal uns cliques do encontro de hoje? Já tirou as fotos do dia?',
          iconType: 'photos',
        ),
      ]);
    }
  }
}
