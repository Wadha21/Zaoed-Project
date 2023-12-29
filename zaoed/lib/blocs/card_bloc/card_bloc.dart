import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/model/card_model.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  List<CardModel>? cardList;
  CardBloc() : super(CardInitial()) {
    on<AddCardEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      try {
        await supabase.from('card').insert({
          'name': event.name,
          'number_card': event.cardNumber,
          'exp_card': event.endDate,
          'csv': event.cvv
        });

        emit(AddCardState());
      } catch (e) {
        return;
      }
    });

    on<GetCardDateEvent>((event, emit) async {
      try {
        final supabase = SupabaseNetworking().getSupabase;
        final id = supabase.auth.currentUser?.id;
        final data = await supabase.from('card').select().eq('id_user', id!);
        for (var element in data) {
          cardList?.add(CardModel.fromJson(element));
        }
      } catch (e) {
        return;
      }
    });
  }
}