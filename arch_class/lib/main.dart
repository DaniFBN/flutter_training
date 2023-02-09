// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Whatever')),
      );
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class Product {
//   final String name;

//   const Product(
//     this.name,
//   );

//   factory Product.fromMap(Map<String, dynamic> map) {
//     return const Product('');
//   }

//   List getProductsByName() {
//     // _getProducts
//     // Product.fromMap
//     // Filtra

//     return [];
//   }

//   List getProducts() {
//     // _getProducts
//     // Product.fromMap

//     return [];
//   }

//   Product getProductByID() {
//     // _getProducts
//     // Product.fromMap
//     // Filtra

//     return Product.fromMap({});
//   }

//   List _getProducts() {
//     // Consulta a API

//     MyState(
//       error: '',
//       isLoading: true,
//       products: [Product(name), Product(name), Product(name)],
//     );

//     return [];
//   }
// }

// class Product2 extends Product {
//   final String barCode;
//   Product2(this.barCode, super.name);
// }

// abstract class MyState {
//   final bool isLoading;
//   final String? error;
//   final List<Product> products;

//   MyState({
//     required this.error,
//     required this.products,
//     required this.isLoading,
//   });
// }

// class MyLoadingState extends MyState {
//   MyLoadingState() : super(error: null, products: [], isLoading: true);
// }

// class MyErrorState extends MyState {
//   MyErrorState(String error)
//       : super(
//           error: error,
//           products: [],
//           isLoading: false,
//         );
// }

// class MySuccessState extends MyState {
//   MySuccessState(List<Product> products)
//       : super(
//           error: null,
//           products: products,
//           isLoading: false,
//         );
// }

// class Whatever extends StatelessWidget {
//   const Whatever({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
