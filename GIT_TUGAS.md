# Panduan Git Tugas — Aplikasi Profil Digital

## Identitas

- Nama: FAZA RIZAL ANNAFI
- NIM: 2411100
- Kelas: IFB5A
- Project: My Digital Identity — Aplikasi Profil Digital

## Nama Repository

Gunakan nama:

```text
PAM_IFB5A_FAZARIZALANNAFI_2411100
```

## Perintah dari project lokal

Jalankan di terminal VS Code pada folder project Flutter:

```powershell
cd "$HOME\Documents\FLUTTER\flutter_data_diri"
```

Jika project belum pernah memakai Git:

```powershell
git init
git add .
git commit -m "Initial commit aplikasi profil digital"
git branch -M main
git remote add origin https://github.com/USERNAME/PAM_IFB5A_FAZARIZALANNAFI_2411100.git
git push -u origin main
git switch -c develop
git push -u origin develop
```

Ganti `USERNAME` dengan username GitHub sendiri.

## Perkembangan selanjutnya

```powershell
git add .
git commit -m "Update aplikasi profil digital"
git push origin develop
```

## Pemeriksaan akhir

```powershell
git remote -v
git branch -a
git log --oneline --all --decorate -n 10
git status
```

Pastikan remote mengarah ke repository yang benar dan `git status` bersih.

## Invitation dosen

Pada halaman repository GitHub:

```text
Settings → Collaborators → Add people
```

Undang email dosen sesuai instruksi PDF:

```text
pramudyapi@gmail.com
```

## Bukti screenshot yang perlu disiapkan

1. Profile GitHub.
2. Halaman repository.
3. Struktur repository.
4. Branch `main` dan `develop`.
5. Initial commit.
6. Source code aplikasi.
7. README.md.
8. Bukti collaborator invitation.
9. Riwayat commit dan push.
10. Tampilan aplikasi profil digital.

Gabungkan screenshot tersebut ke dalam satu file PDF dan upload ke Google Classroom.
