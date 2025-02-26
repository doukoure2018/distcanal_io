import 'package:flutter/material.dart';
import 'stats_view.dart'; // Importez StatsView

class ProfilView extends StatefulWidget {
  static const String routeName = '/profil';
  const ProfilView({super.key});

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, StatsView.routeName);
    }
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: _openDrawer,
        ),
      ),
      drawer: _buildDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfileHeader(),
                const SizedBox(height: 20),
                _buildSlogan(),
                const SizedBox(height: 20),
                _buildInfoCards(),
                const SizedBox(height: 20),
                _buildStockCard(),
                const SizedBox(height: 20),
                _buildStatisticsSection(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSlogan() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            // ignore: deprecated_member_use
            kAccentColor.withOpacity(0.2),
            // ignore: deprecated_member_use
            kAccentColor.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        "L'ATTEINTE DES OBJECTIFS CHEZ GUIDIPRESS EST L'UNIQUE EXCUSE",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0)
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerHeader(),
            _buildDrawerItem(Icons.calendar_today, 'Première Échéance'),
            _buildDrawerItem(Icons.timelapse, 'Arrivant à l\'échéance'),
            _buildDrawerItem(Icons.autorenew, 'Réabonnement Global'),
            _buildDrawerItem(Icons.bar_chart, 'Statistique Réabo'),
            _buildDrawerItem(Icons.people, 'Recrutement'),
            _buildDrawerItem(Icons.swap_horiz, 'Échange Matériel'),
            _buildDrawerItem(Icons.phone, 'Téléphone'),
            _buildDrawerItem(Icons.location_on, 'Adresse'),
            _buildDrawerItem(Icons.credit_card, 'Solde'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // ignore: deprecated_member_use
          colors: [kPrimaryColor, kAccentColor.withOpacity(0.2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.person, size: 30, color: Colors.white),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Moumine KABA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'moumine.ingenieur@gmail.com',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.1),
      child: ListTile(
        leading: Icon(icon, color: kAccentColor),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // ignore: deprecated_member_use
          colors: [kPrimaryColor, kAccentColor.withOpacity(0.2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: kAccentColor,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),
          const Text(
            'Moumine KABA',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('moumine.ingenieur@gmail.com',
              style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 20),
          _buildBalanceAndDateRow(),
        ],
      ),
    );
  }

  Widget _buildBalanceAndDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoChip(Icons.credit_card, '383,814 GNF'),
        _buildInfoChip(Icons.date_range, '21-01-2025'),
      ],
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: kPrimaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        // ignore: deprecated_member_use
        border: Border.all(color: kAccentColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: kAccentColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCards() {
    return Row(
      children: [
        _buildInfoCard('Recrutements', '0', '0%'),
        _buildInfoCard('Réabonnements', '38', '65%'),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value, String percentage) {
    return Expanded(
      child: Card(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 8),
              Text(value,
                  style: const TextStyle(
                      color: kAccentColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(percentage,
                      style: const TextStyle(color: Colors.white70)),
                  const Icon(Icons.bar_chart, color: kAccentColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStockCard() {
    return Card(
      // ignore: deprecated_member_use
      color: Colors.white.withOpacity(0.1),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.inventory, color: kAccentColor),
            Text('STOCK DISPONIBLE', style: TextStyle(color: Colors.white)),
            Text('0', style: TextStyle(color: kAccentColor, fontSize: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      children: [
        const Text('Statistique par article',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildStatCard('Access', '2'),
            _buildStatCard('Access+', '10'),
            _buildStatCard('Evasion', '24'),
            _buildStatCard('Tout canal', '5'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Expanded(
      child: Card(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(title, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 8),
              Text(value,
                  style: const TextStyle(
                      color: kAccentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: kPrimaryColor,
      selectedItemColor: kAccentColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Services'),
      ],
    );
  }
}

// Couleurs constantes
const Color kPrimaryColor = Color(0xFF1E1E2C);
const Color kAccentColor = Color(0xFFFF3D00);
