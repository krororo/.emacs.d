;; review-mode
(autoload 'review-mode "review-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.re$\\|\\.re_$" . review-mode))
