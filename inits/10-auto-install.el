;;auto-installの設定
(when(require 'auto-install nil t)
  ;;インストールディレクトリを設定する 初期値は~/.emacs.d/auto-install/
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;;EmacsWikiに登録されているelispの名前を取得する
  ;;起動時に毎回接続するためコメント
  ;; (auto-install-update-emacswiki-package-name t)
  ;;プロキシの設定
  ;; (setq url-proxy-services '(("http" . "proxy.example.com:8080") ("https" . "proxy.example.com:8080")))
  ;;install-elispの関数を利用可能にする
  (auto-install-compatibility-setup))
