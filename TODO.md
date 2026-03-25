# Yapilacaklar Listesi

## 0. Kurulum ve Cevre
- [x] Proje yapisini netlestir.
- [x] Kullanilacak Apple frameworklerini dogrula.
- [x] Build alinabilecek paket/app iskeletini kur.
- [x] Minimum macOS surumunu belirle.

## 1. Proje Iskeleti
- [x] Swift Package veya acilabilir Xcode yapisini olustur.
- [x] Ana uygulama giris noktasini tanimla.
- [x] Ana pencere ve temel navigasyon yapisini kur.
- [x] Ortak tema, spacing ve panel yapilarini tanimla.

## 2. Domain Modeli
- [x] Import edilen medya kaydini temsil eden veri modelini olustur.
- [x] Her klip icin id, URL, dosya adi, sure, trim baslangici, trim bitisi, ses seviyesi alanlarini tanimla.
- [x] Zaman cizelgesi state modelini olustur.
- [x] Export ayarlari modelini tanimla.

## 3. Medya Import
- [x] Audio ve video UTType kapsamini belirle.
- [x] Coklu dosya secimi destekli importer ekle.
- [x] Drag and drop akisina hazir bir alan tasarla.
- [x] Import edilen her dosyanin sure ve temel metadata bilgisini asenkron yukle.
- [x] Desteklenmeyen veya okunamayan dosyalar icin hata handling ekle.

## 4. Klip Listeleme ve Siralama
- [x] Klipleri listede goster.
- [x] Dosya adi, sure ve trim ozeti goster.
- [x] Secili klibi vurgula.
- [x] Kliplerin sirasini degistirebilmek icin move/reorder destegi ekle.
- [x] Klip silme aksiyonu ekle.

## 5. Klip Duzenleme
- [x] Trim baslangic ve bitis kontrollerini kur.
- [x] Gecersiz trim araliklarini engelle.
- [x] Ses seviyesi sliderini ekle.
- [x] Tek klip oynatma ve durdurma aksiyonlarini ekle.
- [x] Klip ozeti metnini duzenleme state'ine bagla.

## 6. Timeline ve Onizleme
- [x] Tum kliplerden guncel bir composition uretecek servis yaz.
- [x] Trim degerlerini composition'a uygula.
- [x] Ses seviyesi ayarlarini audio mix'e uygula.
- [x] Preview player item'ini dinamik olarak yeniden uret.
- [x] Oynat, duraklat, basa sar kontrolleri ekle.
- [x] Oynatma ilerleme bilgisini UI'da goster.

## 7. Export Akisi
- [x] Kullaniciya dosya adi ve kayit konumu sectiren form/panel ekle.
- [x] Varsayilan cikti uzantisini belirle.
- [x] Export preset secimini tanimla.
- [x] Export sirasinda progress state goster.
- [x] Basari ve hata durumlarini ayir.

## 8. UX ve Dayaniklilik
- [x] Bos durum ekrani tasarla.
- [x] Uzun sureli islemler icin loading durumu ekle.
- [x] Export sirasinda cift tetiklemeyi engelle.
- [x] Buyuk dosya listelerinde performans risklerini not et.
- [x] Gereken yerlerde ana thread / background thread ayrimini yap.

## 9. Test ve Dogrulama
- [x] Proje build aliyor mu kontrol et.
- [x] Temel import akislarini smoke check ile dogrula.
- [ ] Trim ve ses seviyesi degisikliklerinin preview'e yansidigini manuel olarak dinleyerek dogrula.
- [x] Export edilen dosyanin oynatilabildigini smoke check ile dogrula.
- [x] Bilinen eksikleri ve sonraki iterasyonlari dokumante et.

## 10. Sonraki Iterasyonlar
- [x] Dalga formu gosterimi
- [x] Fade in / fade out
- [x] Sessizlik ekleme
- [x] Coklu export formatlari
- [x] Proje dosyasi olarak kaydet / tekrar ac
