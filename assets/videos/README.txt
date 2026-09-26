TARUH VIDEO PERKENALANMU DI SINI

1. Simpan/export video perkenalanmu dengan nama persis: intro.mp4
   Contoh: file ini -> assets/videos/intro.mp4

2. Di pubspec.yaml, hapus tanda # pada baris:
     - assets/videos/

3. Di lib/main.dart, ubah:
     const String kVideo = '';
   menjadi:
     const String kVideo = 'assets/videos/intro.mp4';

4. Jalankan: flutter run
   Video langsung bisa diputar di dalam aplikasi (ketuk untuk play/pause).

Tips: kompres/resize video maksimal 720p supaya ukuran aplikasi kecil.
File README ini boleh dihapus setelah videonya ada.
