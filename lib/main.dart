import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';      //This is to set the default orientation of the device


var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 4, 1, 88));

var kDarkColorscheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark,
);

void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// // SystemChrome.setPreferredOrientations([         //This part of code is to set orientations
// //   DeviceOrientation.portraitUp,
// // ]).then((value) => runApp(
//     MaterialApp(
//       darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
//         colorScheme: kDarkColorscheme,
//         cardTheme: const CardTheme().copyWith(
//           color: kDarkColorscheme.secondaryContainer,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kDarkColorscheme.primaryContainer,
//             foregroundColor: kDarkColorscheme.onPrimaryContainer,
//           ),
//         ),

//       ),
//       theme: ThemeData().copyWith(
//         colorScheme: kColorScheme,
//         appBarTheme: const AppBarTheme().copyWith(
//           backgroundColor: kColorScheme.primaryContainer,
//           foregroundColor: kColorScheme.primaryContainer,
//         ),
//         cardTheme: const CardTheme().copyWith(
//           color: kColorScheme.secondaryContainer,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 8,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: kColorScheme.primaryContainer,
//           ),
//         ),
//         textTheme: ThemeData().textTheme.copyWith(
//               titleLarge: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: Colors.black,
//               ),
//             ),
//       ),
//       themeMode: ThemeMode.system,
//       home: const Expenses(),
//     ),
//   )
// );

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: kDarkColorscheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorscheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorscheme.primaryContainer,
            foregroundColor: kDarkColorscheme.onPrimaryContainer,
          ),
        ),

      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
