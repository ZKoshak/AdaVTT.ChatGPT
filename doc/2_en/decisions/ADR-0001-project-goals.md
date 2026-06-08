# ADR-0001: AdaVTT Project Goals

Status: Accepted

Date: 2026-06-08

## Context

AdaVTT is being developed as a free and modular Virtual Tabletop (VTT) platform for tabletop role-playing games.

The project is intended for a long lifecycle and emphasizes portability, maintainability, and independence from specific operating systems, hardware platforms, graphics libraries, and compiler implementations.

At this stage of development, the primary project goals must be formally defined to guide future architectural decisions.

## Decision

AdaVTT shall be developed according to the following goals.

### 1. Portability

The system shall be designed to operate across a wide range of software and hardware platforms.

Platform-independent solutions are preferred whenever practical.

### 2. Operating System Independence

The core of the system shall not depend on any specific operating system.

Platform-specific adaptation layers may be used where necessary.

### 3. Hardware Independence

The architecture shall support execution on modern desktop and server systems as well as on resource-constrained environments, including embedded and bare-metal systems.

### 4. Modularity

Major subsystems shall be designed as independent modules with minimal coupling.

### 5. Support for Multiple Operating Modes

The architecture shall support operation in the following modes:

* dedicated server;
* game master;
* assistant game master;
* player;
* observer.

The exact implementation of these roles shall be defined by separate architectural documents.

### 6. Support for Multiple Build Profiles

The architecture shall support multiple distribution profiles, including:

* full edition;
* server edition;
* client edition.

### 7. Rendering-Independent World Model

The game world shall exist independently of any rendering implementation.

Support for multiple rendering modes shall not affect the underlying world data model.

### 8. Long-Term Maintainability

When choosing between short-term convenience and long-term maintainability, maintainability shall take precedence.

### 9. Documentation of Architectural Decisions

Significant architectural decisions shall be documented through ADRs.

## Consequences

This document serves as a foundation for future architectural decisions.

All subsequent ADRs shall be evaluated in the context of the goals defined herein.
