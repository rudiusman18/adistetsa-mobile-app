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

    Widget itemsAlumni() {
      return Container(
        margin: EdgeInsets.only(left: 20),
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff/bk/alumni');
              },
              child: ItemCard(
                urlImg: 'alumni',
                text: 'Alumni',
              ),
            ),
          ],
        ),
      );
    }

    Widget itemsStafHumas() {
      return Container(
        margin: EdgeInsets.only(left: 20),
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                provider.setFiturHumas = 'Log UKS';
                Navigator.pushNamed(context, '/staff/humas/');
              },
              child: ItemCard(
                urlImg: 'log uks',
                text: 'Log UKS',
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setFiturHumas = 'Buku Tamu';
                Navigator.pushNamed(context, '/staff/humas/');
              },
              child: ItemCard(
                urlImg: 'buku tamu',
                text: 'Buku Tamu',
              ),
            ),
          ],
        ),
      );
    }

    Widget itemsStafBK() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff/bk/halobk');
              },
              child: ItemCard(
                urlImg: 'halobk',
                text: 'HaloBK',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff/bk/status-data');
              },
              child: ItemCard(
                urlImg: 'status data halobk',
                text: 'Status Data HaloBK',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff/bk/alumni');
              },
              child: ItemCard(
                urlImg: 'alumni',
                text: 'Alumni',
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setAngketPilihanStaffBk = 'Lintas Minat';
                Navigator.pushNamed(context, '/staff/bk/lintasminat');
              },
              child: ItemCard(
                urlImg: 'angket lintas minat',
                text: 'Angket Lintas Minat',
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setAngketPilihanStaffBk = 'Data Siswa';
                Navigator.pushNamed(context, '/staff/bk/lintasminat');
              },
              child: ItemCard(
                urlImg: 'angket data siswa',
                text: 'Angket Data Siswa',
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setAngketPilihanStaffBk = 'Peminatan';
                Navigator.pushNamed(context, '/staff/bk/lintasminat');
              },
              child: ItemCard(
                urlImg: 'angket peminatan',
                text: 'Angket Peminatan',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/staff/bk/snmptn');
              },
              child: ItemCard(
                urlImg: 'snmptn',
                text: 'SNMPTN',
              ),
            ),
          ],
        ),
      );
    }

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/bk');
              },
              child: ItemCard(
                urlImg: 'bimbingan konseling',
                text: 'Bimbingan Konseling',
              ),
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/adiwiyata');
              },
              child: ItemCard(
                urlImg: 'adiwiyata',
                text: 'Adiwiyata',
              ),
            ),
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/perpustakaan');
              },
              child: ItemCard(
                urlImg: 'perpustakaan',
                text: 'Perpustakaan',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/bk');
              },
              child: ItemCard(
                urlImg: 'bimbingan konseling',
                text: 'Bimbingan Konseling',
              ),
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/user/adiwiyata');
              },
              child: ItemCard(
                urlImg: 'adiwiyata',
                text: 'Adiwiyata',
              ),
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
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pushNamed(context, '/user/bk');
            //   },
            //   child: ItemCard(
            //     urlImg: 'bimbingan konseling',
            //     text: 'Bimbingan Konseling',
            //   ),
            // ),
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
                Navigator.pushNamed(context, '/user/adiwiyata');
              },
              child: ItemCard(
                urlImg: 'adiwiyata',
                text: 'Adiwiyata',
              ),
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

    Widget itemsPelatih() {
      return Container(
        alignment: Alignment.center,
        child: Wrap(
          spacing: 25,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pelatih/pengajuan-ekskul-page');
              },
              child: ItemCard(
                urlImg: 'pengajuan ekskul',
                text: 'Pengajuan Ekskul',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pelatih/list_ekskul');
              },
              child: ItemCard(
                urlImg: 'daftar anggota',
                text: 'Daftar Anggota',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pelatih/jurnal-ekskul');
              },
              child: ItemCard(
                urlImg: 'jurnal ekskul',
                text: 'Jurnal Ekskul',
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pelatih/jadwal-ekskul');
              },
              child: ItemCard(
                urlImg: 'jadwal ekskul',
                text: 'Jadwal Ekskul',
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
                                      : role == 'Pelatih'
                                          ? itemsPelatih()
                                          : role == 'Staf BK'
                                              ? itemsStafBK()
                                              : role == 'Staf Humas'
                                                  ? itemsStafHumas()
                                                  : role == 'Alumni'
                                                      ? itemsAlumni()
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
