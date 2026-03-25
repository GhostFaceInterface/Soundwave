# LonerMAC

SwiftUI ve AVFoundation tabanli bir macOS audio birlestirme uygulamasi.

## Tasarim Dili
- Daha hafif, daha sakin ve daha kompakt bir duzen kullanir; buyuk hero bloklar yerine ustte komut cubugu, solda klip listesi ve sagda editor alani bulunur.
- Secili klip icin scroll edilebilir waveform editor, oynatma kafasi ve surukleyerek bolge secme akisi vardir.
- Problemli bir orta bolge secilip tek aksiyonla cikarilabilir; uygulama gerekirse klibi iki parcaya boler.

## Mevcut Ozellikler
- Audio ve video dosyalarindan ses import etme
- Finder uzerinden surukle-birak ile import etme
- Klipleri siralama
- Trim baslangic / bitis duzenleme
- Waveform uzerinden klip durumunu gorselleme
- Ses seviyesi ayarlama
- Fade in / fade out ayarlama
- Timeline icine sessizlik klibi ekleme
- Timeline onizleme oynatma ve ilerleme gostergesi
- Export ayar modeli ile varsayilan dosya adi ve format belirleme
- Export konumu ve dosya adi secerek `.m4a` veya `.caf` cikti alma
- Export sirasinda progress gostergesi
- Projeyi JSON olarak kaydetme ve tekrar acma

## Calistirma
```bash
swift build
swift run
```

Xcode ile acmak isterseniz `Package.swift` dosyasini dogrudan acabilirsiniz.

## Kullanim
1. Uygulamayi acin.
2. `Dosya Ekle` ile audio veya video dosyalari secin ya da Finder'dan pencereye surukleyip birakin.
3. Soldaki listeden bir klip secin.
4. Sag editor alaninda waveform uzerinde tiklayarak oynatma kafasini istediginiz noktaya goturun.
5. Problemli bir sesi cikarmak icin waveform uzerinde tiklayip surukleyerek bolge secin, sonra `Secili Bolgeyi Sil` butonunu kullanin.
6. Alt panelde trim, ses seviyesi, fade in ve fade out ayarlarini yapin.
7. Gerekirse `Sessizlik` ile timeline'a bosluk ekleyin.
8. Tek ana oynatma tusu ile dinleyin; secili klipten baslatmak icin `Secili Klipten Oynat` butonunu kullanin.
9. `Export` alanindan varsayilan dosya adini ve formati belirleyin.
10. `Export` ile kayit konumu ve dosya adini secip ciktiyi alin.
11. Calismanizi tekrar acmak icin `Kaydet` ile JSON proje dosyasi kaydedin, sonra `Ac` ile geri yukleyin.

## Dogrulama
```bash
swift build
swiftc -o /tmp/lonermac-smoke \
  Sources/LonerMAC/Models/MediaClip.swift \
  Sources/LonerMAC/Models/ExportSettings.swift \
  Sources/LonerMAC/Models/SavedProject.swift \
  Sources/LonerMAC/Models/TimelineBuildResult.swift \
  Sources/LonerMAC/Services/AudioWaveformService.swift \
  Sources/LonerMAC/Services/MediaAssetLoader.swift \
  Sources/LonerMAC/Services/TimelineComposer.swift \
  Sources/LonerMAC/Services/ProjectPersistenceService.swift \
  Sources/LonerMAC/Services/ExportService.swift \
  Scripts/SmokeCheck.swift
/tmp/lonermac-smoke
```

## Performans
Buyuk proje davranis notlari icin [PERFORMANCE.md](./PERFORMANCE.md) dosyasina bakin.
# lonerMAC
