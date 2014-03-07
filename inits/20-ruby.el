;; ruby-mode
(setq auto-mode-alist
      (append '(("\\.ru$\\|\\.rake$\\|Rakefile\\|Gemfile\\|\\.plugin$\\|\\.gemspec$" . ruby-mode))
              auto-mode-alist))
(font-lock-add-keywords
 'ruby-mode
 '(("\\(^\\s *\\|[\[\{\(,]\\s *\\|\\sw\\s +\\)\\(\\(\\sw\\|_\\)+\\):[^:]" (2 font-lock-reference-face))))
(add-hook 'ruby-mode-hook
          '(lambda()
             (define-key ruby-mode-map (kbd "C-c c r") 'anything-myrurema)
             (define-key ruby-mode-map (kbd "C-c d") 'flymake-display-err-minibuf)))

;; flymake setting
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
