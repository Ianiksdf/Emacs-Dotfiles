;;; --- my-naviator.el -*- lexical-binding: t; -*-

;;  ██████  ██████  ███    ███ ██████  ██      ███████ ████████ ██ ████████ ██  ██████  ███    ██ 
;; ██      ██    ██ ████  ████ ██   ██ ██      ██         ██    ██    ██    ██ ██    ██ ████   ██ 
;; ██      ██    ██ ██ ████ ██ ██████  ██      █████      ██    ██    ██    ██ ██    ██ ██ ██  ██ 
;; ██      ██    ██ ██  ██  ██ ██      ██      ██         ██    ██    ██    ██ ██    ██ ██  ██ ██ 
;;  ██████  ██████  ██      ██ ██      ███████ ███████    ██    ██    ██    ██  ██████  ██   ████ 
                                                                                                                                                          
;; ────────────────── Search and Navigation ──────────────────

(use-package vertico
  :straight t
  :config
  (vertico-mode 1)
  (with-eval-after-load 'vertico
  (require 'vertico-directory)
  (define-key vertico-map (kbd "RET")  #'vertico-directory-enter)
  (define-key vertico-map (kbd "DEL")  #'vertico-directory-delete-char)
  (define-key vertico-map (kbd "C-w")  #'vertico-directory-delete-word)
  (define-key vertico-map (kbd "M-DEL") #'vertico-directory-delete-word)))



(use-package orderless
    :straight t
    :config
    (setq completion-styles '(orderless basic)))

(use-package marginalia
    :straight t
    :config
    (marginalia-mode 1))

(use-package consult
    :straight t)

(use-package embark-consult
    :straight t
    :demand t
    :after (embark consult)
    :hook
    (embark-collect-mode . consult-preview-at-point-mode))

(use-package embark
    :straight t)

(use-package wgrep
    :straight t)

(use-package dumb-jump
    :straight t
    :config
    (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))
    
;; ────────────────── Snippets ──────────────────

(use-package yasnippet
    :straight t
    :config
    (yas-global-mode 1))

(use-package yasnippet-capf
    :straight t
    :after yasnippet)

(use-package consult-yasnippet
    :straight t
    :after (consult yasnippet))

(use-package auto-yasnippet
    :straight t
    :after yasnippet)

(use-package doom-snippets
    :straight (:host github :repo "doomemacs/snippets")
    :after yasnippet)

;; ────────────────── LSP & Completion ──────────────────

(use-package corfu
    :straight t
    :custom
    (corfu-auto t)                
    (corfu-auto-delay 0.1)         
    (corfu-auto-prefix 1)          
    (corfu-cycle t)                
    (corfu-preselect 'prompt) 
    :config
    (global-corfu-mode 1))

(use-package cape
    :straight t)

(use-package bash-completion
    :straight t
    :config
    (bash-completion-setup))    

(use-package eglot
    :straight nil
    :config
    (add-hook 'c-mode-hook 'eglot-ensure)
    (add-hook 'c++-mode-hook 'eglot-ensure)
    (add-hook 'c-or-c++-mode-hook 'eglot-ensure)
    (add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))) ;treat c headers as cpp
    
(use-package perspective
  :straight t
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :init
  (persp-mode))

(use-package consult-dir
    :straight t)

 
(provide 'my-navigator)
;;; my-naviator.el ends here
