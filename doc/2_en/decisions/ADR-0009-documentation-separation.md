# ADR-0009: Documentation Separation

Status: Accepted

Date: 2026-06-08

## Context

The AdaVTT project is expected to contain multiple categories of documentation intended for different audiences.

Documentation describing the architecture and development of the project has different goals, requirements, and lifecycle characteristics from documentation intended for end users.

A formal separation of documentation categories is required.

## Decision

Project documentation shall be divided into two primary categories.

### 1. Development and Maintenance Documentation

Located in:

```text
/doc
```

Purpose:

* architecture documentation;
* ADRs;
* development documentation;
* maintenance documentation;
* internal interface descriptions;
* build process documentation;
* platform and compiler support documentation;
* project roadmaps;
* architectural and organizational backlogs.

Target audience:

* developers;
* maintainers;
* port authors;
* module authors;
* project contributors.

### 2. User Documentation

Located in:

```text
/src/doc
```

Purpose:

* user manuals;
* game master manuals;
* assistant game master manuals;
* player manuals;
* server administration manuals;
* configuration documentation;
* extension documentation;
* modding documentation;
* public API documentation.

Target audience:

* users;
* game masters;
* players;
* server administrators;
* content creators;
* extension authors.

### 3. Independent Lifecycles

Development documentation and user documentation may evolve independently.

Architectural changes do not require immediate updates to user documentation until the corresponding functionality becomes available to users.

### 4. Independent Structures

The internal organization of `/doc` and `/src/doc` is defined separately and may differ according to the needs of each documentation category.

## Consequences

Project documentation gains a clear separation of responsibilities and audiences.

Maintenance of architectural documentation and user-facing documentation becomes simpler and more sustainable.

The risk of mixing internal development documentation with end-user documentation is reduced.
