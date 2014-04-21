;; ruby-mode
(setq auto-mode-alist
      (append '(("\\.ru$\\|\\.rake$\\|Rakefile\\|Gemfile$\\|\\.plugin$\\|\\.gemspec$" . ruby-mode))
              auto-mode-alist))
(font-lock-add-keywords
 'ruby-mode
 '(("\\(^\\s *\\|[\[\{\(,]\\s *\\|\\sw\\s +\\)\\(\\(\\sw\\|_\\)+\\):[^:]" (2 font-lock-reference-face))))
(add-hook 'ruby-mode-hook
          '(lambda()
             (define-key ruby-mode-map (kbd "C-c c r") 'anything-myrurema)
             (define-key ruby-mode-map (kbd "C-c d") 'flymake-display-err-minibuf)))

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; flymake setting
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
