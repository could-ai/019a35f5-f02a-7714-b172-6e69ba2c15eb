import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  Color _appBarColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 50) {
          if (_appBarColor != const Color(0xFF141414)) {
            setState(() {
              _appBarColor = const Color(0xFF141414);
            });
          }
        } else {
          if (_appBarColor != Colors.transparent) {
            setState(() {
              _appBarColor = Colors.transparent;
            });
          }
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: _appBarColor,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: SvgPicture.asset(
              'assets/logo.svg',
              height: 28,
              colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
            ),
            actions: [
              const Icon(Icons.search, size: 28),
              const SizedBox(width: 20),
              if (!isMobile) ...[
                const Center(
                  child: Text(
                    'Kids',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(width: 20),
              ],
              const Icon(Icons.notifications, size: 28),
              const SizedBox(width: 20),
              const CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage('https://placehold.co/100x100/333/FFF?text=User'),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HeroSection(),
            const SizedBox(height: 20),
            const _MovieCategoryRow(
              title: 'Trending Now',
              imageUrls: [
                'https://placehold.co/400x600/E81C22/FFF?text=Movie+1',
                'https://placehold.co/400x600/1E40AF/FFF?text=Movie+2',
                'https://placehold.co/400x600/16A34A/FFF?text=Movie+3',
                'https://placehold.co/400x600/D97706/FFF?text=Movie+4',
                'https://placehold.co/400x600/7C3AED/FFF?text=Movie+5',
                'https://placehold.co/400x600/DB2777/FFF?text=Movie+6',
              ],
            ),
            const _MovieCategoryRow(
              title: 'Comedies',
              imageUrls: [
                'https://placehold.co/400x600/D97706/FFF?text=Comedy+1',
                'https://placehold.co/400x600/FACC15/000?text=Comedy+2',
                'https://placehold.co/400x600/EC4899/FFF?text=Comedy+3',
                'https://placehold.co/400x600/84CC16/000?text=Comedy+4',
                'https://placehold.co/400x600/3B82F6/FFF?text=Comedy+5',
              ],
            ),
            const _MovieCategoryRow(
              title: 'Action & Adventure',
              imageUrls: [
                'https://placehold.co/400x600/DC2626/FFF?text=Action+1',
                'https://placehold.co/400x600/4B5563/FFF?text=Action+2',
                'https://placehold.co/400x600/059669/FFF?text=Action+3',
                'https://placehold.co/400x600/9333EA/FFF?text=Action+4',
              ],
            ),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://placehold.co/1600x900/222/FFF?text=Featured+Show'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF141414),
                const Color(0xFF141414).withOpacity(0.8),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.0, 0.2, 0.5],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF141414), Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.0, 0.6],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Featured Movie Title',
                  style: TextStyle(
                    fontSize: isMobile ? 32 : 52,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),
                if (!isMobile)
                  const Text(
                    "This is a captivating description of the featured movie or show. It's designed to grab your attention and make you want to watch it right now.",
                    style: TextStyle(fontSize: 16),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      label: const Text('Play', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                      label: const Text('More Info', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieCategoryRow extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  const _MovieCategoryRow({required this.title, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              itemBuilder: (context, index) {
                return _MovieCard(imageUrl: imageUrls[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieCard extends StatefulWidget {
  final String imageUrl;

  const _MovieCard({required this.imageUrl});

  @override
  State<_MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<_MovieCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 160,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48.0),
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _FooterColumn(links: ['FAQ', 'Investor Relations', 'Privacy', 'Speed Test']),
              _FooterColumn(links: ['Help Center', 'Jobs', 'Cookie Preferences', 'Legal Notices']),
              _FooterColumn(links: ['Account', 'Ways to Watch', 'Corporate Information', 'Only on Netflix']),
              _FooterColumn(links: ['Media Center', 'Terms of Use', 'Contact Us']),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '© 1997-2025 Netflix, Inc. (Clone)',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final List<String> links;
  const _FooterColumn({required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: links
          .map((link) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(link, style: TextStyle(color: Colors.grey[500], fontSize: 14)),
              ))
          .toList(),
    );
  }
}
