import 'package:my_app/features/auth/auth_view.dart';
import 'package:my_app/features/consultation/consultation_view.dart';
import 'package:my_app/features/patient_details/patient_details_view.dart';
import 'package:my_app/features/patients/patients_view.dart';
import 'package:my_app/services/authentication_service.dart';
import 'package:my_app/services/database_service.dart';
import 'package:my_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_app/ui/views/home/home_view.dart';
import 'package:my_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AuthView),
    MaterialRoute(page: PatientsView),
    MaterialRoute(page: PatientDetailsView),
    MaterialRoute(page: ConsultationView),
  ],
  dependencies: [
    InitializableSingleton(classType: AuthenticationService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}
