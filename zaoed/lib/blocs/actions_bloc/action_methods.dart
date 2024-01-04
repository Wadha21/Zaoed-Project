import 'package:zaoed/model/bookmark_model.dart';
import 'package:zaoed/model/port_model.dart';
import 'package:zaoed/service/networking.dart';

class ActionSupabaseMethods {
  final supabase = SupabaseNetworking().getSupabase;
  List<BookmarkModel> bookmarkList = [];
  List<ChargingPoint> providerChargingList = [];

  getBookmarks() async {
    try {
      final id = supabase.auth.currentUser?.id;
      final bookmarkData = await supabase
          .from("bookmark")
          .select(
              "*, charging_point(point_name,charging_port, port_count, rating, charging_times, longitude, latitude)")
          .eq("id_auth", id!);
      for (var element in bookmarkData) {
        bookmarkList.add(BookmarkModel.fromJson(element));
      }
      return bookmarkList;
    } catch (e) {
      return;
    }
  }

  addBookmark({required int? pointID}) async {
    try {
      final id = supabase.auth.currentUser?.id;
      final confirm = await supabase
          .from("bookmark")
          .select()
          .match({"point_id": pointID, "id_auth": id!});
      if (confirm.isEmpty) {
        await supabase
            .from("bookmark")
            .insert({"point_id": pointID, "id_auth": id}).select();
      }
    } catch (e) {
      print("bbbbbbbbbbbbbbbbb");
      print(e);
    }
  }

  deleteBookmark({required int? id}) async {
    await supabase.from("bookmark").delete().eq("bookmark_id", id!);
  }

  getChargingPoint() async {
    List<ChargingPoint> chargingPointList = [];
    final chargingPointData = await supabase
        .from("charging_point")
        .select("* , port_counter(port_name, number_of_port)");

    for (var element in chargingPointData) {
      chargingPointList.add(ChargingPoint.fromJson(element));
    }
    print("itsme");
    print(chargingPointData.last);
    await Future.delayed(const Duration(seconds: 1));
    return chargingPointList;
  }

  port() async {
    List<PortModel> chargingPointList = [];
    final chargingPointData = await supabase
        .from("port_counter")
        .select("*,id_charging_point!inner(*)");

    for (var element in chargingPointData) {
      chargingPointList.add(PortModel.fromJson(element));
    }
    // print("itsme");
    print(chargingPointData.last);
    await Future.delayed(const Duration(seconds: 1));
    return chargingPointData;
  }

  getProviderChargingPoints() async {
    try {
      final id = supabase.auth.currentUser?.id;

      final providerPointData =
          await supabase.from("charging_point").select("*").eq("id_auth", id!);
      for (var element in providerPointData) {
        providerChargingList.add(ChargingPoint.fromJson(element));

        // make another lopp to port counters
      }
      return providerChargingList;
    } catch (e) {
      return;
    }
  }

  deleteChargingPoint({required int? id}) async {
    //
    await supabase.from("port_counter").delete().eq("id_charging_point", id!);
    await supabase.from("charging_point").delete().eq("point_id", id);
  }
}
