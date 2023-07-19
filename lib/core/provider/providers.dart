import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view/sign_in_screen/sign_in_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
];
