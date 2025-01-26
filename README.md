# About

- `dist/`：提出用の `install.toml` があります．色々展開されたファイルたち．
- `src/`：編集用のソースたち．
    - `src/config/`: コンパイルオプション生成用の `.pc` ファイルたち．
- `test/`：テストコードたち．最低限のもののみ．

# Note
`sub-installers/` 内のファイル名は，拡張子 `.sh` を除いて `install.toml` の `library` の key に一致させること．`VERSION` にバージョンが自動的に割り当たる．
