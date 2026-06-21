class InstituteData {
  final String name;
  final String address;
  final String about;
  final List<Specialty> specialties;
  final String phone;
  final String whatsapp;

  const InstituteData({
    required this.name,
    required this.address,
    required this.about,
    required this.specialties,
    required this.phone,
    required this.whatsapp,
  });
}

class Specialty {
  final String title;
  final String subtitle;
  final int iconBgColor;
  final int iconColor;

  const Specialty({
    required this.title,
    required this.subtitle,
    required this.iconBgColor,
    required this.iconColor,
  });
}
