;;Support release after Emacs25.1
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(setq emacs-home "~/.emacs.d/")

;;--------->Package managment<---------
;;List the repositories containing them
(setq package-archives '(
  ("melpa" . "https://melpa.org/packages/")
  ("gnu" . "https://elpa.gnu.org/packages/")
  ("marmalade" . "https://marmalade-repo.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
  zenburn-theme
  ivy
  swiper
  counsel
  projectile
  counsel-projectile
  counsel-gtags))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;--------->lisp and site-lisp path<---------
(add-to-list 'load-path (format "%s%s" emacs-home "site-lisp"))
(add-to-list 'load-path (format "%s%s" emacs-home "lisp"))

;;--------->Package configuration<--------- 
;;Basic
(require 'init-global-settings)
(require 'init-theme)
;;Site-lisp
(require 'init-google-c-style)
(require 'init-yang-mode)
(require 'init-imenu-list)
;;Application
(require 'init-ivy)
(require 'init-counsel-projectile)
(require 'init-counsel-gtags)

;;--------->Custom-file<--------- 
(setq custom-file (format "%s%s" emacs-home "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
