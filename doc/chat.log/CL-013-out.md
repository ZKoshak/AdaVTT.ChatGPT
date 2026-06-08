Для текущего состояния AdaVTT я бы создал следующий минимальный набор файлов:

```text
.github/
└── workflows/
    ├── build.yml
    ├── style.yml
    └── structure.yml

ci/
└── build_gnat.sh

.gitignore
```

Такой набор не перегружен, но уже создаёт основу для дальнейшего развития CI.

---

### `.github/workflows/build.yml`

```yaml
name: Build

on:
  push:
  pull_request:

jobs:
  gnat-build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Install GNAT
        run: |
          sudo apt-get update
          sudo apt-get install -y gnat gprbuild

      - name: Build AdaVTT
        run: |
          chmod +x ci/build_gnat.sh
          ./ci/build_gnat.sh

      - name: Upload build artifacts
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: adavtt-obj
          path: obj/
          if-no-files-found: ignore
```

---

### `.github/workflows/style.yml`

```yaml
name: Style Check

on:
  push:
  pull_request:

jobs:
  style:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Check for TAB characters
        run: |
          if grep -R -n $'\t' src/; then
            echo "TAB characters found."
            exit 1
          fi

      - name: Check for CRLF line endings
        run: |
          if find . \
            -type f \
            ! -path "./.git/*" \
            -exec grep -I -l $'\r' {} \; | grep . ; then
            echo "CRLF line endings found."
            exit 1
          fi
```

---

### `.github/workflows/structure.yml`

```yaml
name: Project Structure

on:
  push:
  pull_request:

jobs:
  structure:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Verify required files
        run: |
          test -f README.md
          test -f LICENSE.PD
          test -f adavtt.gpr

      - name: Verify required directories
        run: |
          test -d src
          test -d src/core
          test -d obj
          test -d doc
```

---

### `ci/build_gnat.sh`

```bash
#!/usr/bin/env bash

set -e

echo "Building AdaVTT..."

mkdir -p obj

gprbuild -P adavtt.gpr

echo "Build completed."
```

---

### `.gitignore`

```gitignore
# Build directories
obj/
bin/

# GNAT artifacts
*.ali
*.o
*.adt
*.dg

# Executables
*.exe
*.out

# Archives
*.zip
*.tar
*.tar.gz
*.7z

# Editor files
*~
*.swp
*.swo

# macOS
.DS_Store

# Windows
Thumbs.db

# VS Code
.vscode/

# JetBrains
.idea/
```

---

Я бы также сразу добавил в `README.md` раздел с соглашением:

```
Build logic belongs in /ci.

GitHub Actions should only invoke scripts from /ci and should not
contain project-specific build logic.
```

Это позволит в будущем добавить:

```text
ci/
├── build_gnat.sh
├── build_gnat_95.sh
├── build_gnat_2022.sh
├── build_gwgnat.bat
├── build_janus.bat
├── build_artek.bat
└── build_meridian.bat
```

без переписывания workflow-файлов. Для проекта вроде AdaVTT это особенно полезно, потому что поддержка исторических компиляторов почти наверняка потребует отдельных сценариев сборки вне стандартной инфраструктуры GitHub Actions.
