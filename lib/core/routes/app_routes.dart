import 'package:hedgehog_lock/ui/loading_page_screen/loading_page_screen.dart';
import 'package:hedgehog_lock/ui/loading_page_screen/binding/loading_page_binding.dart';
import 'package:hedgehog_lock/ui/sign_in_page_screen/sign_in_page_screen.dart';
import 'package:hedgehog_lock/ui/sign_in_page_screen/binding/sign_in_page_binding.dart';
import 'package:hedgehog_lock/ui/bottom_nav_bar/bottom_navigation.dart';
import 'package:hedgehog_lock/ui/bottom_nav_bar/binding/home_menu_container_binding.dart';

import 'package:hedgehog_lock/ui/profile_screen/seven_screen.dart';
import 'package:hedgehog_lock/ui/profile_screen/binding/seven_binding.dart';
import 'package:hedgehog_lock/ui/change_password/eight_screen.dart';
import 'package:hedgehog_lock/ui/change_password/binding/eight_binding.dart';

import 'package:hedgehog_lock/ui/storage_screen/eleven_screen.dart';
import 'package:hedgehog_lock/ui/storage_screen/binding/eleven_binding.dart';
import 'package:hedgehog_lock/ui/about_us/thirteen_screen.dart';
import 'package:hedgehog_lock/ui/about_us/binding/thirteen_binding.dart';
import 'package:hedgehog_lock/ui/community_screen/fourteen_screen.dart';
import 'package:hedgehog_lock/ui/community_screen/binding/fourteen_binding.dart';

import 'package:hedgehog_lock/ui/plans_page/seventeen_screen.dart';
import 'package:hedgehog_lock/ui/plans_page/binding/seventeen_binding.dart';

import 'package:hedgehog_lock/ui/folder_page/twenty_screen.dart';
import 'package:hedgehog_lock/ui/folder_page/binding/twenty_binding.dart';

import 'package:get/get.dart';

import '../../ui/pay_accept_page/binding/k0_binding.dart';
import '../../ui/pay_accept_page/pay_accept_page.dart';

class AppRoutes {
  static String loadingPageScreen = '/loading_page_screen';

  static String signInPageScreen = '/sign_in_page_screen';

  static String homeMenuContainerScreen = '/home_menu_container_screen';

  static String fiveScreen = '/five_screen';

  static String sixScreen = '/six_screen';

  static String sevenScreen = '/seven_screen';

  static String eightScreen = '/eight_screen';

  static String nineScreen = '/nine_screen';

  static String tenScreen = '/ten_screen';

  static String elevenScreen = '/eleven_screen';

  static String thirteenScreen = '/thirteen_screen';

  static String fourteenScreen = '/fourteen_screen';

  static String fifteenScreen = '/fifteen_screen';

  static String sixteenScreen = '/sixteen_screen';

  static String seventeenScreen = '/seventeen_screen';

  static String eighteenScreen = '/eighteen_screen';

  static String nineteenScreen = '/nineteen_screen';

  static String twentyScreen = '/twenty_screen';

  static String twentyoneScreen = '/twentyone_screen';

  static String twentytwoScreen = '/twentytwo_screen';

  static String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';
  static String twelvePage = '/twelvePage';

  static const String payAcceptPage = '/k0_screen';

  static List<GetPage> pages = [
    GetPage(
      name: payAcceptPage,
      page: () => PayAcceptPage(),
      bindings: [
        K0Binding(),
      ],
    ),
    // GetPage(
    //   name: twelvePage,
    //   page: () => TwelvePage(),
    //   bindings: [
    //     LoadingPageBinding(),
    //   ],
    // ),

    GetPage(
      name: signInPageScreen,
      page: () => SignInPageScreen(),
      bindings: [
        SignInPageBinding(),
      ],
    ),
    GetPage(
      name: homeMenuContainerScreen,
      page: () => BottomNav(),
      bindings: [
        HomeMenuContainerBinding(),
      ],
    ),
    // GetPage(
    //   name: fiveScreen,
    //   page: () => FiveScreen(),
    //   bindings: [
    //     FiveBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: sixScreen,
    //   page: () => SixScreen(),
    //   bindings: [
    //     SixBinding(),
    //   ],
    // ),
    GetPage(
      name: sevenScreen,
      page: () => SevenScreen(),
      bindings: [
        SevenBinding(),
      ],
    ),
    GetPage(
      name: eightScreen,
      page: () => EightScreen(),
      bindings: [
        EightBinding(),
      ],
    ),
    // GetPage(
    //   name: nineScreen,
    //   page: () => NineScreen(),
    //   bindings: [
    //     NineBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: tenScreen,
    //   page: () => TenScreen(),
    //   bindings: [
    //     TenBinding(),
    //   ],
    // ),
    GetPage(
      name: elevenScreen,
      page: () => ElevenScreen(),
      bindings: [
        ElevenBinding(),
      ],
    ),
    GetPage(
      name: thirteenScreen,
      page: () => ThirteenScreen(),
      bindings: [
        ThirteenBinding(),
      ],
    ),
    GetPage(
      name: fourteenScreen,
      page: () => FourteenScreen(),
      bindings: [
        FourteenBinding(),
      ],
    ),
    // GetPage(
    //   name: fifteenScreen,
    //   page: () => FifteenScreen(),
    //   bindings: [
    //     FifteenBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: sixteenScreen,
    //   page: () => SixteenScreen(),
    //   bindings: [
    //     SixteenBinding(),
    //   ],
    // ),
    GetPage(
      name: seventeenScreen,
      page: () => SeventeenScreen(),
      bindings: [
        SeventeenBinding(),
      ],
    ),
    // GetPage(
    //   name: eighteenScreen,
    //   page: () => EighteenScreen(),
    //   bindings: [
    //     EighteenBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: nineteenScreen,
    //   page: () => NineteenScreen(),
    //   bindings: [
    //     NineteenBinding(),
    //   ],
    // ),
    GetPage(
      name: twentyScreen,
      page: () => TwentyScreen(),
      bindings: [
        TwentyBinding(),
      ],
    ),
    // GetPage(
    //   name: twentyoneScreen,
    //   page: () => TwentyoneScreen(),
    //   bindings: [
    //     TwentyoneBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: twentytwoScreen,
    //   page: () => TwentytwoScreen(),
    //   bindings: [
    //     TwentytwoBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: appNavigationScreen,
    //   page: () => AppNavigationScreen(),
    //   bindings: [
    //     AppNavigationBinding(),
    //   ],
    // ),
    GetPage(
      name: initialRoute,
      page: () => LoadingPageScreen(),
      bindings: [
        LoadingPageBinding(),
      ],
    )
  ];
}
