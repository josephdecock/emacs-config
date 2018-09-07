;; This will get auto inserted by package, but we actually want to do it in emacs.org.
;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (use-package ivy-yasnippet zenburn-theme fill-column-indicator flx string-inflection yasnippet-snippets yasnippet evil-magit 4clojure counsel-projectile counsel helm melpa-upstream-visit projectile magit company tide)))
 '(show-paren-mode t))

(load-file (concat user-emacs-directory "emacs.el"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
