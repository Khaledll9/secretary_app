import '../../domain/entities/institute_data.dart';
import '../../domain/repositories/institute_repository.dart';

class InstituteRepositoryImpl implements InstituteRepository {
  const InstituteRepositoryImpl();

  @override
  Future<InstituteData> getInstituteData() async {
    await Future<void>.delayed(const Duration(milliseconds: 150));

    return const InstituteData(
      name: 'معهد التقنية الحديثة',
      address: 'تعز شارع جمال',
      about:
          'يلتزم معهد التقنية الحديثة بتقديم تعليم متميز يواكب تطلعات العصر الرقمي. '
          'نحن نجمع بين الخبرة الأكاديمية والتدريب العملي المكثف لتمكين طلابنا من '
          'دخول سوق العمل بكفاءة عالية. تشمل برامجنا أحدث المناهج في البرمجة، '
          'هندسة البيانات، وإدارة الأعمال التقنية.',
      specialties: [
        Specialty(
          title: 'البرمجيات',
          subtitle: 'تطوير المواقع والتطبيقات',
          iconBgColor: 0xFFEDEFFE,
          iconColor: 0xFF4C68D5,
        ),
        Specialty(
          title: 'اللغات',
          subtitle: 'الإنجليزية، الفرنسية، الألمانية',
          iconBgColor: 0xFFEDEFFE,
          iconColor: 0xFF4C68D5,
        ),
        Specialty(
          title: 'إدارة الأعمال',
          subtitle: 'المحاسبة، ريادة الأعمال',
          iconBgColor: 0xFFEDEFFE,
          iconColor: 0xFF4C68D5,
        ),
        Specialty(
          title: 'التصميم الرقمي',
          subtitle: 'UI/UX، الجرافيك، المونتاج',
          iconBgColor: 0xFFEDEFFE,
          iconColor: 0xFF4C68D5,
        ),
      ],
      phone: '+967123456789',
      whatsapp: '+967987654321',
    );
  }
}
