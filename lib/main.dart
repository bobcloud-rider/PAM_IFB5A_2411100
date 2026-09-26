import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

// ================== DATA DIRI ==================
// Semua data cukup diubah di sini, tampilan otomatis ikut berubah.
const String kNama = 'FAZA RIZAL ANNAFI';
const String kNim = '2411100';
const String kProdi = 'Informatika';
const String kFoto = 'assets/images/foto.jpg';

const String kEmail = 'fazaannafi.07@gmail.com';
const String kTelepon = '082132924422';
const String kLinkedInUrl =
    'https://www.linkedin.com/in/faza-rizal-annafi-88aaa0276';
const String kGitHubUrl = 'https://github.com/bobcloud-rider';

const List<String> kSkills = [
  'Figma',
  'PHP',
  'Jaringan',
  'Godot Engine',
  'Blender',
  'LibreSprite',
];

// --------- VIDEO PERKENALAN ---------
// '' = video belum ada -> tampil placeholder yang rapi.
// Isi 'assets/videos/intro.mp4' kalau videonya sudah ditambahkan.
const String kVideo = 'assets/videos/intro.mp4';

void main() => runApp(const DigitalIdentityApp());

class DigitalIdentityApp extends StatelessWidget {
  const DigitalIdentityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Digital Identity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101828),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigoAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const ProfilPage(),
    );
  }
}

// Membuka link di aplikasi luar (browser / Gmail / telepon).
Future<void> bukaLink(BuildContext context, String alamat) async {
  final ok = await launchUrl(
    Uri.parse(alamat),
    mode: LaunchMode.externalApplication,
  );
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Tidak bisa membuka: $alamat')));
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Digital Identity'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
        children: [
          _kartuHeader(),
          const SizedBox(height: 24),
          _judulSection('⚡ Skill List'),
          const SizedBox(height: 10),
          _kartuSkills(),
          const SizedBox(height: 24),
          _judulSection('📞 Contact Info'),
          const SizedBox(height: 10),
          _KontakTile(
            ikonDepan: const Icon(
              Icons.email_outlined,
              color: Colors.redAccent,
            ),
            judul: 'Email',
            isi: kEmail,
            alamat: 'mailto:$kEmail',
          ),
          _KontakTile(
            ikonDepan: const Icon(
              Icons.phone_outlined,
              color: Colors.greenAccent,
            ),
            judul: 'No. HP',
            isi: kTelepon,
            alamat: 'tel:$kTelepon',
          ),
          _KontakTile(
            ikonDepan: const FaIcon(
              FontAwesomeIcons.linkedin,
              color: Color(0xFF0A66C2),
            ),
            judul: 'LinkedIn',
            isi: 'linkedin.com/in/faza-rizal-annafi-88aaa0276',
            alamat: kLinkedInUrl,
          ),
          _KontakTile(
            ikonDepan: const FaIcon(
              FontAwesomeIcons.github,
              color: Colors.white,
            ),
            judul: 'GitHub',
            isi: 'github.com/bobcloud-rider',
            alamat: kGitHubUrl,
          ),
          const SizedBox(height: 24),
          _judulSection('🎬 Video Perkenalan'),
          const SizedBox(height: 10),
          const VideoPerkenalan(),
          const SizedBox(height: 28),
          const Text(
            'Dibuat dengan Flutter 💙\nFAZA RIZAL ANNAFI • 2411100',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white38, height: 1.6),
          ),
        ],
      ),
    );
  }

  // ---- Bagian foto + nama + NIM + prodi ----
  Widget _kartuHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1D2B53), Color(0xFF6D28D9)],
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 58,
            backgroundColor: Colors.white24,
            backgroundImage: AssetImage(kFoto),
          ),
          const SizedBox(height: 14),
          const Text(
            kNama,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'NIM $kNim',
            style: const TextStyle(color: Colors.white70, fontSize: 15),
          ),
          const SizedBox(height: 12),
          const Chip(avatar: Icon(Icons.school, size: 18), label: Text(kProdi)),
        ],
      ),
    );
  }

  Widget _judulSection(String teks) {
    return Text(
      teks,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  // ---- Daftar skill dalam bentuk chips ----
  Widget _kartuSkills() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: kSkills.map((s) => Chip(label: Text(s))).toList(),
        ),
      ),
    );
  }
}

// Satu baris kontak (ikon + label + isi), bisa diketik untuk dibuka.
// Catatan: ikon LinkedIn/GitHub wajib dibungkus FaIcon (bukan Icon biasa),
// karena font_awesome_flutter v11 tidak lagi memakai IconData.
class _KontakTile extends StatelessWidget {
  final Widget ikonDepan;
  final String judul;
  final String isi;
  final String alamat;

  const _KontakTile({
    required this.ikonDepan,
    required this.judul,
    required this.isi,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: ikonDepan,
        title: Text(judul, style: const TextStyle(fontSize: 12)),
        subtitle: Text(isi, style: const TextStyle(fontSize: 14)),
        trailing: const Icon(Icons.open_in_new, size: 18),
        onTap: () => bukaLink(context, alamat),
      ),
    );
  }
}

// ---- Elemen multimedia: video perkenalan ----
// Kalau kVideo masih kosong -> tampil placeholder yang rapi.
// Kalau kVideo sudah diisi -> tampil video player (ketuk untuk play/pause).
class VideoPerkenalan extends StatefulWidget {
  const VideoPerkenalan({super.key});

  @override
  State<VideoPerkenalan> createState() => _VideoPerkenalanState();
}

class _VideoPerkenalanState extends State<VideoPerkenalan> {
  VideoPlayerController? _controller;
  bool _gagal = false;

  @override
  void initState() {
    super.initState();
    if (kVideo.isNotEmpty) {
      _controller = VideoPlayerController.asset(kVideo)
        ..initialize()
            .then((_) {
              if (mounted) setState(() {});
            })
            .catchError((_) {
              if (mounted) setState(() => _gagal = true);
            });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Belum ada video / gagal dimuat -> placeholder.
    if (kVideo.isEmpty || _gagal || _controller == null) {
      return const _VideoPlaceholder();
    }
    final c = _controller!;
    if (!c.value.isInitialized) {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() {
            c.value.isPlaying ? c.pause() : c.play();
          }),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: VideoPlayer(c),
                ),
                if (!c.value.isPlaying)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.play_circle_fill,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
        VideoProgressIndicator(
          c,
          allowScrubbing: true,
          padding: const EdgeInsets.only(top: 8),
        ),
      ],
    );
  }
}

// Tampilan pengganti selama video belum ditambahkan.
class _VideoPlaceholder extends StatelessWidget {
  const _VideoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1D2B53), Color(0xFF0F3460)],
        ),
        border: Border.all(color: Colors.white12),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.videocam_outlined, size: 48, color: Colors.white70),
          SizedBox(height: 12),
          Text(
            'Video Perkenalan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              'Segera hadir!\nTaruh file intro.mp4 di folder assets/videos/',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
