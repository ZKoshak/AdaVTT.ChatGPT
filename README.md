# AdaVTT.ChatGPT

<!--
Build logic belongs in /ci.

GitHub Actions should only invoke scripts from /ci and should not
contain project-specific build logic.

Это позволит в будущем добавить:

ci/
├── build_gnat.sh
├── build_gnat_95.sh
├── build_gnat_2022.sh
├── build_gwgnat.bat
├── build_janus.bat
├── build_artek.bat
└── build_meridian.bat

---

## 🔷 AdaVTT Principle #1 (очень важно)

> Canonical source tree must remain independent of any compiler or filesystem constraints.

---

## 🔷 AdaVTT Principle #2

> All constraints (DOS 8.3, GW-GNAT quirks, etc.) must be expressed as build-time transformations, not source rewrites.

---

Исходное дерево проекта является каноническим и не зависит от ограничений конкретного компилятора, ОС или файловой системы.

-->
