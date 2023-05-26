# MasmBuildScripts
### Нужно поместить скрипты в корневую папку с `masm32`, после их можно будет вызывать из любого места (с указанием абсолютного пути)

<br/>

### `compile.ps1` - компиляция `.asm` в `.obj`
###  `link.ps1` - линковка `.obj` в `.exe`
### `build.ps1` - комбинация `compile.ps1` и `link.ps1`, генерирует `.obj` и `.exe`

<br/>

## `compile.ps1` аргумент:
1. Путь до `.Asm` / `.asm`

## `link.ps1` аргументы:
1. Путь до `.obj`
2. Флаг для линковщика `CONSOLE` / `WINDOW` (`default: CONSOLE`) (`/SUBSYSTEM:CONSOLE/WINDOW`)

## `build.ps1` имеет такие же  как у `link.ps1`

<br/>

---
<br/>

## Примеры

### Компиляция

```ps
$PATH_TO_MASM32/compile.ps1 "$PATH_TO_ASM/example.asm"
```

### Линковка

Для консольного приложения
```ps
$PATH_TO_MASM32/link.ps1 "$PATH_TO_ASM/example.obj"
```

Для оконного приложенгия
```ps
$PATH_TO_MASM32/link.ps1 "$PATH_TO_ASM/example.obj" "WINDOW"
```

### Сборка

Для консольного приложения
```ps
$PATH_TO_MASM32/build.ps1 "$PATH_TO_ASM/example.asm"
```

Для оконного приложенгия
```ps
$PATH_TO_MASM32/build.ps1 "$PATH_TO_ASM/example.asm" "WINDOW"
