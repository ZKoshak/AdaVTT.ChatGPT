# AdaVTT Vision

## Purpose

AdaVTT is a portable Virtual Tabletop (VTT) platform for tabletop role-playing games.

The project aims to provide a highly modular implementation written in Ada that can operate on a wide range of environments, from modern desktop operating systems to bare-metal systems and embedded hardware.

## Design Goals

* Portability.
* Long-term maintainability.
* Modularity.
* Compiler independence.
* Operating system independence.
* Hardware independence.
* Support for multiple deployment profiles.
* Support for multiple rendering modes.
* Stable internal interfaces and data formats.

## Non-Goals

The project is not tied to any specific RPG ruleset.

The project is not tied to any specific graphics API, operating system, network protocol, or hardware platform.

The project is not designed around any single compiler implementation.

## Target Platforms

* Linux
* Windows
* BSD systems
* DOS
* Bare-metal systems
* Embedded microcontrollers

## Target Language Standards

* Ada 95 (minimum core target)
* Ada 2005
* Ada 2012
* Ada 2022

Future support for Ada 83 compatibility layers may be provided where practical.

## Core Principle

The canonical source tree shall remain independent of compiler, operating system, filesystem, and hardware constraints.
