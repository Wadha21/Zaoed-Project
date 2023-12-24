

import 'package:zaoed/constants/imports.dart';

class TestShowDialogAddBankDone extends StatelessWidget {
  const TestShowDialogAddBankDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return
                        // const AddedDialog(
                        //   title: "تم إرسال طلب إضافة نقطة شحن جديدة بنجاح",
                        // );

                        const AddedDialog(
                      title: "تم إضافة البيانات البنكية بنجاح",
                    );
                  },
                );
                Future.delayed(const Duration(seconds: 5), () {
                  Navigator.of(context).pop();
                });
              },
              child: const Text("test"),
            ),
          ],
        ),
      ),
    );
  }
}
