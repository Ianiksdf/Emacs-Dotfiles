;;; --- my-coding.el -*- lexical-binding: t; -*-

;; ██      ██ ███████ ██████  
;; ██      ██ ██      ██   ██ 
;; ██      ██ ███████ ██████  
;; ██      ██      ██ ██      
;; ███████ ██ ███████ ██    

(use-package lsp-mode
    :straight t)

(use-package helpful
    :straight t
    :bind
    (("C-h f" . helpful-callable)
     ("C-h v" . helpful-variable)
     ("C-h k" . helpful-key)))

(use-package vterm
  :ensure t)

(use-package elisp-refs
    :straight t)

(use-package macrostep
    :straight t)

(use-package overseer
  :straight t
  :commands (overseer-test overseer-test-run-all))

(use-package elisp-def
    :straight t)

(use-package elisp-demos
    :straight t
    :after helpful
    :config
    (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

(use-package let-completion
    :straight t)

(use-package highlight-quoted
    :straight t
    :config
    (add-hook 'emacs-lisp-mode-hook 'highlight-quoted-mode))

(use-package buttercup
    :straight t)


;; ███    ███  █████  ██████  ██   ██ ██████   ██████  ██     ██ ███    ██ 
;; ████  ████ ██   ██ ██   ██ ██  ██  ██   ██ ██    ██ ██     ██ ████   ██ 
;; ██ ████ ██ ███████ ██████  █████   ██   ██ ██    ██ ██  █  ██ ██ ██  ██ 
;; ██  ██  ██ ██   ██ ██   ██ ██  ██  ██   ██ ██    ██ ██ ███ ██ ██  ██ ██ 
;; ██      ██ ██   ██ ██   ██ ██   ██ ██████   ██████   ███ ███  ██   ████ 
                                                                                                                           
(use-package markdown-mode
    :straight t)

(use-package markdown-toc
    :straight t
    :after markdown-mode)

(use-package edit-indirect
    :straight t)

(use-package evil-markdown
    :straight (:host github 
               :repo "Somelauw/evil-markdown")
    :after (evil markdown-mode))

;;  ██████ ██   ██ ███████  ██████ ██   ██ ███████ ██████  
;; ██      ██   ██ ██      ██      ██  ██  ██      ██   ██ 
;; ██      ███████ █████   ██      █████   █████   ██████  
;; ██      ██   ██ ██      ██      ██  ██  ██      ██   ██ 
;;  ██████ ██   ██ ███████  ██████ ██   ██ ███████ ██   ██ 
                                                                                                   
(use-package flycheck
    :straight t
    :config
    (global-flycheck-mode 1))

(use-package flycheck-popup-tip
    :straight t
    :after flycheck
    :config
    (add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))

(use-package consult-flycheck
    :straight t
    :after (consult flycheck))

(use-package flycheck-package
  :straight t
  :hook (emacs-lisp-mode . flycheck-package-setup))
  
(provide 'my-coding)
