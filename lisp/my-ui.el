;;; --- my-ui.el -*- lexical-binding: t; -*-

;;  ██████  ████████ ██   ██ ███████ ██████      ██    ██ ██ 
;; ██    ██    ██    ██   ██ ██      ██   ██     ██    ██ ██ 
;; ██    ██    ██    ███████ █████   ██████      ██    ██ ██ 
;; ██    ██    ██    ██   ██ ██      ██   ██     ██    ██ ██ 
;;  ██████     ██    ██   ██ ███████ ██   ██      ██████  ██ 
                                                          
(use-package nerd-icons
    :straight t)

(use-package doom-themes
    :straight t
    :config
    (load-theme 'doom-one t))

(use-package solaire-mode
    :straight t
    :config
    (solaire-global-mode 1))

(use-package doom-modeline
    :straight t
    :hook (after-init . doom-modeline-mode))

(use-package shrink-path :straight t)
(use-package s :straight t)
(use-package f :straight t)

(use-package hl-todo
    :straight t
    :config
    (global-hl-todo-mode 1))

(use-package vi-tilde-fringe
    :straight t
    :config
    (global-vi-tilde-fringe-mode 1))

(use-package anzu
    :straight t
    :config
    (global-anzu-mode 1))

;; ██████   █████  ███████ ██   ██ ██████   ██████   █████  ██████  ██████  
;; ██   ██ ██   ██ ██      ██   ██ ██   ██ ██    ██ ██   ██ ██   ██ ██   ██ 
;; ██   ██ ███████ ███████ ███████ ██████  ██    ██ ███████ ██████  ██   ██ 
;; ██   ██ ██   ██      ██ ██   ██ ██   ██ ██    ██ ██   ██ ██   ██ ██   ██ 
;; ██████  ██   ██ ███████ ██   ██ ██████   ██████  ██   ██ ██   ██ ██████  
                                                                                                                                                
(setq dashboard-icon-type 'nerd-icons)
(setq dashboard-display-icons-p t)

(setq dashboard-heading-icon-alist
      '((recents   . (nerd-icons-mdicon "nf-md-history"))
        (bookmarks . (nerd-icons-mdicon "nf-md-bookmark"))
        (projects  . (nerd-icons-mdicon "nf-md-folder_text"))
        (agenda    . (nerd-icons-mdicon "nf-md-calendar"))
        (custom    . (nerd-icons-faicon "nf-fa-cog"))))

(use-package dashboard
  :ensure t
  :demand t
  :custom
  (dashboard-banner-logo-title "I N F E R N U M")
  (dashboard-startup-banner "/home/v/.config/emacs/lisp/Banners-ASCII/bcc2.txt")
  (dashboard-center-content t)
  (dashboard-show-shortcuts t)
  (dashboard-page-separator "\n\n")
  :config
  (dashboard-setup-startup-hook))

(use-package doom-dashboard
  :straight (doom-dashboard :host github
                             :repo "emacs-dashboard/doom-dashboard")
  :after dashboard
  :demand t
  :bind
  (:map dashboard-mode-map
        ("<remap> <dashboard-previous-line>" . widget-backward)
        ("<remap> <dashboard-next-line>" . widget-forward)
        ("<remap> <previous-line>" . widget-backward)
        ("<remap> <next-line>"  . widget-forward)
        ("<remap> <right-char>" . widget-forward)
        ("<remap> <left-char>"  . widget-backward))
  :custom
  (dashboard-startup-banner (concat doom-dashboard-banner-directory "bcc.txt"))
  (dashboard-footer-icon (nerd-icons-faicon "nf-fa-github_alt" :face 'success :height 1.5))
  (dashboard-page-separator "\n")
  (dashboard-startupify-list '(dashboard-insert-banner
                                dashboard-insert-banner-title
                                dashboard-insert-newline
                                dashboard-insert-items
                                dashboard-insert-newline
                                dashboard-insert-init-info
                                dashboard-insert-newline
                                doom-dashboard-insert-homepage-footer))
  (dashboard-item-generators
    '((find-file  . dashboard-insert-find-file)
      (recents    . doom-dashboard-insert-recents-shortmenu)
      (bookmarks  . doom-dashboard-insert-bookmark-shortmenu)
      (projects   . doom-dashboard-insert-project-shortmenu)
      (agenda     . doom-dashboard-insert-org-agenda-shortmenu)
      (scaff      . dashboard-scaffolding)
      (org-scaff  . dashboard-scaffolding-org)
      (quit       . dashboard-insert-quit)))

  (dashboard-items '((find-file . 1)
                      (recents  . 8)
                      (projects . 6)
                      (agenda   . 5)
                      (scaff    .  1)
                      (org-scaff . 1)
                      (bookmarks . 6)
                      (quit . 1))))

;; ───────────────── Costume Functions (Options) ──────────────────

(defun dashboard-insert-find-file (list-size)
  (when dashboard-display-icons-p
  (insert (string-pad (nerd-icons-octicon "nf-oct-file" :face 'dashboard-heading)3))) ;Icon format
  (widget-create 'item
                  :tag (format "%-30s" "Find file")
                  :action (lambda (&rest _) (call-interactively #'find-file))
                  :mouse-face 'highlight
                  :button-face 'dashboard-heading
                  :button-prefix ""
                  :button-suffix ""
                  :format "%[%t%]")
  (when doom-dashboard-set-widget-binding
  (insert (propertize (substitute-command-keys "\\[find-file]")
                         'face 'doom-dashboard-bindings-face))))

(defun dashboard-insert-quit (list-size)
(when dashboard-display-icons-p
  (insert (string-pad (nerd-icons-octicon "nf-oct-x_circle" :face 'dashboard-heading)3)))
  (widget-create 'item
                  :tag (format "%-30s" "Quit Emacs")
                  :action (lambda (&rest _) (call-interactively #'save-buffers-kill-terminal))
                  :mouse-face 'highlight
                  :button-face 'dashboard-heading
                  :button-prefix ""
                  :button-suffix ""
                  :format "%[%t%]")
  (when doom-dashboard-set-widget-binding
  (insert (propertize (substitute-command-keys "\\[save-buffers-kill-terminal]")
                      'face 'doom-dashboard-bindings-face))))

(defun dashboard-scaffolding (list-size)
(when dashboard-display-icons-p
  (insert (string-pad (nerd-icons-octicon "nf-oct-x_circle" :face 'dashboard-heading)3)))
  (widget-create 'item
                  :tag (format "%-30s" "Manage Directorys")
                  :action (lambda (&rest _) (call-interactively #'save-buffers-kill-terminal))
                  :mouse-face 'highlight
                  :button-face 'dashboard-heading
                  :button-prefix ""
                  :button-suffix ""
                  :format "%[%t%]")
  (when doom-dashboard-set-widget-binding
  (insert (propertize (substitute-command-keys "\\[scaffolding]")
                      'face 'doom-dashboard-bindings-face))))


(defun dashboard-scaffolding-org (list-size)
(when dashboard-display-icons-p
  (insert (string-pad (nerd-icons-octicon "nf-oct-x_circle" :face 'dashboard-heading)3)))
  (widget-create 'item
                  :tag (format "%-30s" "Manage Org Directorys")
                  :action (lambda (&rest _) (call-interactively #'save-buffers-kill-terminal))
                  :mouse-face 'highlight
                  :button-face 'dashboard-heading
                  :button-prefix ""
                  :button-suffix ""
                  :format "%[%t%]")
  (when doom-dashboard-set-widget-binding
  (insert (propertize (substitute-command-keys "\\[org-scaffolding]")
                      'face 'doom-dashboard-bindings-face))))


(defun dashboard-insert-manage-org (list-size)
(when dashboard-display-icons-p
  (insert (string-pad (nerd-icons-octicon "nf-oct-file" :face 'dashboard-heading)3))) ;Icon format
  (widget-create 'item
                  :tag (format "%-30s" "Manage Directory")
                  :action (lambda (&rest _) (call-interactively #'find-file))
                  :mouse-face 'highlight
                  :button-face 'dashboard-heading
                  :button-prefix ""
                  :button-suffix ""
                  :format "%[%t%]")
  (when doom-dashboard-set-widget-binding
  (insert (propertize (substitute-command-keys "\\[find-grep]")
                         'face 'doom-dashboard-bindings-face))))

(provide 'my-ui)
;;; my-ui.el ends here

