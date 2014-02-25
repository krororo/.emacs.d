;; anything
(require 'anything-startup)
(require 'anything-git-files)
(require 'anything-myrurema)
(global-set-key (kbd "C-c C-v") 'anything-git-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

(defun my-custom-anything-for-files ()
  (interactive)
  (let* ((git-source (and (anything-git-files:git-p)
                          `(anything-git-files:modified-source
                            anything-git-files:untracked-source
                            anything-git-files:all-source)))
         (sources `(anything-c-source-buffers+
                    anything-c-source-recentf
                    anything-c-source-files-in-current-dir+
                    ,@git-source)))
    (anything-other-buffer sources "*anything for files*")))
(global-set-key (kbd "C-x C-g") 'my-custom-anything-for-files)
