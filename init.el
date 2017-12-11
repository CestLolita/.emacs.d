;;Support release after Emacs25.1
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(setq emacs-home "~/.emacs.d/")
(defconst *is-a-mac* (eq system-type 'darwin))

;;--------->Package managment<---------
;;List the repositories containing them
(require 'package)

;; activate installed packages
;;(package-initialize)

(setq package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))

;; activate installed packages
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
   Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
         ;; (if (y-or-n-p (format "Package %s is missing. Install it? " package))
         ;;     (package-install package)
         ;;     package)
	 (package-install package)))
   packages))

;; make sure to have downloaded archive description.
;; Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed 'zenburn-theme 'ivy 'swiper 'counsel 'projectile 'counsel-projectile 'ggtags 'highlight-symbol 'company) ;  --> (nil nil) if iedit and magit are already installed


;;--------->lisp and site-lisp path<---------
(add-to-list 'load-path (format "%s%s" emacs-home "site-lisp"))
(add-to-list 'load-path (format "%s%s" emacs-home "lisp"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


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
(require 'init-ggtags)
(require 'init-company)

;;--------->Custom-file<--------- 
(setq custom-file (format "%s%s" emacs-home "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
