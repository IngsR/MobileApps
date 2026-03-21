# Simple App (Flutter Mobile Apps)

`simple_app` adalah sebuah aplikasi mobile lintas platform (Android/iOS) yang dibangun menggunakan *framework* Flutter. Proyek ini mendemonstrasikan implementasi navigasi kustom (*custom routing*) menggunakan `BottomAppBar` dengan *Floating Action Button* (FAB) yang di-dock di bagian tengah bawah layar, memberikan pengalaman UI/UX yang modern dan intuitif.

## 🚀 Fitur Utama

- **Custom Bottom Navigation Bar**: Navigasi bawah kustom dengan efek *notch* melingkar.
- **Center-Docked Floating Action Button**: Tombol beranda utama yang menonjol menggunakan efek gradien linier dan *drop shadow*.
- **Manajemen Status Skrin (State Management)**: Transisi antar layar dikelola secara dinamis (mendukung 5 tab utama) menggunakan `StatefulWidget` internal (tanpa re-rendering global yang berat).
- **Tema Terpusat (Centralized Theming)**: Pengaturan *color palette* dan *typography* dikonfigurasi melalui kelas `AppTheme` khusus.
- **Dukungan Tipografi Modern**: Menggunakan *font family* Poppins secara dinamis via paket `google_fonts`.

## 🛠 Teknologi & Dependensi (Tech Stack)

Aplikasi ini menggunakan teknologi inti berikut:

- **SDK**: Flutter versi `>=3.11.3`
- **Bahasa Pemrograman**: Dart 
- **Package Utama** (`pubspec.yaml`):
  - `cupertino_icons: ^1.0.8` - Render ikon dengan gaya otentik iOS.
  - `google_fonts: ^6.1.0` - Render tipografi dinamis Google Fonts (Poppins) dengan *caching* bawaan.

## 📁 Arsitektur dan Struktur Folder

Proyek ini disusun dengan memisahkan level *UI components* (widgets), layar utama (*screens*), dan *theming* untuk mencapai prinsip *"Clean Architecture"* tahap dasar.

```text
lib/
├── main.dart               # Entry point utama (Inisialisasi aplikasi & rotasi layar)
├── screens/                # Direktori untuk level halaman agregasi (Screens)
│   ├── about_screen.dart   # Halaman Tentang Aplikasi
│   ├── cart_screen.dart    # Halaman Keranjang Belanja
│   ├── home_screen.dart    # Halaman Utama (Beranda)
│   ├── market_screen.dart  # Halaman Pasar / Store
│   └── messages_screen.dart# Halaman Chat / Pesan
├── theme/                  # Konfigurasi UI dan Visual State
│   └── app_theme.dart      # Definisi palet warna inti (Colors), Gradient, & ThemeData
└── widgets/                # Komponen UI Modular dan Reusable
    └── main_navigation.dart# Implementasi Scaffold inti, perantara rute, dan animasi BottomAppBar
```

## 🧭 Struktur Navigasi Teknis

Logika navigasi (sebagai fondasi *routing*) di-handle (dan di-enkapsulasi) oleh `MainNavigation` (`lib/widgets/main_navigation.dart`).  
Komponen ini menggunakan variabel state `_currentIndex` bertipe `int` untuk me-render antarmuka tanpa metode `Navigator.push()` yang memboros tumpukan (*stack*) memori:

- Index `0` ➡️ **HomeScreen** (Dipicu dominan via FAB di indeks tengah)
- Index `1` ➡️ **MarketScreen** (Nav item porsi kiri)
- Index `2` ➡️ **CartScreen** (Nav item porsi kiri)
- Index `3` ➡️ **MessagesScreen** (Nav item porsi kanan)
- Index `4` ➡️ **AboutScreen** (Nav item porsi kanan)

Peralihan komponen direpresentasikan dengan Array referensi langsung `List<Widget> _screens`, menjamin transisi status O(1) di sisi memori Flutter tree.

## 🎨 Penataan Tema & UI (Theming)

Aplikasi ini menggunakan tema berbasis Material Design 3 (parameter `uses-material-design: true`), namun di-override secara sistematis. Konten antarmuka dikalkulasi berbasis tema statis di `AppTheme` dengan variasi status *Light* maupun aksen modern.

## ⚙️ Cara Instalasi & Menjalankan (Deployment)

1. **Clone repositori** ini ke lokal Anda.
   ```bash
   git clone <repository-url>
   ```
2. **Masuk ke folder proyek**.
   ```bash
   cd "Mobile Apps/Flutter"
   ```
3. **Instal seluruh paket dependensi (Pub Get)**.
   ```bash
   flutter pub get
   ```
4. **Jalankan Aplikasi**.
   Pastikan Anda sudah mengaktifkan Emulator (AVD/iOS Simulator) atau menyambungkan perangkat (*Physical Device*) dengan USB Debugging aktif.
   ```bash
   flutter run
   ```
