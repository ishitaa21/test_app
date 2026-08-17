import 'package:flutter/material.dart';

class AmazonHomeScreen extends StatefulWidget {
  const AmazonHomeScreen({super.key});

  @override
  State<AmazonHomeScreen> createState() => _AmazonHomeScreenState();
}

class _AmazonHomeScreenState extends State<AmazonHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _searchController = TextEditingController();

  // TODO: Move this to global Cubit state later
  int _cartCount = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Searching for: ${_searchController.text}'),
          backgroundColor: const Color(0xFF232F3E),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _handleAddToCart() {
    setState(() {
      _cartCount++;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Added to Cart'),
        content: const Text('Item has been successfully added to your cart.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Color(0xFF007185))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      backgroundColor: const Color(0xFFEAEDED),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopNavBar(isDesktop),
            _buildSubNavBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    _buildHeroBanner(),
                    Padding(
                      padding: const EdgeInsets.only(top: 220.0, left: 16, right: 16, bottom: 40),
                      child: isDesktop ? _buildDesktopGrid() : _buildMobileGrid(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNavBar(bool isDesktop) {
    return Container(
      height: 60,
      color: const Color(0xFF131921),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Text('amazon.in', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(width: 20),

          if (isDesktop) ...[
            const Icon(Icons.location_on_outlined, color: Colors.white, size: 20),
            const SizedBox(width: 4),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deliver to Ishita', style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text('Kolkata 700081', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 20),
          ],

          Expanded(
            child: Form(
              key: _formKey,
              child: Row(
                children: [
                  if (isDesktop)
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
                        border: Border(right: BorderSide(color: Colors.grey, width: 1)),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        children: [
                          Text('All', style: TextStyle(color: Colors.black54, fontSize: 12)),
                          Icon(Icons.arrow_drop_down, color: Colors.black54, size: 16),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: isDesktop
                            ? BorderRadius.zero
                            : const BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
                      ),
                      child: TextFormField(
                        controller: _searchController,
                        validator: (value) => (value == null || value.isEmpty) ? '' : null,
                        decoration: const InputDecoration(
                          hintText: 'Search Amazon.in',
                          hintStyle: TextStyle(fontSize: 14, color: Colors.black54),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          errorStyle: TextStyle(height: 0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _onSearchSubmit,
                    child: Container(
                      height: 40,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFEB236),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                      ),
                      child: const Icon(Icons.search, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),

          if (isDesktop) ...[
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, Ishita', style: TextStyle(color: Colors.white, fontSize: 12)),
                Text('Account & Lists', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 20),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Returns', style: TextStyle(color: Colors.white, fontSize: 12)),
                Text('& Orders', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 20),
          ],

          GestureDetector(
            onTap: _handleAddToCart,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, right: 8.0),
                  child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 32),
                ),
                Positioned(
                  top: 0,
                  right: 12,
                  child: Text(
                    '$_cartCount',
                    style: const TextStyle(color: Color(0xFFF08804), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubNavBar() {
    return Container(
      height: 40,
      color: const Color(0xFF232F3E),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Row(
        children: [
          Icon(Icons.menu, color: Colors.white, size: 20),
          SizedBox(width: 4),
          Text('All', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(width: 16),
          Text('Mobiles', style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(width: 16),
          Text('Gift Ideas', style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(width: 16),
          Text('Amazon Pay', style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(width: 16),
          Text('Gift Cards', style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFECCC), Color(0xFFEAEDED)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              const Text('HOME SHOPPING SPREE', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
              const Text('FESTIVE EDITION', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFC7511F))),
              const Text('UP TO 70% OFF', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Color(0xFFB12704))),
              Text('4th - 10th September', style: TextStyle(fontSize: 14, color: Colors.grey[800])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _buildProfileCard()),
        const SizedBox(width: 20),
        Expanded(child: _buildPromoCard('Up to 70% off | Electronics clearance store', 'assets/images/electronics.jpeg', 'See all offers')),
        const SizedBox(width: 20),
        Expanded(child: _buildPromoCard('Shop on the Amazon App', 'assets/images/dress.jpeg', 'Download the Amazon App')),
        const SizedBox(width: 20),
        Expanded(child: _buildPromoCard('LAPTOPS FROM TOP BRANDS', 'assets/images/laptop.jpeg', 'See more')),
      ],
    );
  }

  Widget _buildMobileGrid() {
    return Column(
      children: [
        _buildProfileCard(),
        const SizedBox(height: 20),
        _buildPromoCard('Up to 70% off | Electronics clearance store', 'assets/images/electronics.jpeg', 'See all offers'),
        const SizedBox(height: 20),
        _buildPromoCard('Shop on the Amazon App', 'assets/images/dress.jpeg', 'Download the Amazon App'),
        const SizedBox(height: 20),
        _buildPromoCard('LAPTOPS FROM TOP BRANDS', 'assets/images/laptop.jpeg', 'See more'),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      height: 420,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFEAEDED),
                radius: 20,
                child: Icon(Icons.person, color: Colors.grey, size: 28),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hi, Ishita', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text('Customer since 2026', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Top picks for you', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildMiniCategory('assets/images/mobile.jpeg', 'Mobiles'),
                _buildMiniCategory('assets/images/fashion.jpeg', 'Fashion'),
                _buildMiniCategory('assets/images/electronics.jpeg', 'Watches'),
                _buildMiniCategory('assets/images/dress.jpeg', 'Shoes'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniCategory(String imagePath, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F7),
              image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _buildPromoCard(String title, String imagePath, String linkText) {
    return Container(
      height: 420,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              width: double.infinity,
              color: const Color(0xFFF7F7F7),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 16),
          Text(linkText, style: const TextStyle(color: Color(0xFF007185), fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}