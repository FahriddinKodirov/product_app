import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:products_app/data/repositories/auth_repository.dart';
import 'package:products_app/data/repositories/categories_repository.dart';
import 'package:products_app/data/repositories/order_repositories.dart';
import 'package:products_app/data/repositories/product_repository.dart';
import 'package:products_app/screen/auth_page/auth_page.dart';
import 'package:products_app/screen/home/tab_bar.dart';
import 'package:products_app/utils/my_route.dart';
import 'package:products_app/view_model/auth_view_model.dart';
import 'package:products_app/view_model/categories_view_model.dart';
import 'package:products_app/view_model/order_view_model.dart';
import 'package:products_app/view_model/product_view_model.dart';
import 'package:products_app/view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SplashViewModel()),
    Provider(
        create: (context) => AuthViewModel(
            authRepository: AuthRepository(auth: FirebaseAuth.instance))),
    ChangeNotifierProvider(create: ((context) => CategoriesViewModel(categoriesRepository: CategoriesRepository(firebaseFirestore: FirebaseFirestore.instance)))),
    ChangeNotifierProvider(create: (context) => ProductViewModel(productRepositories: ProductRepositories(firebaseFirestore: FirebaseFirestore.instance))),
    ChangeNotifierProvider(create: (context) => OrderViewModel(orderRepositories: OrderRepositories(firestore: FirebaseFirestore.instance)))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRoute.tabBarPage,
      onGenerateRoute: AppRoutes.generatRoute
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const TabBarPage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
