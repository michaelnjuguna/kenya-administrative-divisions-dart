# Kenya Administrative Divisions

The **Kenya Administrative Divisions** is a package that provides functionality to retrieve administrative divisions data about Kenya. It includes information about counties, constituencies, and wards.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Getting started](#getting-started)
  - [Methods available](#methods-available)
    - [Get all](#get-all)
    - [Get counties](#get-counties)
    - [Get constituencies](#get-constituencies)
    - [Get wards](#get-wards)
- [Contributing](#contributing)
- [Support](#support)

## Installation

To install the package, add it to your **pubspeck.yaml**

Run

```bash
dart pub add kenya_administrative_divisions
```

## Usage

### Getting started

To use the library, instantiate the `KenyaAdministrativeDivisions` class:

```dart
import 'package:kenya_administrative_divisions/kenya_administrative_divisions.dart';

// Instantiate the class
final kenyaAdmin = KenyaAdministrativeDivisionsBase();
```

## Methods available

### Get All

```dart
// Get All the data
final data = kenyaAdmin.getAll;
```

### Get Counties

```dart
// Get all county names
final counties = kenyaAdmin.getCounties();

// Get details of a county by passing its code
final county = kenyaAdmin.getCounties(1);

// Get details of a county by passing its name
final county = kenyaAdmin.getCounties('Nairobi');
```

### Get Constituencies

```dart
// Get all constituency names
final constituencies = kenyaAdmin.getConstituencies();

// Get constituencies of a county by passing its code
final constituency = kenyaAdmin.getConstituencies(1);

// Get details of a constituency by passing its name
final constituency = kenyaAdmin.getConstituencies('Westlands');
```

### Get wards

```dart
// Get all ward names
final wards = kenyaAdmin.getWards();

// Get wards of a county by passing its code
final wards = kenyaAdmin.getWards(1);

// Get wards of a county by passing its name
final wards = kenyaAdmin.getWards('Nairobi');

// Get wards of a county and constituency by passing county code/name and constituency name
final wards = kenyaAdmin.getWards(1, 'Westlands');
final wards = kenyaAdmin.getWards('Nairobi', 'Westlands');

// Get wards of a constituency by passing the constituency name
final wards = kenyaAdmin.getWards(null, 'Westlands');

```

## Contributing

1. Fork this repository.
2. Create new branch with feature name.
3. Create your feature.
4. Run the tests and ensure they pass
5. Commit and set commit message with feature name.
6. Push your code to your fork repository.
7. Create pull request.

## Support

If you like this project, you can support me with starring ⭐ this repository.

## License

[MIT](LICENSE)

Made with 💜
