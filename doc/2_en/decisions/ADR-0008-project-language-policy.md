# ADR-0008: Project Language Policy

Status: Accepted

Date: 2026-06-08

## Context

AdaVTT is intended as a long-term project that may involve contributors and users from multiple countries and language backgrounds.

A formal policy is required to define the primary project language, documentation practices, and translation procedures.

## Decision

### 1. Russian Is the Primary Project Language

Russian is the canonical language of the project.

Primary documentation shall be written in Russian.

Architectural decisions shall be initially discussed and recorded in Russian.

### 2. English Is the Mandatory Secondary Language

Every document that is part of the official project documentation shall have an English version.

The English version is considered an official translation of the Russian original.

### 3. Documentation Structure

Documentation shall be organized as follows:

```text
doc/
├── 1_ru/
└── 2_en/
```

The `1_ru` directory contains the canonical documentation.

The `2_en` directory contains the official English translation.

### 4. Version Priority

In the event of discrepancies between Russian and English versions of a document, the Russian version shall take precedence.

Discrepancies should be resolved by updating the translation.

### 5. Additional Languages

The project may support additional documentation languages.

Additional languages are optional.

Partial translations are permitted.

Example:

```text
doc/
├── 1_ru/
├── 2_en/
├── de/
├── fr/
└── ...
```

### 6. Translation Requirements

Translations should aim for maximum fidelity to the source document.

Terminological and architectural accuracy shall take precedence over stylistic considerations.

## Consequences

Russian becomes the primary language for project knowledge management.

English documentation provides accessibility for the international community.

The documentation structure allows additional languages to be introduced without altering the existing organization.
