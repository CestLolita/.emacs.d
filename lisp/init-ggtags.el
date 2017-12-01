(require 'ggtags)

(add-hook 'c-mode-common-hook
  (lambda ()
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
      (ggtags-mode 1))))

(add-hook 'python-mode-hook (lambda () (ggtags-mode 1)))
(add-hook 'ruby-mode-hook (lambda () (ggtags-mode 1)))

(define-key ggtags-mode-map (kbd "<f8>") 'ggtags-find-tag-regexp)
(define-key ggtags-mode-map (kbd "M-j")  'ggtags-find-definition)
(define-key ggtags-mode-map (kbd "M-r")  'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-b")  'ggtags-prev-mark)
(define-key ggtags-mode-map (kbd "C-f")  'ggtags-next-mark)

(defun my-ggtags-hook ()
  (define-key ggtags-mode-map "\M-." nil))
(add-hook 'ggtags-mode-hook 'my-ggtags-hook)

(provide 'init-ggtags)
