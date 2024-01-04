import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/outline_style.dart';

class BankTextField extends StatelessWidget {
  const BankTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
  });

  final TextEditingController controller;
  final String hint;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors().white, fontSize: 16),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 48,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: AppColors().gray6,
                  filled: true,
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineStyle.defaultBorder),
            ),
          )
        ],
      ),
    );
  }
}
