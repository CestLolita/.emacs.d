(require 'yang-mode)

(autoload 'yang-mode "yang-mode" "Major mode for editing YANG modules." t)
(add-to-list 'auto-mode-alist '("\\.yang$" . yang-mode))
(setq blink-matching-paren-distance nil)
(defun show-onelevel ()
  "show entry and children in outline mode"
  (interactive)
  (show-entry)
  (show-children))
(defun my-outline-bindings ()
  "sets shortcut bindings for outline minor mode"
  (interactive)
  (local-set-key [M-up] 'outline-backward-same-level)
  (local-set-key [M-down] 'outline-forward-same-level)
  (local-set-key [M-left] 'hide-subtree)
  (local-set-key [M-right] 'show-subtree))
(add-hook
  'outline-minor-mode-hook
  'my-outline-bindings)
(defconst sort-of-yang-identifier-regexp "[-a-zA-Z0-9_\\.:]*")
(add-hook
  'yang-mode-hook
  '(lambda ()
    (outline-minor-mode)
    (setq outline-regexp
    (concat "^ *" sort-of-yang-identifier-regexp " *"
      sort-of-yang-identifier-regexp
      " *{"))))

(provide 'init-yang-mode)
