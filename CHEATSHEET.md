# Neovim Cheatsheet

Лидер: `Space`

## Базовое
| Клавиша | Действие |
|---------|----------|
| `jk` | Выход из insert |
| `<Esc>` | Сбросить подсветку поиска |
| `<C-h/j/k/l>` | Переключение окон |
| `<leader>w` | Сохранить |
| `<leader>q` | Закрыть окно |
| `<Tab>` / `<S-Tab>` | Следующий / предыдущий буфер (вкладки сверху) |
| `<leader>fb` | Список буферов (picker) |
| `<leader>bp` | Pin буфер |

## Поиск (Snacks)
| Клавиша | Действие |
|---------|----------|
| `<leader>ff` | Файлы |
| `<leader>fg` | Grep |
| `<leader>fb` | Буферы |
| `<leader>fh` | Help |
| `<leader>e` | Explorer |
| `<leader>sd` | Диагностики |
| `<leader>ss` | LSP symbols |

В explorer / picker:
| Клавиша | Действие |
|---------|----------|
| `Enter` / `l` | Открыть файл |
| `v` / `<C-v>` | Вертикальный сплит |
| `s` / `<C-s>` | Горизонтальный сплит |
| `h` | Закрыть папку (explorer) |

## LSP
| Клавиша | Действие |
|---------|----------|
| `gd` | Definition (picker) |
| `gD` | Declaration (picker) |
| `gr` | References (picker) |
| `gi` | Implementations (picker) |
| `K` | Hover |
| `gl` | Диагностика на курсоре |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |
| `<leader>ih` | Toggle inlay hints |
| `]d` / `[d` | Следующая / предыдущая диагностика |

## Тесты (Neotest)
| Клавиша | Действие |
|---------|----------|
| `<leader>tt` | Тест под курсором |
| `<leader>tf` | Тесты файла |
| `<leader>ta` | Все тесты |
| `<leader>td` | Debug тест под курсором |
| `<leader>ts` | Сводка |
| `<leader>to` | Вывод |

## Терминал / сборка
| Клавиша | Действие |
|---------|----------|
| `<C-\>` | Float terminal по центру (toggle) |
| `<leader>rg` | `go test ./...` |
| `<leader>rt` | `cargo test` |
| `<leader>rb` | `cargo build` |

## Отладка (DAP)
| Клавиша | Действие |
|---------|----------|
| `<leader>db` | Breakpoint |
| `<leader>dc` | Continue / start |
| `<leader>do` | Step over |
| `<leader>di` | Step into |
| `<leader>dq` | Stop |

## Git
| Клавиша | Действие |
|---------|----------|
| `<leader>gs` | Git status |
| `<leader>gg` | LazyGit |
| `]h` / `[h` | Следующий / предыдущий hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hu` | Undo stage |
| `<leader>hb` | Blame |

## Навигация
| Клавиша | Действие |
|---------|----------|
| `s` | Flash jump |
| `S` | Flash treesitter |
| `<leader>a` | Harpoon add |
| `<leader>m` | Harpoon menu |
| `<leader>1-4` | Harpoon file 1-4 |

## Сессии
| Клавиша | Действие |
|---------|----------|
| `<leader>Ss` | Восстановить сессию проекта |
| `<leader>Sl` | Последняя сессия |
| `<leader>SS` | Выбрать сессию |

## Прочее
| Клавиша | Действие |
|---------|----------|
| `<leader>fm` | Форматировать буфер |
| `<leader>xx` | Trouble diagnostics |
| `<leader>?` | Which-key |
| `<C-k>` | Signature help (insert) |
