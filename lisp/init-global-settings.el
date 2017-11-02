;;I don't want to save desktop
(desktop-save-mode 0)

;;Turn off startup message
(setq inhibit-startup-message t)

;;Replace yes/no with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;Display line number at left margin
;;(global-linum-mode t)

;;Add backup directory
;;(setq auto-save-default nil)
;;(setq make-backup-files nil)
(setq make-backup-files t)
(setq kept-old-versions 2)
(setq kept-new-versions 2)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/.emacsbackup")))

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

;;pbcopy & pbpaste for Emacs on OSX
(when *is-a-mac*
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))
  
  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  
  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))

;;Show matching parens
(show-paren-mode 1)

;;Add highligt symbol
(require 'highlight-symbol)
(global-set-key (kbd "S-<f8>") 'highlight-symbol-at-point)

;;Global key settings
(global-set-key (kbd "C-z") 'undo)
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-,") 'previous-error)
(global-set-key (kbd "M-.") 'next-error)



(provide 'init-global-settings)
