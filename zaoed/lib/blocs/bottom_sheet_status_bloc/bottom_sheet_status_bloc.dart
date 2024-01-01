import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/components/sheet_method/arrived_dialog.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/components/sheet_method/rating_boottom_sheet.dart';
import 'package:zaoed/components/sheet_method/receive_dialog.dart';
import 'package:zaoed/model/bookmark_model.dart';
part 'bottom_sheet_status_event.dart';
part 'bottom_sheet_status_state.dart';

enum Status {
  completedPayment,
  reachedChargingPoint,
  InProcessing,
  rating,
  nono
}

class BottomSheetStatusBloc
    extends Bloc<BottomSheetStatusEvent, BottomSheetStatusState> {
  String? image;
  String? point;
  String? hour;
  ChargingPoint? chargingPoint;
  Status currentStatus = Status.nono;
  BottomSheetStatusBloc() : super(BottomSheetStatusInitial()) {
    on<UpdateStatusEvent>((event, emit) async {
      image = event.imageType;
      point = event.point;
      hour = event.hour;
      chargingPoint = event.chargingPoint;
      print(hour);
      emit(SuccessState(status: event.status));
    });
  }

  switchShowBottomSheet(BuildContext context, Status status) {
    if (status == currentStatus) {
      return ;
    }
    currentStatus = status;

    switch (status) {
      case Status.completedPayment:
        context.receiveDialog();

        break;
      case Status.reachedChargingPoint:
        context.arrivedToCharging(chargingPoint: chargingPoint);

        break;
      case Status.InProcessing:
        context.chargingCarSheet();

        break;
      case Status.rating:
        ratingBottomSheet(context);

        break;
      default:
        return Container();
    }
  }
}
