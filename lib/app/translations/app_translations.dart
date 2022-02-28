import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:mobile_attendance/app/utils/key_words.dart';

import 'tr_key_word.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      englishCode: {
        employeeId: employeeId,
        passwordPortal: passwordPortal,
        login: login,
        signInTo: signInTo,
        close: close,
        connectionTimeOut: connectionTimeOut,
        loading: loading,
        successful: successful,
        identifierEmpty: identifierEmpty,
        passwordEmpty: passwordEmpty,
        sorry: sorry,
        home: home,
        more: more,
        checkInOut: checkInOut,
        personalAttendance: personalAttendance,
        scan: scan,
        qrCode: qrCode,
        manualInput: manualInput,
        saleAgentId: saleAgentId,
        view: view,
        attendanceReport: attendanceReport,
        pendingReport: pendingReport,
        language: language,
        accountInfo: accountInfo,
        checkVersion: checkVersion,
        comingSoon: comingSoon,
        password: password,
        role: role,
        name: name,
        department: department,
        logout: logout,
        onTime: onTime,
        late: late,
        early: early,
        checkingYourLocation: checkingYourLocation,
        back: back,
        selectStartDate: selectStartDate,
        selectEndDate: selectEndDate,
        selectStartEndDate: selectStartEndDate,
        noDataReceived: noDataReceived,
        cannotGetLocation: cannotGetLocation,
        resendOrRemoved: resendOrRemoved,
        checkIn: checkIn,
        checkOut: checkOut,
        withInADay: withInADay,
        forTheNextDay: forTheNextDay
      },
      khmerCode: {
        employeeId: "លេខសម្គាល់បុគ្គលិក",
        passwordPortal: "ពាក្យសម្ងាត់ (Portal)",
        login: "ចូល",
        signInTo: "ចូល ទៅ",
        close: "បិត",
        connectionTimeOut: "ការភ្ជាប់បានអស់ពេល",
        loading: "កំពុងដំណើរការ",
        successful: "ជោគជ័យ",
        identifierEmpty: "លេខសម្គាល់បុគ្គលិកមិនអាចទទេបានទេ",
        passwordEmpty: "ពាក្យសម្ងាត់មិនអាចទទេបានទេ",
        sorry: "សូមអភ័យទោស",
        home: "ទំព័រដំបូង",
        more: "ទំព័របន្ថែម",
        checkInOut: "ចូល-ចេញធ្វើការ",
        personalAttendance: "វត្តមាន ផ្ទាល់ខ្លួន",
        scan: "ស្កេន",
        qrCode: "QR កូដ",
        manualInput: "បញ្ចូល",
        saleAgentId: "លេខសម្គាល់ភ្នាក់ងារលក់",
        view: "ពិនិត្យ",
        attendanceReport: "របាយការណ៍ វត្តមាន",
        pendingReport: "សំណើមិនទាន់ផ្ញើ",
        language: "ភាសា",
        accountInfo: "ព័ត៌មានគណនី",
        checkVersion: "ពិនិត្យបច្ចុប្បន្នភាព",
        comingSoon: "ដំណើរការឆាប់ៗនេះ ...!",
        password: "ពាក្យសម្ងាត់",
        role: "តួនាទី",
        name: "ឈ្មោះបុគ្គលិក",
        department: "នាយកដ្ឋាន",
        logout: "ចាកចេញ",
        onTime: "ទាន់ពេល",
        late: "យឺត",
        early: "លឿន",
        checkingYourLocation: "កំពុងពិនិត្យមើលទីតាំងរបស់អ្នក ...",
        back: "ត្រឡប់ក្រោយ",
        selectStartDate: "ជ្រើសរើសកាលបរិច្ឆេទចាប់ផ្តើម",
        selectEndDate: "ជ្រើសរើសកាលបរិច្ឆេទបញ្ចប់",
        selectStartEndDate: "ជ្រើសរើសកាលបរិច្ឆេទចាប់ផ្តើម និងបញ្ចប់",
        noDataReceived: "មិនអាចទទួលបានទិន្នន័យ!",
        cannotGetLocation: "មិនអាចទទួលបានទីតាំង។",
        resendOrRemoved: "ផ្ញើឡើងវិញ ឬលុបចេញ",
        checkIn: "ចូលធ្វើការ",
        checkOut: "ចេញពីធ្វើការ",
        withInADay: "សម្រាប់ថ្ងៃនេះ",
        forTheNextDay: "សម្រាប់ថ្ងៃបន្ទាប់"
      }
    };
  }
}