;;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(custom-safe-themes
 ;;   (quote
 ;;    ("3f44e2d33b9deb2da947523e2169031d3707eec0426e78c7b8a646ef773a2077" default)))
 '(package-selected-packages
   (quote
    (zenburn-theme fill-column-indicator flx string-inflection yasnippet-snippets yasnippet evil-magit 4clojure counsel-projectile counsel helm melpa-upstream-visit projectile magit company tide)))
 '(show-paren-mode t))

;;; Package
(require 'package)
(add-to-list
'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

;;; Basic Visuals - Set Theme and Disable Bars
(load-theme 'zenburn t)

(menu-bar-mode -1)
(tool-bar-mode -1)

;;; Global Keybindings
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-x g") 'magit-status)

;; Tab Completion
(setq tab-always-indent 'complete)

;; Indentation
(setq-default indent-tabs-mode nil)

;; Wrapping and Filling
; (setq fill-column 80)
(require 'fill-column-indicator)
(fci-mode 1)
 

;;; Tide (It's an ad ;) )
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`x
  (company-mode +1))

(setq company-tooltip-align-annotations t) ;; aligns annotation to the right
                                           ;; hand side

(add-hook 'typescript-mode-hook #'setup-tide-mode)


;;; Projectile
(projectile-mode 1)
(counsel-projectile-mode 1)

;;; Completion
(ivy-mode 1) ; Use ivy for completion
(counsel-mode 1) ; Use ivy aware versions common commands
(setq ivy-use-virtual-buffers t) ; Include recent files in buffer
                                 ; switch
(setq ivy-re-builders-alist  
      '((t . ivy--regex-fuzzy)))

(setq ivy-initial-inputs-alist nil)   ; Fuzzy 
(require 'flx)                        ; Load flx to sort fuzzy matches
(setq enable-recursive-minibuffers t)



(define-key ivy-minibuffer-map " " '(lambda () (interactive) (insert "-")))
(define-key counsel-find-file-map " " 'self-insert-command)

;;; Wrap ISearch
(defadvice isearch-repeat (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-repeat 'after 'isearch-no-fail)
    (ad-activate 'isearch-repeat)))

;;; Html
(add-hook
 'sgml-mode-hook
 (lambda ()
   ;; Default indentation to 2, but let SGML mode guess, too.
   (set (make-local-variable 'sgml-basic-offset) 2)
   (sgml-guess-indent)))


;;; Magit
;; Can I get magit to watch the directory?

;;; YASnippet
(require 'yasnippet)
(yas-global-mode)



(defun px-actions-prefix-from-file-name (file-name)
  (capitalize
   (replace-regexp-in-string
    "[_-]" " "
    (file-name-sans-extension           ; Remove the .actions part of the filename
     (file-name-base file-name)))))

(defun upcase-with-underscores (string)
  (replace-regexp-in-string "[ -]" "_" (upcase string)))

(defun upper-camel-case (string)
  (replace-regexp-in-string "[ _-]" "" (upcase-initials string)))


;; TODOS
;; Use org mode for .emacs?
;; Use git for .emacs
;; Try C-M-i in .ts file with tide
;; Use org mode for taking notes - scratch notes unsaved don't prevent closing emacs!
;; Back and forward like in vs code
;; Fill column of 80, except in my project it is 140
;; Directory with nice fonts
;; mode line improvements (the line noise at the beginning is gross)
;; adsf

;; Learn and use projectile mode
;; Learn and use magit
;; Ctrl-Backspace with lots of whitespace should delete just whitespace
;;
;; Use highlight changes mode, customize the faces so that you have
;; background not foreground colors, and automatically rotate faces on
;; save hook.
;; Can I have highlight changes only highlight the fringe?
;; Highlight changes next and previous changes need keybidings
;; First, I'm going to do a dark theme



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-minibuffer-match-face-1 ((t (:background "#2B2B2B")))))
