import 'package:adistetsa/models/role_model.dart';
import 'package:adistetsa/providers/provider.dart';
import 'package:adistetsa/widget/item_card.dart';
import 'package:adistetsa/widget/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:adistetsa/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Providers provider = Provider.of<Providers>(context);
    RolesModel rolesModel = provider.role;

    var role = rolesModel.name;
    Widget itemsStafPerpustakaan() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff-perpus/katalog-buku-page');
              },
              child: ItemCard(
                urlImg: 'katalog buku',
                text: 'Katalog Buku',
              ),
            ),
            // ItemCard(
            //   urlImg: 'anggota perpustakaan',
            //   text: 'Anggota Perpustakaan',
            // ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staff-perpus/peminjaman-buku-page');
              },
              child: ItemCard(
                urlImg: 'peminjaman buku',
                text: 'Peminjaman Buku',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staff-perpus/riwayat-peminjaman-page');
              },
              child: ItemCard(
                urlImg: 'riwayat peminjaman',
                text: 'Riwayat Peminjaman',
              ),
            ),
            // ItemCard(
            //   urlImg: 'laporan jumlah anggota',
            //   text: 'Laporan Jumlah Anggota',
            // ),
            // ItemCard(
            //   urlImg: 'laporan sirkulasi peminjaman',
            //   text: 'Laporan Sirkulasi Peminjaman',
            // ),
            // ItemCard(
            //   urlImg: 'laporan koleksi buku',
            //   text: 'Laporan Koleksi Buku',
            // ),
          ],
        ),
      );
    }

    Widget itemsGuru() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            // ItemCard(
            //   urlImg: 'bimbingan konseling',
            //   text: 'Bimbingan Konseling',
            // ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/user/kesiswaan/input-pelanggaran-page');
              },
              child: ItemCard(
                urlImg: 'kesiswaan',
                text: 'Kesiswaan',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/guru/kurikulum-page');
              },
              child: ItemCard(
                urlImg: 'kurikulum',
                text: 'Kurikulum',
              ),
            ),
            // ItemCard(
            //   urlImg: 'tata usaha',
            //   text: 'Tata Usaha',
            // ),
            // ItemCard(
            //   urlImg: 'unit penjamin mutu',
            //   text: 'Unit Penjamin Mutu',
            // ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/perpustakaan');
              },
              child: ItemCard(
                urlImg: 'perpustakaan',
                text: 'Perpustakaan',
              ),
            ),
            // ItemCard(
            //   urlImg: 'adiwiyata',
            //   text: 'Adiwiyata',
            // ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/sarpras');
              },
              child: ItemCard(
                urlImg: 'sarana dan prasarana',
                text: 'Sarana dan Prasarana',
              ),
            ),
          ],
        ),
      );
    }

    Widget itemsSiswa() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            ItemCard(
              urlImg: 'kurikulum',
              text: 'Kurikulum',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/perpustakaan');
              },
              child: ItemCard(
                urlImg: 'perpustakaan',
                text: 'Perpustakaan',
              ),
            ),
            ItemCard(
              urlImg: 'bimbingan konseling',
              text: 'Bimbingan Konseling',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/sarpras');
              },
              child: ItemCard(
                urlImg: 'sarana prasarana',
                text: 'Sarana dan Prasarana',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/siswa/kesiswaan/list-kesiswaan-page');
              },
              child: ItemCard(
                urlImg: 'kesiswaan',
                text: 'Kesiswaan',
              ),
            ),
            ItemCard(
              urlImg: 'tata usaha',
              text: 'Tata Usaha',
            ),
            ItemCard(
              urlImg: 'humas',
              text: 'Humas',
            ),
            ItemCard(
              urlImg: 'adiwiyata',
              text: 'Adiwiyata',
            ),
            ItemCard(
              urlImg: 'presensi',
              text: 'Presensi',
            ),
            ItemCard(
              urlImg: 'alumni',
              text: 'Alumni',
            ),
            ItemCard(
              urlImg: 'daftar harga koperasi',
              text: 'Daftar Harga Koperasi',
            ),
            ItemCard(
              urlImg: 'prestasi',
              text: 'Prestasi',
            ),
            ItemCard(
              urlImg: 'data kesehatan',
              text: 'Data Kesehatan',
            ),
            ItemCard(
              urlImg: 'tata tertib',
              text: 'Tata Tertib',
            ),
            ItemCard(
              urlImg: 'survey',
              text: 'Survey',
            ),
          ],
        ),
      );
    }

    Widget itemsKaryawan() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            ItemCard(
              urlImg: 'kurikulum',
              text: 'Kurikulum',
            ),
            ItemCard(
              urlImg: 'tata usaha',
              text: 'Tata Usaha',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/sarpras');
              },
              child: ItemCard(
                urlImg: 'sarana prasarana',
                text: 'Sarana dan Prasarana',
              ),
            ),
            ItemCard(
              urlImg: 'presensi',
              text: 'Presensi',
            ),
            ItemCard(
              urlImg: 'tata tertib',
              text: 'Tata Tertib',
            ),
            ItemCard(
              urlImg: 'survey',
              text: 'Survey',
            ),
            ItemCard(
              urlImg: 'adiwiyata',
              text: 'Adiwiyata',
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/user/kesiswaan/input-pelanggaran-page');
              },
              child: ItemCard(
                urlImg: 'kesiswaan',
                text: 'Kesiswaan',
              ),
            ),
          ],
        ),
      );
    }

    Widget itemsStafSarpras() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staf/sarpras/list-katalog-barang-page');
              },
              child: ItemCard(
                urlImg: 'katalog barang',
                text: 'Katalog Barang',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staf/sarpras/list-katalog-ruang-page');
              },
              child: ItemCard(
                urlImg: 'katalog ruang',
                text: 'Katalog Ruang',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staf/sarpras/list-peminjaman-barang-page');
              },
              child: ItemCard(
                urlImg: 'peminjaman barang',
                text: 'Peminjaman Barang',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/staf/sarpras/list-peminjaman-ruang');
              },
              child: ItemCard(
                urlImg: 'peminjaman ruang',
                text: 'Peminjaman Ruang',
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: mono6Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 11,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ADISTETSA',
                            style: mono1TextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/roles-page', (route) => false);
                            },
                            child: Icon(
                              Icons.group_outlined,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Selamat Datang di Aplikasi Digital SMAN 4 Malang',
                        style: mono1TextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                      ProfileCard(),
                      Text(
                        'Menu',
                        style: mono1TextStyle,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: role == 'Staf Perpustakaan'
                      ? itemsStafPerpustakaan()
                      : role == 'Guru'
                          ? itemsGuru()
                          : role == 'Siswa'
                              ? itemsSiswa()
                              : role == 'Karyawan'
                                  ? itemsKaryawan()
                                  : role == 'Staf Sarpras'
                                      ? itemsStafSarpras()
                                      : SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
