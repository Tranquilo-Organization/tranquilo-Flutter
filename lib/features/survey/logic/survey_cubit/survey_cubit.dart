import 'package:flutter_bloc/flutter_bloc.dart';
part 'survey_state.dart';

class SurveyCubit extends Cubit<SurveyState> {
  SurveyCubit() : super(SurveyInitial());
}
