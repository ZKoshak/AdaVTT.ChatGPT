# ADR-0007: Documentation Policy

Status: Accepted

Date: 2026-06-08

## Context

AdaVTT is intended to be a long-term project with strong requirements for portability, maintainability, and architectural stability.

For projects of this nature, the absence of timely documentation often leads to loss of architectural knowledge, duplicated effort, and increased maintenance costs.

A formal documentation policy is therefore required.

## Decision

Documentation is considered an integral part of the AdaVTT project.

Documentation development is treated as part of the software development process rather than an activity performed after implementation.

### 1. Documentation Precedes Implementation

For major subsystems, appropriate architectural documentation should be prepared before implementation begins.

Documentation may be refined during development.

### 2. Architectural Decisions Shall Be Documented

Significant architectural decisions shall be recorded using Architecture Decision Records (ADR).

### 3. Documentation Shall Be Stored with Source Code

Documentation is part of the project repository and shall be version-controlled alongside source code.

### 4. Documentation Evolves Together with the Codebase

Changes to architecture and interfaces shall be accompanied by corresponding documentation updates.

### 5. Documentation Takes Precedence over Informal Discussions

In case of discrepancies between documentation and discussions, messages, or issue trackers, the current version of the documentation shall be considered authoritative.

### 6. Documentation Is Required for Maintenance

New subsystems, public interfaces, and significant architectural changes shall be accompanied by documentation.

## Consequences

Documentation becomes part of the development and maintenance process.

Architectural knowledge is preserved independently of individual contributors and project participants.
