import 'package:flutter/material.dart';
import 'package:smart_school_app/entity/hive_entity/product.dart';
import 'package:smart_school_app/resources/resources.dart';
import 'package:smart_school_app/widgets/navigation/main_navigation.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  var _currentIndex = 0;
  List<Widget> screens = [
    const HomePageWidgetBody(),
    const Text('Menu'),
    const Text('Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 25, 59, 84),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (bottomNavigationBarIndex) {
          setState(() {
            _currentIndex = bottomNavigationBarIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 38, 54),
        title: const Text('Online - Shopping'),
      ),
      body: screens[_currentIndex],
    );
  }
}

class HomePageWidgetBody extends StatefulWidget {
  const HomePageWidgetBody({Key? key}) : super(key: key);

  @override
  State<HomePageWidgetBody> createState() => _HomePageWidgetBodyState();
}

class _HomePageWidgetBodyState extends State<HomePageWidgetBody> {
  final List<Products> products = [
    Products(
      productName: 'School Bus',
      price: '\$560',
      id: 1,
    ),
    Products(
      productName: 'Toy Airplane',
      price: '\$225.95',
      id: 2,
    ),
    Products(
      productName: 'Rubber Ducky',
      price: '\$130.95',
      id: 3,
    ),
  ];

  final List<Widget> images = [
    const Image(image: AssetImage(Images.bus)),
    const Image(image: AssetImage(Images.air)),
    const Image(image: AssetImage(Images.ducky)),
  ];

  List<Products> _searchProduct = [];
  final _textController = TextEditingController();

  void _searchFunc() {
    final text = _textController.text;
    if (text.isNotEmpty) {
      _searchProduct = products.where((Products product) {
        return product.productName.toLowerCase().contains(text.toLowerCase());
      }).toList();
    } else {
      _searchProduct = products;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchProduct = products; 
    _textController.addListener(_searchFunc);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 55),
          itemCount: _searchProduct.length,
          itemExtent: 170,
          itemBuilder: (BuildContext context, index) {
            final product = _searchProduct[index];
            final image = images[products.indexOf(product)];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black.withOpacity(0.075)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          image,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.productName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  product.price,
                                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      children: [
                        _LikeButton(),
                        const SizedBox(width: 10),
                        IconButton(
                          color: Colors.blue,
                          onPressed: () => Navigator.of(context).pushNamed(
                            MAinNavigationRoutesName.toyInfo,
                            arguments: product.id,
                          ),
                          icon: const Icon(Icons.add_shopping_cart),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onEditingComplete: () => _searchFunc(),
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Search',
              filled: true,
              fillColor: Colors.white70,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        color: _isLiked ? Colors.red : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _isLiked = !_isLiked;
        });
      },
    );
  }
}
