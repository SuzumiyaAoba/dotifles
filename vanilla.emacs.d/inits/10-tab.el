;; (use-package elscreen
;;   :bind (("<C-tab>"         . elscreen-next)
;;          ("<C-iso-lefttab>" . elscreen-previous))
;;   :init
;;   (elscreen-start)
;;   :config
;;   (setq elscreen-tab-display-kill-screen nil)
;;   (setq elscreen-tab-display-control nil)
;;   ;; color
;;   (defun set-elscreen-tab-face ()
;;     (copy-face 'mode-line          'elscreen-tab-current-screen-face)
;;                   (copy-face 'mode-line-inactive 'elscreen-tab-background-face)
;;                   (copy-face 'mode-line-inactive 'elscreen-tab-control-face)
;;                   (copy-face 'mode-line-inactive 'elscreen-tab-other-screen-face))
;;   ;; for GUI
;;   (set-elscreen-tab-face)
;;   ;; for GUI with daemon
;;   (if (daemonp)
;;       (add-hook 'after-make-frame-functions
;;                 (lambda (frame)
;;                   (set-elscreen-tab-face)))))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package perspeen
  :init
  (setq perspeen-use-tab t)
  :config
  (perspeen-mode)
  (general-define-key
   :prefix "C-z"
   :keymaps 'perspeen-mode-map
   "c" 'perspeen-tab-create-tab
   "k" 'perspeen-tab-del
   "n" 'perspeen-tab-next
   "p" 'perspeen-tab-prev
   "w c" 'perspeen-create-ws
   "w n" 'perspeen-next-ws
   "w p" 'perspeen-prev-ws
   "w k" 'perspeen-del-ws))
