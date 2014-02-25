;; anything
(require 'anything-startup)
(require 'anything-git-files)
(require 'anything-myrurema)
(global-set-key (kbd "C-c C-v") 'anything-git-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
