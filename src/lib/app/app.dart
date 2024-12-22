import 'package:my_app/features/consultation/consultation_view.dart';
import 'package:my_app/features/patient_details/patient_details_view.dart';
import 'package:my_app/features/patients/patients_view.dart';
import 'package:my_app/services/consultation_service.dart';
import 'package:my_app/services/patient_service.dart';
import 'package:my_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: PatientsView, initial: true),
    MaterialRoute(page: PatientDetailsView),
    MaterialRoute(page: ConsultationView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: PatientService),
    LazySingleton(classType: ConsultationService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
  ],
)
class App {}
