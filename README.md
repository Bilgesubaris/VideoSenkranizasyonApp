# 🎬 Video Senkronizasyon Uygulaması 📱

Bu proje, **T.C. Millî Eğitim Bakanlığı Yenilik ve Eğitim Teknolojileri Genel Müdürlüğü (YEĞİTEK)** bünyesinde **EBA sistemine yönelik** staj projesi kapsamında geliştirilmiştir.

## 📌 Proje Hakkında

Bu iOS uygulaması, kullanıcıların galeri üzerinden üç farklı video seçmesini ve bu videoları eşzamanlı olarak oynatmasını sağlar. Eğitim içeriklerinin çoklu kamera açılarıyla sunulması veya farklı video kaynaklarının karşılaştırmalı izlenmesi gibi senaryolarda kullanılabilir.

## 🚀 Özellikler

- 📂 Galeriden video seçebilme  
- 🎥 Üç farklı videoyu **aynı anda senkronize** oynatma  
- 🧑‍💻 Kullanıcı dostu ve modern **SwiftUI arayüzü**  
- 📦 Video **sürükle bırak desteği**  

## 🛠️ Kullanılan Teknolojiler

- `SwiftUI`
- `AVKit` & `AVFoundation`
- `UIKit` (`UIImagePickerController` ile galeri seçimi için)

## ⚙️ Kurulum ve Çalıştırma

1. Bu projeyi klonlayın veya indirin.  
2. Xcode ile açın.  
3. **Info.plist** dosyasına aşağıdaki izinleri ekleyin:
   - `NSPhotoLibraryUsageDescription` (Galeriden video seçimi için)
4. Uygulamayı cihaz veya simülatör üzerinde derleyip çalıştırın.

## ⚠️ Dikkat Edilmesi Gerekenler

- Uygulamada kullanılan bazı video dosyaları büyük boyutludur. Bu nedenle GitHub üzerinde proje paylaşımı yapılırken **Git Large File Storage (LFS)** kullanılması önerilir.
- Uygulama, **iOS 15 ve üzeri** sürümlerde test edilmiştir.

