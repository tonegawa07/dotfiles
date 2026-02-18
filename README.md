# dotfiles

macOS / WSL2 (Ubuntu) 対応の dotfiles。

## 構成

| ファイル | 内容 |
|----------|------|
| `.zshrc` | 共通設定（starship, エイリアス, 履歴検索） |
| `.zshrc.darwin` | Mac固有設定（zim, nvm, pnpm, uv, mise） |
| `.zshrc.linux` | WSL2/Linux固有設定（zim） |
| `.zimrc` | zsh プラグイン（補完, シンタックスハイライト, abbr, 履歴検索） |
| `.gitconfig` | Git 共通設定（エイリアス） |
| `.config/starship.toml` | Starship プロンプト設定 |
| `gh_extensions.txt` | GitHub CLI 拡張機能リスト |
| `install.sh` | セットアップスクリプト |

## セットアップ

```sh
git clone git@github.com:tonegawa07/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
source ~/.zshrc
```

ghq を使う場合:

```sh
ghq get git@github.com:tonegawa07/dotfiles.git
cd $(ghq root)/github.com/tonegawa07/dotfiles
bash install.sh
source ~/.zshrc
```

`install.sh` は以下を行います:

- 各dotfileのシンボリックリンクを `$HOME` に作成
- `~/.gitconfig.local` を作成（名前・メールアドレスを手動で設定）
- GitHub CLI 拡張機能のインストール

## フォント

Starship の一部アイコンに Nerd Font を使用しています。

```sh
# macOS
brew install --cask font-hack-nerd-font
```

VSCode のターミナルで使う場合は `settings.json` に追加:

```json
"terminal.integrated.fontFamily": "Hack Nerd Font"
```
