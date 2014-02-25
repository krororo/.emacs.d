;; multi-term
(require 'multi-term)
(setq multi-term-program "/bin/bash")
(add-hook 'term-mode-hook
          '(lambda()
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             (define-key term-raw-map (kbd "ESC ESC") 'term-send-raw)
             (define-key term-raw-map (kbd "C-r") 'term-send-reverse-search-history)
             (define-key term-raw-map (kbd "C-s") 'term-send-raw)
             (define-key term-raw-map (kbd "C-n") 'term-send-down)
             (define-key term-raw-map (kbd "C-p") 'term-send-up)
             (define-key term-raw-map (kbd "C-y") 'term-paste)
             (define-key term-raw-map (kbd "C-c v") 'toggle-term-view)
             (define-key term-raw-map (kbd "C-c C-z") 'term-stop-subjob)))

(defun toggle-term-view () (interactive)
  (cond ((eq major-mode 'term-mode)
         (fundamental-mode)
         (view-mode-enable)
         (local-set-key (kbd "C-c v") 'toggle-term-view)
         (setq multi-term-cursor-point (point)))
        ((eq major-mode 'fundamental-mode)
         (view-mode-disable)
         (goto-char multi-term-cursor-point)
         (multi-term-internal))))
