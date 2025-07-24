# Video Senkronizasyon Uygulaması📱 

Bu proje, üç adet videoyu aynı anda senkronize şekilde oynatabilen bir iOS uygulamasıdır. Kullanıcılar galeri üzerinden videolar seçebilir ve seçilen videolar yeni bir sayfada eşzamanlı olarak oynatılır.

## Özellikler

- Galeriden video seçebilme 
- Üç farklı videoyu aynı anda senkronize oynatma 
- Kullanıcı dostu ve modern SwiftUI arayüzü 
- Video sürükle bırak desteği

## Kullanılan Teknolojiler

- SwiftUI
- AVKit & AVFoundation
- UIKit (Galeriden video seçimi için UIImagePickerController)

## Kurulum ve Çalıştırma

1. Projeyi klonlayın veya indirin.
2. Xcode ile açın.
3. Gerekli izinleri (Fotoğraflara erişim) `Info.plist` dosyasına ekleyin:
   - `NSPhotoLibraryUsageDescription` (Galeri erişimi için)
4. Uygulamayı derleyip çalıştırın.

## Dikkat Edilmesi Gerekenler

- Projede kullanılan bazı video dosyaları büyük boyutludur. GitHub üzerinde bu dosyalar için Git Large File Storage (LFS) kullanımı önerilir.
- Uygulama iOS 15 ve üzeri sürümlerde test edilmiştir.
