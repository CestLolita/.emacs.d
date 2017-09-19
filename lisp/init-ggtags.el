(require 'ggtags)

(add-hook 'c-mode-common-hook
  (lambda ()
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
      (ggtags-mode 1))))
(define-key ggtags-mode-map (kbd "<f8>") 'ggtags-find-tag-regexp)
(define-key ggtags-mode-map (kbd "M-j")  'ggtags-find-tag-dwim)
(define-key ggtags-mode-map (kbd "M-r")  'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "M-d")  'ggtags-find-definition)
(define-key ggtags-mode-map (kbd "M-b")  'ggtags-prev-mark)
(define-key ggtags-mode-map (kbd "M-f")  'ggtags-next-mark)

(provide 'init-ggtags)
