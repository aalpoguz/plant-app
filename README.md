# 🌿 Plant App - Flutter Case Study

Bu proje, **Clean Architecture** ve **BLoC Pattern** kullanılarak geliştirilmiş bir Flutter case study uygulamasıdır. Bitki tanıma, hastalık teşhisi ve bahçe yönetimi gibi özellikleri içeren modern bir mobil uygulama mimarisi örneğidir.

> ⚠️ **Not**: Bu bir case study projesidir ve aktif geliştirme aşamasındadır.

## 📋 Proje Hakkında

Bu proje, modern Flutter geliştirme pratiklerini ve mimari desenlerini göstermek amacıyla hazırlanmıştır. Temiz kod prensipleri, SOLID prensipleri ve test edilebilir kod yazma yaklaşımları uygulanmıştır.

### Temel Odak Noktaları
- ✅ Clean Architecture implementasyonu
- ✅ BLoC State Management pattern
- ✅ Dependency Injection (GetIt)
- ✅ Repository Pattern
- ✅ Use Case (Business Logic) katmanı
- ✅ API entegrasyonu ve error handling
- ✅ Offline-first yaklaşım (Local Storage)
- ✅ Responsive UI design
- ✅ Custom reusable widgets
- ✅ Unit & Widget testing altyapısı

## 🏗️ Mimari Yapı

Proje **Clean Architecture** prensiplerine göre 3 katmana ayrılmıştır:

### Katman Yapısı

```
lib/
├── core/                           # Çekirdek fonksiyonlar
│   ├── network/                    # API ve ağ işlemleri
│   │   ├── dio_client.dart        # Dio HTTP client yapılandırması
│   │   ├── api_constants.dart     # API endpoint'leri
│   │   ├── interceptors/          # Request/Response interceptors
│   │   └── connectivity/          # İnternet bağlantı kontrolü
│   ├── storage/                    # Yerel depolama
│   │   ├── storage_repository.dart
│   │   └── storage_repository_impl.dart
│   ├── error/                      # Hata yönetimi
│   │   └── failures.dart
│   └── usecases/                   # Base UseCase sınıfı
│       └── usecase.dart
│
├── features/                       # Feature modülleri
│   ├── splash/
│   │   ├── presentation/
│   │   │   ├── bloc/              # State management
│   │   │   └── pages/             # UI pages
│   │   └── domain/
│   │       └── usecases/          # Business logic
│   │
│   ├── onboarding/
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   ├── pages/
│   │   │   └── widgets/           # Feature-specific widgets
│   │   └── domain/
│   │       ├── usecases/
│   │       │   ├── check_first_time_usecase.dart
│   │       │   └── complete_onboarding_usecase.dart
│   │       └── entities/
│   │
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/            # Data models (JSON)
│   │   │   ├── datasources/       # Remote & Local data sources
│   │   │   └── repositories/      # Repository implementations
│   │   ├── domain/
│   │   │   ├── entities/          # Business entities
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/
│   │   │       ├── get_questions_usecase.dart
│   │   │       └── get_categories_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/              # HomeBloc
│   │       ├── pages/
│   │       │   ├── home_page.dart
│   │       │   └── question_detail_page.dart
│   │       └── widgets/
│   │           ├── category_card.dart
│   │           ├── question_card.dart
│   │           └── shimmers/      # Loading skeletons
│   │
│   ├── paywall/                    # Premium subscription
│   ├── scan/                       # Plant scanning
│   ├── diagnose/                   # Disease diagnosis
│   ├── my_garden/                  # Garden management
│   └── profile/                    # User profile
│
└── shared/                         # Paylaşılan bileşenler
    ├── main/                       # App initialization & DI
    ├── theme/                      # App theme & colors
    ├── utils/                      # Helper functions
    └── widgets/                    # Reusable widgets
        ├── app_button.dart
        ├── app_image.dart
        ├── custom_search_field.dart
        └── no_connection_banner.dart
```

## 🛠️ Kullanılan Teknolojiler ve Paketler

### State Management & Architecture
- **flutter_bloc (^8.1.6)**: BLoC pattern implementasyonu
- **equatable (^2.0.7)**: Value equality ve state karşılaştırması
- **get_it (^9.0.5)**: Dependency Injection
- **dartz (^0.10.1)**: Functional programming (Either, Option)

### Network & Data
- **dio (^5.9.0)**: HTTP client, interceptors
- **connectivity_plus (^7.0.0)**: Network connectivity kontrolü
- **json_annotation (^4.9.0)**: JSON serialization annotations
- **json_serializable (^6.11.1)**: JSON kod üretimi
- **shared_preferences (^2.5.3)**: Key-value storage

### Navigation
- **auto_route (^10.2.0)**: Type-safe routing
- **auto_route_generator (^10.2.5)**: Route kod üretimi

### UI & UX
- **flutter_screenutil (^5.9.3)**: Responsive design
- **cached_network_image (^3.4.1)**: Image caching & optimization
- **flutter_svg (^2.0.10+1)**: SVG asset support
- **shimmer (^3.0.0)**: Skeleton loading animasyonları
- **webview_flutter (^4.10.0)**: WebView entegrasyonu

### Development & Testing
- **build_runner (^2.4.13)**: Kod üretimi
- **flutter_lints (^5.0.0)**: Code linting
- **mocktail (^1.0.0)**: Mocking framework
- **bloc_test (^9.1.7)**: BLoC testing utilities

## 💡 Uygulanan Desenler ve Prensipler

### 1. Clean Architecture
```
Presentation ➜ Domain ➜ Data
(UI/BLoC)      (UseCases)  (Repository/API)
```
- **Presentation Layer**: UI components, BLoC/State
- **Domain Layer**: Business logic, Entities, Repository interfaces
- **Data Layer**: API calls, Local storage, Models

### 2. BLoC Pattern
```dart
// Event-driven state management
HomeBloc
  ├── Events (GetQuestionsEvent, GetCategoriesEvent)
  ├── States (Loading, Success, Error)
  └── Business logic via UseCases
```

### 3. Repository Pattern
```dart
// Abstract interface in domain layer
abstract class HomeRepository {
  Future<Either<Failure, List<QuestionEntity>>> getQuestions();
}

// Implementation in data layer
class HomeRepositoryImpl implements HomeRepository {
  // API calls + error handling
}
```

### 4. Use Case Pattern
```dart
// Single responsibility - one use case per business action
class GetQuestionsUsecase implements UseCase<List<QuestionEntity>, NoParams> {
  final HomeRepository repository;
  
  Future<Either<Failure, List<QuestionEntity>>> call(NoParams params) {
    return repository.getQuestions();
  }
}
```

### 5. Dependency Injection
```dart
// Service Locator pattern with GetIt
final sl = GetIt.instance;

void setupLocator() {
  // Blocs
  sl.registerFactory(() => HomeBloc(sl()));
  
  // UseCases
  sl.registerLazySingleton(() => GetQuestionsUsecase(sl()));
  
  // Repositories
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
}
```

## 🎨 Öne Çıkan Özellikler

### Implementasyonlar

#### ✅ API Entegrasyonu
- Dio client yapılandırması
- Request/Response interceptors
- Centralized error handling
- API constants yönetimi

#### ✅ State Management
- BLoC pattern ile reactive programming
- Event-driven architecture
- Immutable state yapısı
- State persistence

#### ✅ Error Handling
- Either pattern (Success/Failure)
- Custom Failure classes
- Network error yönetimi
- User-friendly error messages

#### ✅ Offline Support
- SharedPreferences ile local caching
- Connectivity check
- Offline-first approach

#### ✅ UI/UX
- Shimmer loading effects
- Responsive design (ScreenUtil)
- Custom reusable widgets
- SVG icon support
- Cached images

#### ✅ Testing Infrastructure
- Unit test setup
- Widget test yapısı
- BLoC test utilities
- Mock data & repositories

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler
- Flutter SDK: `>=3.9.2`
- Dart SDK: `>=3.9.2`

### Adımlar

1. **Repository'yi klonlayın**
```bash
git clone https://github.com/aalpoguz/plant-app.git
cd plant-app
```

2. **Bağımlılıkları yükleyin**
```bash
flutter pub get
```

3. **Kod üretimini çalıştırın**
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. **Uygulamayı çalıştırın**
```bash
flutter run
```

## 📱 Build

### Android APK
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### App Icon Üretimi
```bash
flutter pub run icons_launcher:create
```

## 🧪 Test

### Tüm testleri çalıştır
```bash
flutter test
```

### Coverage report
```bash
flutter test --coverage
```

## 📝 Geliştirme Notları

### Tamamlanan Özellikler
- [x] Splash screen implementasyonu
- [x] Onboarding flow (BLoC ile)
- [x] Home page (Categories & Questions)
- [x] Question detail page
- [x] Paywall ekranı
- [x] API entegrasyonu (Dio)
- [x] Local storage (SharedPreferences)
- [x] Shimmer loading effects
- [x] Responsive UI design
- [x] No connection banner
- [x] Custom widgets (Button, Image, SearchField)

### Devam Eden / Planlanan
- [ ] Scan feature (Camera integration)
- [ ] Diagnose feature (AI integration)
- [ ] My Garden feature (CRUD operations)
- [ ] Profile feature (User management)
- [ ] Backend entegrasyonu
- [ ] Firebase integration
- [ ] Push notifications
- [ ] Birim test coverage artırılması

## 👨‍💻 Geliştirici

**Ahmet Alpoguz**
- GitHub: [@aalpoguz](https://github.com/aalpoguz)

## 📄 Lisans

Bu proje case study amaçlı geliştirilmiştir.

---

**Teknik Stack**: Flutter • Dart • BLoC • Clean Architecture • Dio • GetIt
