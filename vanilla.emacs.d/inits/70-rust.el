(use-package rustic
  :mode ("\\.rs$" . rustic-mode)
  :commands (rustic-mode)
  :init
  (add-hook 'rustic-mode-hook
            '(lambda ()
               (racer-mode t))))

(use-package racer)

(use-package lsp-mode)
