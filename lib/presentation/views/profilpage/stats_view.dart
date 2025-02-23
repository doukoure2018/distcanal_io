import 'package:flutter/material.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});

  static const String routeName = '/stats'; // Définir la route ici

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Statistiques",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Retour à la page précédente
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [kPrimaryColor, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section des cartes de statistiques
              _buildStatisticsCards(),
              const SizedBox(height: 20),

              // Section des graphiques
              _buildGraphSection(),
              const SizedBox(height: 20),

              // Section des statistiques par article
              _buildStatisticsByArticle(),
            ],
          ),
        ),
      ),
    );
  }

  // Cartes de statistiques
  Widget _buildStatisticsCards() {
    return Row(
      children: [
        _buildStatCard('Ventes totales', '1,234', Icons.shopping_cart),
        _buildStatCard('Clients actifs', '567', Icons.people),
      ],
    );
  }

  // Carte de statistique
  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        color: Colors.white.withOpacity(0.1),
        elevation: 5, // Ombre plus prononcée
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bordures arrondies
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 40, color: kAccentColor),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  color: kAccentColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Section des graphiques
  Widget _buildGraphSection() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      elevation: 5, // Ombre plus prononcée
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordures arrondies
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Performances des ventes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Graphique des ventes",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section des statistiques par article
  Widget _buildStatisticsByArticle() {
    return Card(
      color: Colors.white.withOpacity(0.1),
      elevation: 5, // Ombre plus prononcée
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordures arrondies
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Statistiques par article",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildArticleStat('Access', '2'),
                _buildArticleStat('Access+', '10'),
                _buildArticleStat('Evasion', '24'),
                _buildArticleStat('Tout canal', '5'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Statistique par article
  Widget _buildArticleStat(String title, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: kAccentColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Couleurs constantes
const Color kPrimaryColor = Color(0xFF1E1E2C);
const Color kAccentColor = Color(0xFFFF3D00);
