class Gloosary {
  static DateTime date = DateTime.now();
  static String today = "";
  static String month = "";

  static String morning_evening =
      (date.hour > 0 && date.hour < 12) ? "صباح الخير" : "مساء الخير";

  static String? getDay(DateTime time) {
    switch (time.weekday) {
      case 1:
        return "الاثنين";

      case 2:
        return "الثلاثاء";

      case 3:
        return "الاربعاء";

      case 4:
        return "الخميس";

      case 5:
        return "الجمعة";

      case 6:
        return "السبت";

      case 7:
        return "الاحد";

      default:
        return "";
    }
  }

  static String? getMonth(DateTime time) {
    switch (time.month) {
      case 1:
        return "يناير";

      case 2:
        return "فبراير";

      case 3:
        return "مارس";

      case 4:
        return "ابريل";

      case 5:
        return "مايو";

      case 6:
        return "يونيو";

      case 7:
        return "يوليو";

      case 8:
        return "اغسطس";

      case 9:
        return "سبتمبر";

      case 10:
        return "اكتوبر";

      case 11:
        return "نوفمبر";

      case 12:
        return "ديسمبر";

      default:
        return "";
    }
  }
}
