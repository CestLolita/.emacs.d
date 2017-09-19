(require 'imenu-list)


(global-set-key (kbd "S-<f7>") 'imenu-list-smart-toggle)
;;(global-set-key (kbd "S-'") #'imenu-list-smart-toggle)
(setq imenu-list-focus-after-activation t)
(setq imenu-list-auto-resize t)



(provide 'init-imenu-list)
