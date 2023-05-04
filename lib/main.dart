import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_note/controllers/authController.dart';
import 'package:flutter_note/controllers/noteController.dart';
import 'package:flutter_note/controllers/userController.dart';
import 'package:flutter_note/utils/root.dart';
import 'package:waveui/waveui.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put<AuthController>(AuthController());
  Get.put<UserController>(UserController());
  Get.put<NoteController>(NoteController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: WaveTheme(),
      home: Root(),
    );
  }
}
