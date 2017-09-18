(require 'counsel-gtags)

(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)

(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "C-j") 'counsel-gtags-dwim)
  (define-key counsel-gtags-mode-map (kbd "<f8>") 'counsel-gtags-find-definition))

(provide 'init-counsel-gtags)
