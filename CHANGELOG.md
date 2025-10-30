# Changelog - FitPro App

## [3.0.0] - 2025-10-30

### Added
- 20 premium fitness programs from `programs.json`
- Beautiful gradient UI with Google Fonts
- Program listing with smooth cards and animations
- Program detail screen with hero image and start button
- Feedback form with full validation:
    - Name (required)
    - Email (regex validation)
    - Password (8+ characters)
- Loading spinner during data fetch
- Error handling if JSON fails
- Success screen after form submission
- Professional folder structure (`core/`, `models/`, `data/`)

### UI/UX
- Gradient buttons with shadows
- Custom cards with elevation
- Modern Material 3 design
- Responsive layout

### Technical
- Clean architecture
- Proper state management with `FutureBuilder`
- APK build ready (`flutter build apk`)