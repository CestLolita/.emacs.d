(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
;;(setq company-idle-delay nil)
;;(global-set-key (kbd "<f1>") 'company-indent-or-complete-common)

(provide 'init-company)
