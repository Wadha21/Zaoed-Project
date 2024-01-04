import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/outline_style.dart';

class SearchFieldWidget extends StatelessWidget {
  SearchFieldWidget({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors().gray1Trans,
        borderRadius: BorderRadius.circular(30),
        border: Border(
            left: BorderSide(color: AppColors().green, width: 0.4),
            top: BorderSide(color: AppColors().green, width: 0.4)),
      ),
      child: TextField(
        maxLines: 1,
        cursorColor: AppColors().green,
        keyboardType: TextInputType.text,
        controller: searchController,
        style: TextStyle(
          fontSize: 17,
          color: AppColors().white,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          fillColor: AppColors().gray1Trans,
          filled: true,
          suffixIcon: InkWell(
            onTap: () {
              context.push(view: const FilterScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                'lib/assets/icons/filter.png',
              ),
            ),
          ),
          hintText: "بحث",
          hintStyle: TextStyle(color: AppColors().gray4, fontSize: 17),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineStyle.none30Border,
          focusedBorder: OutlineStyle.none30Border,
        ),
      ),
    ).asGlass(clipBorderRadius: BorderRadius.circular(30));
  }
}
