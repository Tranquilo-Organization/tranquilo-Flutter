import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';

List<OnBoardingModel> getOnBoardingList() {
  return [
    OnBoardingModel(
      imagePath: 'assets/svgs/fisrt_onboarding.svg',
      title: 'Personalized Anxiety Support',
      body: 'Our app provides personalized support\ntailored to your needs, '
          'helping you\nnavigate your anxiety with confidence\nand control. '
          'Let\'s take this journey\ntogether.',
    ),
    OnBoardingModel(
      imagePath: 'assets/svgs/second_onboarding.svg',
      title: 'AI-Powered Recommendations',
      body: 'Our AI assesses your anxiety through\nsimple surveys, providing '
          'you with\ncustomized recommendations that\nmatch your current state.',
    ),
    OnBoardingModel(
      imagePath: 'assets/svgs/last_onboading.svg',
      title: 'Instant Help & Community',
      body: 'Need help right away? Our chatbot is\nhere for immediate support, '
          'and our\ncommunity feature lets you connect\nwith others who '
          'understand your\nexperiences.',
    ),
  ];
}
