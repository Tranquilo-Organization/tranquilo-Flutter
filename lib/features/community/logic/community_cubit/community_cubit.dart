import 'package:flutter_bloc/flutter_bloc.dart';
part 'community_state.dart';

class CommunityCubit extends Cubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial());
}
