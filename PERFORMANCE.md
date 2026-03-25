# Performans Notlari

- Waveform uretimi import aninda yapiliyor. Uzun dosya listelerinde ilk ekleme suresi dosya sayisi ve sureleriyle birlikte artar.
- Her trim, volume veya fade degisikliginde preview composition yeniden olusturuluyor. Cok sayida uzun klipte bu yeniden kurulum hissedilir gecikme yaratabilir.
- Export sirasinda timeline tumuyle yeniden derleniyor. Buyuk projelerde export oncesi kisa bir hazirlama suresi normaldir.
- Sessizlik klipleri ucuzdur; asıl maliyet gercek medya kliplerinden gelir.
- Bir sonraki performans iterasyonunda hedef: waveform cache, incremental preview rebuild ve arka planda toplu metadata/waveform pipeline.
