;; load-path 追加
(let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(require 'melpa)

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; load proxy setting
;; example
;;  (setq url-proxy-services '(("http" . "proxy.example.com:8080")
;;                            ("https" . "proxy.example.com:8080")))
;;  (setq url-http-proxy-basic-auth-storage
;;        (list (list "proxy.example.com:8080"
;;                    (cons "description"
;;                          (base64-encode-string "username:password")))))
(when (file-exists-p (expand-file-name "~/.emacs.d/proxy-setting.el"))
  (load-file (expand-file-name "~/.emacs.d/proxy-setting.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-commit-mode-hook nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(rspec-spec-command "rspec -c")
 '(rspec-use-rake-when-possible nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-insert-encoding-magic-comment nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#003300" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "unknown" :family "Ricty"))))
 '(enh-ruby-op-face ((t (:foreground "violet"))))
 '(flymake-errline ((t (:underline "red"))))
 '(flymake-warnline ((t (:underline "orange"))))
 '(font-lock-comment-face ((t (:foreground "red"))))
 '(font-lock-keyword-face ((t (:foreground "magenta"))))
 '(magit-diff-add ((t (:foreground "green"))))
 '(magit-diff-del ((t (:foreground "red"))))
 '(magit-diff-file-header ((t (:foreground "yellow"))))
 '(magit-item-highlight ((t (:background "gray5"))))
 '(review-mode-bold-face ((t (:foreground "deep sky blue" :weight bold))))
 '(review-mode-header1-face ((t (:foreground "chartreuse" :weight bold))))
 '(review-mode-header2-face ((t (:foreground "lawn green" :weight bold))))
 '(review-mode-header3-face ((t (:foreground "green" :weight bold))))
 '(review-mode-italic-face ((t (:foreground "red" :slant italic :weight bold))))
 '(review-mode-title-face ((t (:foreground "cyan" :weight bold))))
 '(review-mode-underline-face ((t (:foreground "cyan" :underline t)))))
