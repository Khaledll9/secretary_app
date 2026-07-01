import 'models/onboarding_model.dart';

class LocalOnboardingDataSource implements OnboardingDataSource {
  @override
  List<OnboardingModel> getItems() => const [
    OnboardingModel(
      bgImage: "assets/images/background1.jpg",
      contentImage: "assets/images/app_icon_white.png",
      text:
          "مرحباً بك في تطبيق يسر\nتطبيق للإعلان ومعرفة دبلومات ودورات المعاهد",
    ),
    OnboardingModel(
      bgImage: "assets/images/background2.jpg",
      contentImage: "assets/images/secretary_image.png",
      text: "يتيح للمعاهد الإعلان عن الدبلومات والدورات المتوفرة لديهم",
    ),
    OnboardingModel(
      bgImage: "assets/images/background3.jpg",
      contentImage: "assets/images/student_image.png",
      text:
          "يتيح للطلاب مشاهدة إعلانات الدبلومات والدورات المتاحة في المعاهد وحجز مقاعد فيها",
    ),
  ];
}

abstract interface class OnboardingDataSource {
  List<OnboardingModel> getItems();
}
