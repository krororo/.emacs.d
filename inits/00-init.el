(setq-default indent-tabs-mode nil)
;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
;;; yes or no を y or n に
(fset 'yes-or-no-p 'y-or-n-p)
(setq save-place-file "~/.emacs.d/.emacs-places")
;; menu bar
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))
;; tool bar
(tool-bar-mode -1)
;; モード行に桁数も表示
(column-number-mode t)
;; 起動時のメッセージをでなくする
(setq inhibit-startup-message t)
;; 不要な行末の空白を表示
(setq-default show-trailing-whitespace t)
;; 対応する括弧をハイライト
(show-paren-mode t)
;;全角スペースとかに色を付ける
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-b-2 '((t (:background "#044"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
(font-lock-add-keywords
 major-mode
 '(
   ("　" 0 my-face-b-1 append)
   ("\t" 0 my-face-b-2 append)
   ("[ ]+$" 0 my-face-u-1 append)
   )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
                              (if font-lock-mode
                                  nil
                                (font-lock-mode t))))

;; don't remove *scratch* buffer
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" を作成して buffer-list に放り込む
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
                   (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
          ((= arg 1) (message "another *scratch* is created")))))
(add-hook 'kill-buffer-query-functions
          ;; *scratch* バッファで kill-buffer したら内容を消去するだけにする
          (lambda ()
            (if (string= "*scratch*" (buffer-name))
                (progn (my-make-scratch 0) nil)
              t)))
(add-hook 'after-save-hook
          ;; *scratch* バッファの内容を保存したら *scratch* バッファを新しく作る
          (lambda ()
            (unless (member (get-buffer "*scratch*") (buffer-list))
              (my-make-scratch 1))))

;; bell をならなくする
(setq visible-bell t)
(setq ring-bell-function 'ignore)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
