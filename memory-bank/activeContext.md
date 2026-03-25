# Active Context

## Current Task
1. `AGENTS.md` talebine gore memory-bank yapisini kurmak
2. Timeline waveform'da secili klibin sonundan sonraki klibe gecisi mumkun kilmak
3. `Space` icin daha guvenli bir oynat/durdur cozumü bulmak

## Recent Changes
- Arayuz daha kompakt hale getirildi
- Tek ana, scroll edilebilir timeline waveform editor eklendi
- Klibin ortasindan bolge secip silme destegi eklendi
- Sol listedeki klibe tiklayinca preview o klibin basina gidiyor
- Klibe ozel renkler eklendi
- Memory-bank cekirdek dosyalari olusturuldu
- Coklu waveform karmasasi kaldirildi; tek ana waveform uzerinde timeline gezisi ve secim birlestirildi
- Timeline seek sirasinda secili klip oynatma zamanina gore otomatik degisiyor
- `Space` icin gizli keyboard shortcut yerine odak kontrollu SwiftUI `onKeyPress(.space)` yaklasimi eklendi
- Uygulama launch ve ilk gorunumde foreground app olarak aktive ediliyor; amac Finder/Quick Look odagini kapmak
- Timeline waveform zoom mantigi yeniden ayarlandi; minimum zoom artik viewport fit'e daha yakin

## Important Notes
- Editor artik tek ana waveform kullaniyor; onceki iki-katmanli waveform yapisi kaldirildi
- Onceki `space` denemesi event monitor ile yapildi ve geri alindi
- Yeni `space` cozumü uygulama yuzeyi odaktayken aktif, export dosya adi alani odaktayken devre disi
- `swift run` senaryosunda menu cubugunda baska uygulama aktif kalirsa once app aktivasyonu dogrulanmali

## Next Steps
- Gercek medya dosyalariyla timeline waveform seek davranisini manuel test et
- `Space` kisayolunun text-entry davranisini manuel test et
- Gerekirse timeline waveform icine otomatik scroll-to-playhead davranisi ekle
