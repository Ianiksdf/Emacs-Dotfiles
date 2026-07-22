;; ██████  ██████   ██████  ██████  ██    ██  ██████ ████████ ██ ██    ██ ██ ████████ ██    ██ 
;; ██   ██ ██   ██ ██    ██ ██   ██ ██    ██ ██         ██    ██ ██    ██ ██    ██     ██  ██  
;; ██████  ██████  ██    ██ ██   ██ ██    ██ ██         ██    ██ ██    ██ ██    ██      ████   
;; ██      ██   ██ ██    ██ ██   ██ ██    ██ ██         ██    ██  ██  ██  ██    ██       ██    
;; ██      ██   ██  ██████  ██████   ██████   ██████    ██    ██   ████   ██    ██       ██    
                                                                                                                                                        ;; ────────────────── Packages ──────────────────

(use-package smartparens
    :straight t
    :config
    (smartparens-global-mode 1))

(use-package dash 
    :straight t)

(use-package dtrt-indent
    :straight t
    :config
    (dtrt-indent-global-mode 1))

(use-package ws-butler
    :straight t
    :config
    (ws-butler-global-mode 1))

(use-package undo-fu
    :straight t)

(use-package undo-fu-session
    :straight t
    :config
    (undo-fu-session-global-mode 1))

(use-package vundo
    :straight t)

(use-package treemacs-nerd-icons
    :straight t
    :config (treemacs-load-theme "nerd-icons"))

(use-package treemacs
  :straight t
  :defer t
  :config
  (setq treemacs-persist-file nil)
  (setq treemacs-width 30)
  (setq treemacs-is-never-other-window t)

  (setq treemacs-show-hidden-files t)
  (treemacs-follow-mode nil)
  (treemacs-project-follow-mode nil)
  (treemacs-filewatch-mode 1)

  (global-set-key (kbd "C-c t") #'treemacs)
  (global-set-key (kbd "C-c T") #'treemacs-add-and-display-current-project))

(use-package treemacs-evil
  :straight t
  :after (treemacs evil))

(use-package treemacs-projectile
  :straight t
  :after (treemacs projectile))

(use-package diredfl
    :straight t
    :config
    (diredfl-global-mode 1)
  :custom
  (dired-listing-switches "-agho --group-directories-first --time-style=long-iso")
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'top)
  (delete-by-moving-to-trash t)
  :config
  (put 'dired-find-alternate-file 'disabled nil))   

(use-package persp-mode
  :straight t
  :hook (after-init . persp-mode))

(use-package projectile
  :straight t
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-project-search-path nil)  
  (setq projectile-auto-discover nil)  
  :hook (after-init . projectile-mode))

;;  ██████  ██████   ██████      ███    ███  ██████  ██████  ███████ 
;; ██    ██ ██   ██ ██           ████  ████ ██    ██ ██   ██ ██      
;; ██    ██ ██████  ██   ███     ██ ████ ██ ██    ██ ██   ██ █████   
;; ██    ██ ██   ██ ██    ██     ██  ██  ██ ██    ██ ██   ██ ██      
;;  ██████  ██   ██  ██████      ██      ██  ██████  ██████  ███████ 

;; ────────────────── Packages and configurations ──────────────────



(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :hook (org-mode . org-indent-mode)
  :config


  (setq org-directory "~/org/")
  (setq org-default-notes-file (expand-file-name "notes.org" org-directory))
  (setq org-agenda-files '("~/org/agenda.org"))
  (require 'org-tempo)

  (setq org-startup-folded nil
        org-hide-emphasis-markers t
        org-ellipsis " ▼"
        org-pretty-entities t)


  (setq org-src-tab-acts-natively t
        org-src-preserve-indentation t
        org-src-fontify-natively t
        org-edit-src-content-indentation 0
        org-confirm-babel-evaluate nil
        org-return-follows-link t
        org-log-done 'time)

  (setq org-log-done 'time)
  (setq org-journal-dir "~/org/journal/"
        org-journal-date-format "%B %d, %Y (%A)"
        org-journal-file-format "%Y-%m-%d.org"))

(use-package org-modern
  :ensure t
  :hook
  (org-mode . org-modern-mode)
  :config
  (setq org-modern-star '("◉" "○" "✸" "✿"))  ; bullets frumoase
  (setq org-modern-list '((?- . "•") (?+ . "◦") (?* . "◆")))
  (setq org-modern-table nil)
  (setq org-modern-list '((?+ . "◦") (?- . "–") (?* . "•")))
  (setq org-modern-checkbox '((?X . "☑") (?- . "☐") (?\s . "☐"))))

(use-package org-contrib
    :straight t
    :after org)

(use-package focus
  :straight t
  :hook (org-mode . focus-mode)) ; Îl pornește automat în Org-mode

(use-package evil-org
    :straight t
    :after (evil-org)
    :config
    (add-hook 'org-mode-hook 'evil-org-mode))

(use-package ob-async
    :straight t
    :after org)

(use-package htmlize
    :straight t)

(use-package ox-clip
    :straight t
    :after org)

(use-package toc-org
  :straight t
  :hook (org-mode . toc-org-enable))

 
(use-package org-cliplink
    :straight t
    :after org)

(provide 'my-productivity)
