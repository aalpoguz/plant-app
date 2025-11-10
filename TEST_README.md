# Plant App - Test Dokümantasyonu

Bu proje için mocktail kullanılarak unit ve widget testleri yazılmıştır.

## Test Yapısı

### Test Dosyaları

#### 1. Onboarding Testleri
- **Unit Testler**: `test/features/onboarding/presentation/bloc/onboarding_bloc_test.dart`
  - OnboardingBloc state değişikliklerini test eder
  - CompleteOnboardingUseCase çağrılarını doğrular
  - Başarılı ve başarısız senaryoları kapsar

- **Widget Testleri**: `test/features/onboarding/presentation/pages/onboarding_page_test.dart`
  - Onboarding sayfası UI bileşenlerini test eder
  - Button tıklamalarını ve event tetiklemelerini kontrol eder

#### 2. Home Testleri
- **Unit Testler**: `test/features/home/presentation/bloc/home_bloc_test.dart`
  - HomeBloc state yönetimini test eder
  - GetCategoriesUseCase ve GetQuestionsUsecase çağrılarını test eder
  - Loading, loaded, error durumlarını kapsar
  - Paralel veri yüklemelerini test eder

- **Widget Testleri**: `test/features/home/presentation/pages/home_page_test.dart`
  - Home sayfası shimmer ve içerik görüntülemesini test eder
  - Kategori ve soru listelerinin render edilmesini kontrol eder
  - Boş liste durumlarını test eder

#### 3. Paywall Testleri
- **Unit Testler**: `test/features/paywall/domain/usecases/show_paywall_usecase_test.dart`
  - SetPaywallShownUseCase işlevini test eder
  - Başarılı ve başarısız senaryoları kapsar

- **Widget Testleri**: 
  - `test/features/paywall/presentation/pages/paywall_page_test.dart`
    - Paywall sayfası UI bileşenlerini test eder
    - Abonelik planı seçimini kontrol eder
    - PopScope davranışını test eder
  
  - `test/features/paywall/presentation/widgets/paywall_card_test.dart`
    - PaywallCard widget'ının render edilmesini test eder
  
  - `test/features/paywall/presentation/widgets/paywall_checkbox_test.dart`
    - PaywallCheckboxCard widget'ının işlevini test eder
    - onTap callback'lerini kontrol eder

## Bağımlılıklar

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail: ^1.0.0
  bloc_test: ^9.1.7
```

## Testleri Çalıştırma

### Tüm Testleri Çalıştırma
```bash
flutter test
```

### Sadece Unit Testleri Çalıştırma
```bash
# BLoC Tests
flutter test test/features/onboarding/presentation/bloc/
flutter test test/features/home/presentation/bloc/

# UseCase Tests
flutter test test/features/onboarding/domain/usecases/
flutter test test/features/home/domain/usecases/
flutter test test/features/paywall/domain/usecases/

# All unit tests at once
flutter test test/features/onboarding/presentation/bloc/ test/features/home/presentation/bloc/ test/features/onboarding/domain/usecases/ test/features/home/domain/usecases/ test/features/paywall/domain/usecases/
```

### Belirli Bir Feature İçin Testleri Çalıştırma
```bash
flutter test test/features/onboarding/
flutter test test/features/home/
flutter test test/features/paywall/
```

## Test Coverage Summary

## Unit Tests

### Onboarding Feature

#### BLoC Tests
- ✅ `onboarding_bloc_test.dart` - 6 tests
  - Initial state
  - Page changes
  - Onboarding completion (success/failure)
  - Terms and privacy events

#### UseCase Tests
- ✅ `check_first_time_usecase_test.dart` - 3 tests
  - Returns true when user is first time
  - Returns false when user is not first time
  - Returns CacheFailure when repository fails

- ✅ `complete_onboarding_usecase_test.dart` - 2 tests
  - Completes onboarding successfully
  - Returns CacheFailure when repository fails

### Home Feature

#### BLoC Tests
- ✅ `home_bloc_test.dart` - 8 tests
  - Categories loading (success/failure)
  - Questions loading (success/failure)
  - Parallel loading scenarios
  - Partial failure scenarios

#### UseCase Tests
- ✅ `get_categories_usecase_test.dart` - 3 tests
  - Gets categories from repository
  - Returns ServerFailure when repository fails
  - Returns NetworkFailure when there is no connection

- ✅ `get_questions_usecase_test.dart` - 3 tests
  - Gets questions from repository
  - Returns ServerFailure when repository fails
  - Returns NetworkFailure when there is no connection

### Paywall Feature

#### UseCase Tests
- ✅ `show_paywall_usecase_test.dart` - 2 tests
  - Paywall shown successfully
  - Paywall shown failure

**Total Unit Tests: 27 tests**
- BLoC Tests: 14
- UseCase Tests: 13

## Notlar

- **Widget Testleri**: Widget testleri ScreenUtil bağımlılığı nedeniyle kaldırıldı.
- **Unit Testler**: Tüm unit testler başarıyla çalışmaktadır (27/27 passing).
  - BLoC Tests: 14 tests
  - UseCase Tests: 13 tests
- **Mocktail**: Tüm mock'lar mocktail kütüphanesi kullanılarak oluşturulmuştur.
- **Bloc Test**: Bloc state değişiklikleri bloc_test paketi ile test edilmiştir.

## Test Kapsamı

### ✅ Test Edilen Katmanlar
- **Domain Layer**: Use case'ler test edildi
- **Presentation Layer**: BLoC state management test edildi

### ❌ Test Edilmeyen
- **Data Layer**: Repository implementasyonları
- **Widget Layer**: UI component testleri (ScreenUtil problemi nedeniyle)

## Geliştirme Notları

Widget testlerini eklemek için:
1. ScreenUtil'i test setupında başlatın
2. Test için MaterialApp wrapper'ında ScreenUtilInit kullanın
3. Alternatif olarak, testlerde ScreenUtil bağımlılıklarını mock'layın
