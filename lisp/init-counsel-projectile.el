(require 'counsel-projectile)


;;Projectil
(projectile-mode)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'ivy)
(setq projectile-globally-ignored-directories
  (append '(
    ".git"
    ".svn")
    projectile-globally-ignored-directories))
(setq projectile-globally-ignored-files
  (append '(
    ".DS_Store"
    ".projectile"
    "GPATH"
    "GRTAGS"
    "GTAGS"
    "*.o"
    "*.obj"
    "*.bin"
    "*.lib"
    "*.gz"
    "*.pyc"
    "*.jar"
    "*.tar.gz"
    "*.tgz"
    "*.zip"
    "*.jpg"
    "*.bmp"
    "*.sublime-project"
    "*.sublime-workspace")
    projectile-globally-ignored-files))


;;Counsel
(counsel-projectile-mode)


;;Bind global key
(global-set-key (kbd "?") 'counsel-projectile-ag)
(global-set-key (kbd "C-o") 'counsel-projectile-find-file)


(provide 'init-counsel-projectile)
