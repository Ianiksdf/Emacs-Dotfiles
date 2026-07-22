;;; --- my-dashboard.el -*- lexical-binding: t; -*-

;; ███████ ███    ███  █████   ██████ ███████                      
;; ██      ████  ████ ██   ██ ██      ██                           
;; █████   ██ ████ ██ ███████ ██      ███████                      
;; ██      ██  ██  ██ ██   ██ ██           ██                      
;; ███████ ██      ██ ██   ██  ██████ ███████                      
                                                                
;; ███████ ███████ ████████ ████████ ██ ███    ██  ██████  ███████ 
;; ██      ██         ██       ██    ██ ████   ██ ██       ██      
;; ███████ █████      ██       ██    ██ ██ ██  ██ ██   ███ ███████ 
;;      ██ ██         ██       ██    ██ ██  ██ ██ ██    ██      ██ 
;; ███████ ███████    ██       ██    ██ ██   ████  ██████  ███████ 
                                                                
;; ───────────────── Emacs Built-int settings ────────────────────
 
(setq persp-auto-resume-time -1)
(setq inhibit-startup-message t)
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))
(setq use-package-compute-statistics t)
(setq frame-inhibit-implied-resize t)

;; Emasc Default settings
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(display-battery-mode t)
(global-display-line-numbers-mode 'relative)

(add-hook 'vterm-mode-hook
          (lambda ()
            (set (make-local-variable 'buffer-face-mode-face)
                 '(:family "CaskaydiaCove Nerd Font Mono"))
            (buffer-face-mode t)))

(setq ring-bell-function 'ignore)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(column-number-mode 1)
(setq tab-always-indent nil)
(electric-indent-mode -1)

(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq c-basic-offset 8)

;; ─────────────────── My Keybinds ──────────────────

(global-set-key (kbd "C-x t n") #'tab-new)          
(global-set-key (kbd "C-x t k") #'tab-close)        
(global-set-key (kbd "C-x t o") #'tab-next)         
(global-set-key (kbd "C-x t p") #'tab-previous)     
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; ─────────────────── Base Options ──────────────────
;; Backup files (fișierele ~)
(setq backup-directory-alist
      '(("." . "~/.config/emacs/backups")))

(setq backup-by-copying t)

(use-package better-jumper
  :config
  (better-jumper-mode 1))

(use-package general
  :config
  (general-define-key
   "C-c f" 'find-file))
(use-package focus
  :straight t)

(use-package gcmh
  :config
  (gcmh-mode 1))

(use-package rainbow-mode
  :straight t
  :hook
  ((css-mode html-mode web-mode typescript-mode js-mode) . rainbow-mode))

(use-package rainbow-delimiters
  :straight t
  :after evil
  :hook ((org-mode . rainbow-delimiters-mode)
         (prog-mode . rainbow-delimiters-mode))
  :config
  (evil-define-key 'normal 'global (kbd "<leader> t d") 'rainbow-delimiters-mode))
 
(use-package marginalia
  :straight t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode 1))

(use-package vterm-toggle
  :straight t
  :after vterm
  :config
  (setq vterm-toggle-fullscreen-p nil
        vterm-toggle-scope 'project)
  

(add-to-list 'display-buffer-alist
               '((lambda (buf-name _) (string-match-p "vterm" buf-name))
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 (window-height . 0.3))))


;; ─────────────────── Other Stuff ──────────────────

(use-package quickrun
  :straight t
  :commands (quickrun quickrun-region quickrun-shell))

(use-package eros
    :straight t
    :config
    (eros-mode 1))

(use-package request
    :straight t)

(use-package link-hint
    :straight t)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

;; ─────────────────── Emacs Hooks ────────────────────────────────

(add-hook 'server-after-make-frame-hook
        (lambda ()
        "Hook then emacs is stared as client (dashbaord launches first instead of scratch)"
         (when (fboundp 'dashboard-open)
          (dashboard-open))))
(provide 'my-core)
;;; my-core.el ends here 





