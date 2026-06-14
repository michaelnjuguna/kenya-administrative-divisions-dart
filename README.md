# Kenya Administrative Divisions

The **Kenya Administrative Divisions** is a package that provides functionality to retrieve administrative divisions data about Kenya. It includes information about counties, constituencies, and wards.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for all changes.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
  - [Getting started](#getting-started)
  - [Methods available](#methods-available)
    - [Retrieving names](#retrieving-names)
    - [Get all](#get-all)
    - [Get counties](#get-counties)
    - [Get constituencies](#get-constituencies)
    - [Get wards](#get-wards)
- [API reference](#api-reference)
- [Contributing](CONTRIBUTION.md)
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

// We will assign kad to kenya administrative divisions
final kad = KenyaAdministrativeDivisionsBase;
```

## Methods available

### Helper methods

```dart
// Get All the data
final List<County> counties = kad.getAll;

// Get county names
final List<String> countyNames = kad.getCountyNames;
// Get constituency names
final List<String> constituencyNames = kad.getConstituencyNames();
final List<String> constituencyNames = kad.getConstituencyName(countyName: 'Mombasa');
final List<String> constituencyNames = kad.getConstituencyNames(countyCode: 1);

```

### Get Counties

```dart
// Get county
final List<County> allCounties = kad.getCounties();
final List<County> county = kad.getCounties(countyCode: 1);
final List<County> mombasa = kad.getCounties(countyName: 'Mombasa');
```

### Get Constituencies

```dart
final List<Constituency> constituencies = kad.getConstituencies();
final List<Constituency> mombasaConstituencies = kad.getConstituencies(countyCode: 1);
final List<Constituency> mombasaConstituencies = kad.getConstituencies(countyName: 'mombasa');
```

### Get wards

```dart
final List<Ward> wards = kad.getWards();
final List<Ward> mombasaWards = kad.getWards(countyCode: 1);
final List<Ward> mombasaWards = kad.getWards(countyName: 'mombasa');
List<Ward> changamweWards = kad.getWards(constituencyName: 'changamwe');
```

## API reference

### Data Models

The package exposes three primary strongly-typed models to represent Kenya's administrative structure:

#### `County`

- `int code`: The official ISO/IEBC county code (1–47).
- `String name`: The name of the county.
- `List<Constituency> constituencies`: Sub-divisions belonging to this county.

#### `Constituency`

- `String name`: The name of the constituency.
- `List<Ward> wards`: The electoral wards contained within this constituency.

#### `Ward`

- `Ward` is a zero-cost **Extension Type** that wraps a standard Dart `String`. It represents the literal name of the ward directly without any sub-properties or nested fields. It can be treated and evaluated exactly like a `String`.

---

### `KenyaAdministrativeDivisions` Class

This is the main interface interface for retrieving data. Instantiate it to access the following methods:

#### 1. Data Retrieval Methods

| Method                | Return Type          | Named Parameters                                                  | Description                                                                                |
| :-------------------- | :------------------- | :---------------------------------------------------------------- | :----------------------------------------------------------------------------------------- |
| `getAll`              | `List<County>`       | None _(Getter)_                                                   | Fetches the complete hierarchical dataset of counties, constituencies, and wards.          |
| `getCounties()`       | `List<County>`       | `{int? countyCode, String? countyName}`                           | Filters and returns list of counties matching criteria. Returns all if no params provided. |
| `getConstituencies()` | `List<Constituency>` | `{int? countyCode, String? countyName}`                           | Returns all constituencies, or filters them specifically by county parameters.             |
| `getWards()`          | `List<Ward>`         | `{int? countyCode, String? countyName, String? constituencyName}` | Returns all wards, or narrows down by county context or a explicit constituency name.      |

#### 2. Utility & Helper Methods

| Method                   | Return Type    | Named Parameters                        | Description                                                                           |
| :----------------------- | :------------- | :-------------------------------------- | :------------------------------------------------------------------------------------ |
| `getCountyNames`         | `List<String>` | None _(Getter)_                         | Returns a list of all 47 unique county names.                                         |
| `getConstituencyNames()` | `List<String>` | `{int? countyCode, String? countyName}` | Returns names of constituencies across the country or isolated by county constraints. |

## Support

If you like this project, you can support me with starring ⭐ this repository.

## License

[MIT](LICENSE)

Made with 💜
