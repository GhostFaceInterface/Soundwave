# ADENTS

## Proje Amacı
- macOS üzerinde çalışan basit ama işlevsel bir audio birleştirme uygulaması geliştirmek.
- Uygulama hem audio hem video kaynaklarından sesi okuyup tek bir export çıktısında birleştirebilmeli.

## Ürün Kapsamı
- SwiftUI tabanli macOS masaustu arayuzu
- Limitsiz sayida medya dosyasi import etme
- Klip bazli trim, siralama, ses seviyesi ayari ve oynatma
- Zaman cizelgesi mantiginda onizleme
- Kullaniciya export konumu ve dosya adi sectiren kaydetme akisi

## Teknik Kararlar
- UI: SwiftUI
- Oynatma ve medya isleme: AVFoundation, AVKit
- Dosya secimi: `fileImporter`
- Export: `NSSavePanel` + `AVAssetExportSession`

## Calisma Sekli
1. Ayrintili plan dosyasini koru ve gelistirme sirasini oradan takip et.
2. Her buyuk degisiklikten once etkiledigi akis netlestirilmeli.
3. Once calisan temel akis kurulacak, sonra UX ve ek yetenekler genisletilecek.

## Ilk Teslim Hedefi
- Kullanici dosya ekleyebilsin.
- Klipleri siralayabilsin, kirpabilsin ve ses seviyesini degistirebilsin.
- Timeline onizlemesini dinleyebilsin.
- Tek dosya olarak export alabilsin.
