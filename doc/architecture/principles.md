# AdaVTT Architectural Principles

## AP-001 Canonical Source Tree

The canonical source tree is the single source of truth.

Compatibility requirements shall be implemented through build-time transformations and compatibility layers.

## AP-002 Unified ABI

Objects, events, commands, and network messages shall be designed around a unified binary representation.

## AP-003 Rendering Independence

The game world shall not depend on any rendering implementation.

2D and 3D renderers operate on the same world model.

## AP-004 Network Transparency

Networked execution shall use the same command and event model as local execution.

## AP-005 Role-Based Sessions

Roles are properties of sessions, not executables.

## AP-006 Modular Deployment

Full, Server, and Client builds shall share a common core implementation.

## AP-007 Memory Independence

The memory subsystem shall not depend on object types stored within it.

## AP-008 Server Rendering Separation

Server-side code shall not require rendering subsystems.
