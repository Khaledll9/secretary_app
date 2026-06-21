import '../../domain/entities/my_courses_course.dart';
import '../../domain/repositories/my_courses_repository.dart';

final _fakeCourses = [
  MyCoursesCourse(
    id: 1,
    title: 'دورة أساسيات البرمجة بلغة بايثون',
    description:
        'تعلم أساسيات البرمجة باستخدام لغة بايثون من الصفر حتى الاحتراف. تشمل الدورة مفاهيم البرمجة الأساسية، المتغيرات، الحلقات، والدوال.',
    category: 'دورة',
    tag: 'تقنية معلومات',
    price: '1500',
    duration: '8 أسابيع',
    startDate: '2026-06-01',
    endDate: '2026-07-27',
    photoUrl: null,
    isActive: true,
    isAvailable: true,
    isLiked: true,
    departmentName: 'تقنية معلومات',
    instituteName: 'معهد اليمن التقني',
  ),
  MyCoursesCourse(
    id: 2,
    title: 'دبلوم إدارة الأعمال',
    description:
        'برنامج دبلوم شامل في إدارة الأعمال يغطي التخطيط الاستراتيجي، إدارة الموارد البشرية، والتسويق الرقمي.',
    category: 'دبلوم',
    tag: 'إدارة أعمال',
    price: '3500',
    duration: '6 أشهر',
    startDate: '2026-09-01',
    endDate: '2027-03-01',
    photoUrl: null,
    isActive: false,
    isAvailable: true,
    isLiked: false,
    departmentName: 'إدارة أعمال',
    instituteName: 'معهد اليمن التقني',
  ),
  MyCoursesCourse(
    id: 3,
    title: 'دورة تصميم واجهات المستخدم UI/UX',
    description:
        'تعلم تصميم واجهات المستخدم وتجربة المستخدم باستخدام Figma. تشمل الدورة أساسيات التصميم، إنشاء النماذج الأولية، واختبار usability.',
    category: 'دورة',
    tag: 'تصميم',
    price: '1200',
    duration: '5 أسابيع',
    startDate: '2026-07-15',
    endDate: '2026-08-18',
    photoUrl: null,
    isActive: true,
    isAvailable: true,
    isLiked: false,
    departmentName: 'تصميم جرافيك',
    instituteName: 'أكاديمية عدن للتدريب',
  ),
  MyCoursesCourse(
    id: 4,
    title: 'دبلوم تطوير تطبيقات الجوال',
    description:
        'دبلوم متكامل في تطوير تطبيقات Android و iOS باستخدام Flutter. يشمل قواعد البيانات، API، ونشر التطبيقات.',
    category: 'دبلوم',
    tag: 'تقنية معلومات',
    price: '4500',
    duration: '9 أشهر',
    startDate: '2026-10-01',
    endDate: '2027-07-01',
    photoUrl: null,
    isActive: false,
    isAvailable: false,
    isLiked: true,
    departmentName: 'تقنية معلومات',
    instituteName: 'معهد اليمن التقني',
  ),
  MyCoursesCourse(
    id: 5,
    title: 'دورة اللغة الإنجليزية للمبتدئين',
    description:
        'دورة شاملة لتعلم اللغة الإنجليزية من المستوى المبتدئ إلى المتوسط. تركز على المحادثة والقواعد والمفردات.',
    category: 'دورة',
    tag: 'لغات',
    price: '800',
    duration: '10 أسابيع',
    startDate: '2026-05-01',
    endDate: '2026-07-10',
    photoUrl: null,
    isActive: true,
    isAvailable: true,
    isLiked: false,
    departmentName: 'اللغات',
    instituteName: 'مركز اللغات الحديث',
  ),
  MyCoursesCourse(
    id: 6,
    title: 'دبلوم المحاسبة المالية',
    description:
        'دبلوم متخصص في المحاسبة المالية يشمل مبادئ المحاسبة، القوائم المالية، الضرائب، والتدقيق.',
    category: 'دبلوم',
    tag: 'مال ومحاسبة',
    price: '3000',
    duration: '4 أشهر',
    startDate: '2026-11-01',
    endDate: '2027-03-01',
    photoUrl: null,
    isActive: false,
    isAvailable: true,
    isLiked: false,
    departmentName: 'المحاسبة',
    instituteName: 'معهد العلوم المالية',
  ),
  MyCoursesCourse(
    id: 7,
    title: 'دورة التسويق عبر وسائل التواصل الاجتماعي',
    description:
        'تعلم استراتيجيات التسويق عبر فيسبوك، إنستغرام، تيك توك ولينكد إن. تشمل الدورة إدارة الحملات الإعلانية وتحليل البيانات.',
    category: 'دورة',
    tag: 'تسويق',
    price: '1000',
    duration: '6 أسابيع',
    startDate: '2026-08-01',
    endDate: '2026-09-12',
    photoUrl: null,
    isActive: true,
    isAvailable: true,
    isLiked: true,
    departmentName: 'تسويق',
    instituteName: 'أكاديمية التسويق الرقمي',
  ),
  MyCoursesCourse(
    id: 8,
    title: 'دبلوم الشبكات وأمن المعلومات',
    description:
        'دبلوم متقدم في الشبكات وأمن المعلومات يشمل CCNA، أمن الشبكات، اختبار الاختراق، وإدارة الثغرات.',
    category: 'دبلوم',
    tag: 'تقنية معلومات',
    price: '5000',
    duration: '12 شهر',
    startDate: '2026-09-15',
    endDate: '2027-09-15',
    photoUrl: null,
    isActive: false,
    isAvailable: false,
    isLiked: false,
    departmentName: 'تقنية معلومات',
    instituteName: 'معهد اليمن التقني',
  ),
  MyCoursesCourse(
    id: 9,
    title: 'دورة التصوير الفوتوغرافي الاحترافي',
    description:
        'تعلم أساسيات التصوير الفوتوغرافي، الإضاءة، التركيب، والمونتاج باستخدام Lightroom و Photoshop.',
    category: 'دورة',
    tag: 'تصميم',
    price: '900',
    duration: '4 أسابيع',
    startDate: '2026-06-15',
    endDate: '2026-07-13',
    photoUrl: null,
    isActive: true,
    isAvailable: true,
    isLiked: false,
    departmentName: 'تصميم جرافيك',
    instituteName: 'أكاديمية عدن للتدريب',
  ),
  MyCoursesCourse(
    id: 10,
    title: 'دورة تحليل البيانات باستخدام Excel و Power BI',
    description:
        'دورة تطبيقية في تحليل البيانات وإعداد التقارير باستخدام Excel المتقدم و Power BI.',
    category: 'دورة',
    tag: 'تقنية معلومات',
    price: '1100',
    duration: '7 أسابيع',
    startDate: '2026-07-01',
    endDate: '2026-08-18',
    photoUrl: null,
    isActive: true,
    isAvailable: true,
    isLiked: false,
    departmentName: 'تقنية معلومات',
    instituteName: 'معهد اليمن التقني',
  ),
];

class FakeMyCoursesRepositoryImpl implements MyCoursesRepository {
  @override
  Future<List<MyCoursesCourse>> getCourses() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return _fakeCourses;
  }

  @override
  Future<List<MyCoursesCourse>> getFilteredCourses(int departmentId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _fakeCourses.where((c) => c.id % 3 == departmentId % 3).toList();
  }
}
