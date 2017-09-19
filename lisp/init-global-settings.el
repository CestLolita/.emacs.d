;;I don't want to save desktop
(desktop-save-mode 0)

;;I don't want auto-save file
(setq auto-save-default nil)

;;I don't want backup file
(setq make-backup-files nil)

;;Turn off startup message
(setq inhibit-startup-message t)

;;Display line number at left margin
(global-linum-mode t)

;;Enable mouse support
(global-set-key (kbd "<mouse-4>") 'scroll-down-line)
(global-set-key (kbd "<mouse-5>") 'scroll-up-line)

;;Scrolling with trackpad
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;;Xterm mouse
(xterm-mouse-mode t)

;;Hide ^M for c/c++ and python files
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(add-hook 'c-mode-hook 'remove-dos-eol)
(add-hook 'c++-mode-hook 'remove-dos-eol)
(add-hook 'java-mode-hook 'remove-dos-eol)
(add-hook 'asm-mode-hook 'remove-dos-eol)
(add-hook 'python-mode-hook 'remove-dos-eol)

;;Global key settings
(global-set-key (kbd "C-z") 'undo)


(provide 'init-global-settings)
