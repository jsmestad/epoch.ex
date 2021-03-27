# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.2.0] - 2021-03-27
### Added
- `Epoch.seconds_since/1` returns the seconds since the epoch.
- Add typespec definitions.

## [1.1.0] - 2021-02-21
### Added
- `Epoch.now/0` returns the current time in Epoch format
- `Epoch.now/1` returns the current time in Epoch format with microsecond precision.

## [1.0.0] - 2021-02-20
### Added
- `Epoch.cast/1` converts a DateTime object to an Epoch with microsecond precision
- `Epoch.to_datetime/1` converts a Epoch to DateTime object