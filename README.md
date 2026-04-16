# Quietline

<p align="center">
  <img alt="macOS" src="https://img.shields.io/badge/macOS-14%2B-ff78b4?style=for-the-badge">
  <img alt="Swift" src="https://img.shields.io/badge/Swift-6-f7ce46?style=for-the-badge">
  <img alt="SwiftUI" src="https://img.shields.io/badge/SwiftUI-native-60d5df?style=for-the-badge">
  <img alt="AVFoundation" src="https://img.shields.io/badge/AVFoundation-audio%20timeline-211c2c?style=for-the-badge">
</p>

<p align="center">
  <a href="https://tenor.com/tr/view/bocchi-bocchitherock-hitori-gotou-%E3%81%BC%E3%81%A3%E3%81%A1%E3%81%96%E3%82%8D%E3%81%A3%E3%81%8F-anime-gif-26895031">
    <img src="https://media1.tenor.com/m/2xIhdOQpTbYAAAAd/bocchi-bocchitherock.gif" alt="Hitori Gotoh waiting alone" width="78%">
  </a>
</p>

Quietline, ses dosyalarını ve videolardan gelen sesleri tek bir timeline üzerinde birleştirmek için yazılmış yerel bir macOS uygulaması. Klipleri ekliyorsun, waveform üzerinde nerede olduğunu görüyorsun, rahatsız eden kısmı seçip çıkarıyorsun, sonra sonucu audio ya da video olarak export ediyorsun.

Bu uygulamanın teması Hitori Gotoh'dan geliyor. Pembe ağırlıklı arayüz, mavi-sarı toka detayı, gitar teli çizgileri ve biraz da "bunu kimseye anlatmadan tek başıma çözeyim" havası. Bocchi gibi panikli, ama işini yapınca gayet net.

<p align="center">
  <a href="https://tenor.com/tr/view/bocchi-the-rock-anime-anime-girl-hitori-gotou-avoiding-issue-gif-27031923">
    <img src="https://media1.tenor.com/m/PbPr6Bpj-6kAAAAd/bocchi-the-rock-anime.gif" alt="Hitori Gotoh avoiding issue" width="30%">
  </a>
  <a href="https://tenor.com/tr/view/bocchitherock-bocchi-hitori-gotou-%E3%81%BC%E3%81%A3%E3%81%A1%E3%81%96%E3%82%8D%E3%81%A3%E3%81%8F-anime-gif-26998598">
    <img src="https://media1.tenor.com/m/vD4J7J3JTnUAAAAd/bocchitherock-bocchi.gif" alt="Bocchi square mood" width="30%">
  </a>
  <a href="https://tenor.com/tr/view/bocchi-bocchi-the-rock-anime-%E3%81%BC%E3%81%A3%E3%81%A1%E3%81%96%E3%82%8D%E3%81%A3%E3%81%8F-hitori-gotou-gif-27014588">
    <img src="https://media1.tenor.com/m/QUBPZeyDfbQAAAAd/bocchi-bocchi-the-rock.gif" alt="Bocchi the rock square mood" width="30%">
  </a>
</p>

## Uygulama

<p align="center">
  <img src="pics%20for%20readme/Ana%20bak%C4%B1%C5%9F.png" alt="Quietline ana ekran" width="100%">
</p>

Quietline terminalde çalıştırıp unutacağın bir script değil. Build edildiğinde gerçek bir `.app` bundle olarak açılıyor. Finder'dan, Dock'tan ya da `~/Applications` içinden normal macOS uygulaması gibi çalıştırabiliyorsun.

Arayüz üç ana parçaya ayrılıyor:

- `Klipler`: Eklediğin dosyaları seçtiğin, sıraladığın ve sildiğin yer.
- `Playback`: Timeline'ı dinlediğin, başa döndüğün ve seçili klipten oynattığın alan.
- `Düzenleyici`: Waveform, trim, ses, fade ve seçili bölge silme araçları.

## Ne İşe Yarıyor?

Bazen birkaç ASMR kaydını birleştirmek istiyorsun. Bazen bir videodan sadece sesi lazım oluyor. Bazen de kaydın ortasında ufak bir patlama, tık, nefes veya gereksiz boşluk var. Büyük editörleri açmak fazla geliyor; basit araçlar da waveform üzerinde rahat çalıştırmıyor.

Quietline bu araya oturuyor:

- Dosyaları ekle.
- Timeline üzerinde akışı gör.
- Problemli yeri seç.
- Tek hamlede çıkar.
- Sonucu `.m4a`, `.caf` veya `.mp4` olarak al.

## Özellikler

- Audio ve video dosyalarından ses import etme
- Finder'dan sürükle-bırak ile dosya ekleme
- Klipleri yukarı/aşağı taşıma
- Seçili klipten oynatma
- `Space` ile oynat/durdur
- `Cmd+Z` / `Ctrl+Z` ile geri alma
- `Cmd+Shift+Z` / `Ctrl+Shift+Z` ile ileri alma
- Tek ana timeline waveform üzerinde seek ve seçim
- Waveform üzerinde sürükleyerek sorunlu bölge seçme
- Seçili bölgeyi klibi bölerek timeline'dan çıkarma
- Trim başlangıç/bitiş ayarı
- Ses seviyesi ve güvenli boost
- Fade in / fade out
- `.m4a`, `.caf`, `.mp4` export
- Video export sırasında audio-only bölümlerde kontrollü siyah video
- macOS `.app` bundle üretimi
- Yerel `~/Applications/Quietline.app` kurulumu

## Kurulum

Gerekenler:

- macOS 14 veya üzeri
- Xcode Command Line Tools
- Swift 6 toolchain

Projeyi build edip uygulamayı hemen açmak için:

```bash
./script/build_and_run.sh
```

Bu komut SwiftPM çıktısını `dist/Quietline.app` olarak paketler ve uygulamayı gerçek macOS app olarak açar.

Sadece bundle üretmek için:

```bash
./script/build_and_run.sh --bundle
open dist/Quietline.app
```

Kendi kullanıcı Applications klasörüne kurmak için:

```bash
./script/build_and_run.sh --install
```

Kurulumdan sonra uygulama burada olur:

```text
~/Applications/Quietline.app
```

Xcode ile çalışmak istersen `Package.swift` dosyasını açman yeterli.

## Kullanım

<p align="center">
  <img src="pics%20for%20readme/Kullan%C4%B1m.png" alt="Quietline kullanım akışı" width="100%">
</p>

1. `Dosya Ekle` ile audio veya video dosyalarını seç.
2. İstersen dosyaları Finder'dan pencereye sürükleyip bırak.
3. Soldaki `Klipler` listesinden çalışacağın klibi seç.
4. Waveform üzerinde tek tıkla oynatma kafasını istediğin noktaya taşı.
5. Sorunlu yeri çıkarmak için waveform üzerinde sürükleyerek bölge seç.
6. `Seçili Bölgeyi Sil` ile o kısmı timeline'dan çıkar.
7. Trim, ses seviyesi, fade in ve fade out ayarlarını düzenle.
8. `Seçili Klipten Oynat` ile sadece aktif klipten başlayarak dinle.
9. Export formatını seç.
10. `Export` ile çıktıyı al.

<p align="center">
  <img src="pics%20for%20readme/detay.png" alt="Quietline detay görünümü" width="100%">
</p>

## Kullanım Opsiyonları

### Import

Quietline audio ve video kaynaklarını aynı timeline üzerinde kullanabilir.

- Audio dosyası ekleyebilirsin: `.m4a`, `.mp3`, `.wav`, `.caf` ve AVFoundation'ın okuyabildiği diğer ses formatları.
- Video dosyası ekleyebilirsin: video içindeki ses timeline'a alınır.
- Karışık proje kurabilirsin: audio ve video kaynakları aynı akışta birleşir.

### Playback

- Ana oynat/durdur butonu tüm timeline'ı kontrol eder.
- `Space` oynat/durdur kısayoludur.
- `Seçili Klipten Oynat`, seçili klibin başına gider ve oradan dinletir.
- Timeline seek klip sınırlarını geçebilir; bu sayede klip geçişlerini duyabilirsin.

### Editing

- Waveform üzerinde tek tık: playhead taşıma.
- Waveform üzerinde sürükleme: bölge seçimi.
- `Seçili Bölgeyi Sil`: seçilen aralığı çıkarır.
- Kenara çok yakın seçimlerde mikro klip üretmemek için boundary snap uygulanır.
- Ses slider'ı sadece ekranda görünen bir değer değildir; preview ve export mix zincirine yansır.

### Export

| Format | Ne için iyi? | Not |
| --- | --- | --- |
| `M4A Audio` | Günlük kullanım, paylaşım, küçük dosya | Varsayılan pratik çıktı |
| `CAF PCM` | Daha ham ve işlenebilir ses çıktısı | Büyük dosya üretebilir |
| `MP4 Video` | Video isteyen platformlar veya video kaynaklı projeler | Audio-only bölümlerde kontrollü siyah video kullanılır |

MP4 export mümkün olduğunda passthrough kullanır. Ses/fade/boost gibi işlemler devreye girerse AVFoundation reencode fallback'i çalışabilir.

## Tema

Quietline'ın Hitori Gotoh tarafı sadece "pembe yapalım" seviyesinde değil. Arayüzün tonu bilinçli olarak küçük, kişisel ve biraz içe dönük tutuldu. Büyük ve gürültülü bir prodüksiyon masası yerine, tek başına çalışan birinin hızlıca işini çözdüğü pastel bir edit alanı gibi durması hedeflendi.

- Pembe ana vurgu Hitori'nin saç/hoodie enerjisinden geliyor.
- Mavi-sarı toka motifi uygulamanın küçük imzası gibi kullanılıyor.
- Gitar teli çizgileri hem Bocchi referansı hem de timeline hissi veriyor.
- Açık pastel paneller uzun süre bakarken göz yormasın diye tercih edildi.
- Koyu waveform sahnesi ise düzenleme alanını net tutuyor.

## Geliştirici Notları

SwiftPM build:

```bash
env CLANG_MODULE_CACHE_PATH=/tmp/clang-module-cache SWIFTPM_ENABLE_PLUGINS=0 swift build
```

App bundle doğrulama:

```bash
./script/build_and_run.sh --verify
```

Kurulu app doğrulama:

```bash
codesign --verify --deep --strict /Users/boe747/Applications/Quietline.app
```

Temel smoke akışı gerekiyorsa:

```bash
swiftc -o /tmp/quietline-smoke \
  Sources/Quietline/Models/MediaClip.swift \
  Sources/Quietline/Models/ExportSettings.swift \
  Sources/Quietline/Models/SavedProject.swift \
  Sources/Quietline/Models/TimelineBuildResult.swift \
  Sources/Quietline/Services/AudioWaveformService.swift \
  Sources/Quietline/Services/MediaAssetLoader.swift \
  Sources/Quietline/Services/TimelineComposer.swift \
  Sources/Quietline/Services/ProjectPersistenceService.swift \
  Sources/Quietline/Services/ExportService.swift \
  Scripts/SmokeCheck.swift
/tmp/quietline-smoke
```

## Bilinen Notlar

- `swift build` sırasında `ExportService.swift` içinde Swift concurrency / `Sendable` uyarıları görülebilir. Şu an build'i bloklamaz.
- `swift test` için mevcut package içinde ayrı test target'ı yoksa SwiftPM `no tests found` döndürebilir.
- GUI uygulamasını gerçek macOS davranışıyla test etmek için ham executable yerine `.app` bundle üzerinden açmak daha doğru sonuç verir.

## Kapanış

Quietline'ın olayı basit: bir sürü ses parçasını toparla, can sıkan yerleri kes, sonucu temiz al. Arada biraz Bocchi panik enerjisi varsa da sorun değil; en azından timeline düzenli.
