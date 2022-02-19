import 'package:adistetsa/login_page.dart';
import 'package:adistetsa/pages/detail%20profile/update_password_page.dart';
import 'package:adistetsa/pages/main_page.dart';
import 'package:adistetsa/pages/siswa/kesiswaan/proyek%20kebaikan/input_proyek_kebaikan_page.dart';
import 'package:adistetsa/pages/siswa/kesiswaan/riwayat/riwayat_pelanggaran_page.dart';
import 'package:adistetsa/pages/siswa/kesiswaan/riwayat/riwayat_proyek_kebaikan_page.dart';
import 'package:adistetsa/pages/siswa/list_kesiswaan_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/katalog%20buku/detail_katalog_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/katalog%20buku/katalog_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/peminjaman%20buku/detail_peminjaman_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/peminjaman%20buku/peminjaman_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/riwayat%20peminjaman/detail_riwayat_peminjaman_buku_page.dart';
import 'package:adistetsa/pages/staff/perpustakaan/riwayat%20peminjaman/riwayat_peminjaman_buku_page.dart';
import 'package:adistetsa/pages/staff/sarpras/Peminjaman/detail_peminjaman_barang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/Peminjaman/detail_peminjaman_ruang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/Peminjaman/list_peminjaman_barang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/Peminjaman/list_peminjaman_ruang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/katalog%20barang/list_katalog_barang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/katalog%20barang/list_katalog_ruang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/riwayat/detail_riwayat_barang_page.dart';
import 'package:adistetsa/pages/staff/sarpras/riwayat/detail_riwayat_ruang_page.dart';
import 'package:adistetsa/pages/user/kesiswaan/pengajuan%20pelanggaran/data_pelanggaran_page.dart';
import 'package:adistetsa/pages/user/kesiswaan/pengajuan%20pelanggaran/data_siswa_page.dart';
import 'package:adistetsa/pages/user/kesiswaan/pengajuan%20pelanggaran/input_pelanggaran_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/list_perpustakaan_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/peminjaman%20buku/list_buku_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/peminjaman%20buku/peminjaman_buku_user_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/riwayat%20peminjaman%20buku/detail_riwayat_peminjaman_buku_user_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/riwayat%20peminjaman%20buku/detail_riwayat_pengajuan_buku_user_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/riwayat%20peminjaman%20buku/riwayat_peminjaman_buku_user_page.dart';
import 'package:adistetsa/pages/user/perpustakaan/riwayat%20peminjaman%20buku/riwayat_pengajuan_buku_user_page.dart';
import 'package:adistetsa/pages/user/sarpras/katalog/katalog_barang_page.dart';
import 'package:adistetsa/pages/user/sarpras/katalog/katalog_ruang_page.dart';
import 'package:adistetsa/pages/user/sarpras/list_sarpras_page.dart';
import 'package:adistetsa/providers/auth_provider.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/roles_page.dart';
import 'package:adistetsa/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(AdiStetsa());
}

class AdiStetsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future getToken() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getString('token');
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Providers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login-page':
              return PageTransition(
                child: LoginPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/roles-page':
              return PageTransition(
                child: RolesPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/update-password-page':
              return PageTransition(
                child: UpdatePasswordPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/katalog-buku-page':
              return PageTransition(
                child: KatalogBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/katalog-buku/detail-page':
              return PageTransition(
                child: DetailKatalogBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/peminjaman-buku-page':
              return PageTransition(
                child: PeminjamanBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/peminjaman-buku-page/back':
              return PageTransition(
                child: PeminjamanBukuPage(),
                type: PageTransitionType.leftToRight,
              );
            case '/staff-perpus/peminjaman-buku/detail-page':
              return PageTransition(
                child: DetailPeminjamanBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/riwayat-peminjaman-page':
              return PageTransition(
                child: RiwayatPeminjamanBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staff-perpus/riwayat-peminjaman-buku/detail-page':
              return PageTransition(
                child: DetailRiwayatPeminjamanBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan':
              return PageTransition(
                child: ListPerpustakaanPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan/peminjaman-buku-page':
              return PageTransition(
                child: PeminjamanBukuUserPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan/riwayat-peminjaman-buku-page':
              return PageTransition(
                child: RiwayatPeminjamanBukuUserPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan/riwayat-pengajuan-buku-page':
              return PageTransition(
                child: RiwayatPengajuanBukuUserPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan/riwayat-peminjaman-buku/detail-page':
              return PageTransition(
                child: DetailRiwayatPeminjamanBukuUserPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan/riwayat-pengajuan-buku/detail-page':
              return PageTransition(
                child: DetailRiwayatPengajuanBukuUserPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/perpustakaan/peminjaman-buku/list-buku-page':
              return PageTransition(
                child: ListBukuPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/siswa/kesiswaan/list-kesiswaan-page':
              return PageTransition(
                child: ListKesiswaanPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/kesiswaan/input-pelanggaran-page':
              return PageTransition(
                child: InputPelanggaranPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/kesiswaan/data-siswa-page':
              return PageTransition(
                child: DataSiswaPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/kesiswaan/data-pelanggaran-page':
              return PageTransition(
                child: DataPelanggaranPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/siswa/kesiswaan/input-proyek-kebaikan-page':
              return PageTransition(
                child: InputProyekKebaikanPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/siswa/kesiswaan/riwayat/riwayat-pelanggaran-page':
              return PageTransition(
                child: RiwayatPelanggaranPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/siswa/kesiswaan/riwayat/riwayat-proyek-kebaikan-page':
              return PageTransition(
                child: RiwayatProyekKebaikanPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staf/sarpras/list-katalog-barang-page':
              return PageTransition(
                child: ListKatalogBarangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staf/sarpras/list-katalog-ruang-page':
              return PageTransition(
                child: ListKatalogRuangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staf/sarpras/list-peminjaman-barang-page':
              return PageTransition(
                child: ListPeminjamanBarangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staf/sarpras/list-peminjaman-barang/detail-page':
              return PageTransition(
                child: DetailPeminjamanBarangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staf/sarpras/list-peminjaman-ruang':
              return PageTransition(
                child: ListPeminjamanRuangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/staf/sarpras/list-peminjaman-ruang/detail-page':
              return PageTransition(
                child: DetailPeminjamanRuangPage(),
                type: PageTransitionType.rightToLeft,
              );

            case '/staf/sarpras/riwayat-barang/detail-page':
              return PageTransition(
                child: DetailRiwayatBarangPage(),
                type: PageTransitionType.rightToLeft,
              );

            case '/staf/sarpras/riwayat-ruang/detail-page':
              return PageTransition(
                child: DetailRiwayatRuangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/sarpras':
              return PageTransition(
                child: ListSarprasPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/sarpras/katalog-barang-page':
              return PageTransition(
                child: KatalogBarangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/user/sarpras/katalog-ruang-page':
              return PageTransition(
                child: KatalogRuangPage(),
                type: PageTransitionType.rightToLeft,
              );
            case '/main-page/back':
              return PageTransition(
                child: MainPage(),
                type: PageTransitionType.leftToRight,
              );
            case '/main-page':
              return PageTransition(
                child: MainPage(),
                type: PageTransitionType.bottomToTop,
              );
          }
        },
        home: FutureBuilder(
          future: getToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                body: RolesPage(),
              );
            } else {
              return Scaffold(
                body: SplashScreen(),
              );
            }
          },
        ),
      ),
    );
  }
}
