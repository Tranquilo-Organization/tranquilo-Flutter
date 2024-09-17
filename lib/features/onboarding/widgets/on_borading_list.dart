import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/features/onboarding/model/on_boarding_model.dart';

List<OnBoardingModel> getOnBoardingList() {
  return [
    OnBoardingModel(
      image: SvgPicture.asset('assets/svgs/first_onboarding.svg'),
      title: 'Personalized Anxiety Support',
      body: 'Our app provides personalized support tailored to your needs, '
          'helping you navigate your anxiety with confidence and control. '
          'Let\'s take this journey together.',
    ),
    OnBoardingModel(
      image: SvgPicture.asset('assets/svgs/second_onboarding.svg'),
      title: 'AI-Powered Recommendations',
      body: 'Our AI assesses your anxiety through simple surveys, providing '
          'you with customized recommendations that match your current state.',
    ),
    OnBoardingModel(
      image: SvgPicture.asset('assets/svgs/last_onboarding.svg'),
      title: 'Instant Help & Community',
      body: 'Need help right away? Our chatbot is here for immediate support, '
          'and our community feature lets you connect with others who '
          'understand your experiences.',
    ),
  ];
}
