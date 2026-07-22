;; ███████ ██    ██ ██ ██                                                  
;; ██      ██    ██ ██ ██                                                  
;; █████   ██    ██ ██ ██                                                  
;; ██       ██  ██  ██ ██                                                  
;; ███████   ████   ██ ███████                                                                                                   
                                                                        
;;  ██████  ██████  ██      ███████  ██████ ████████ ██  ██████  ███    ██ 
;; ██      ██    ██ ██      ██      ██         ██    ██ ██    ██ ████   ██ 
;; ██      ██    ██ ██      █████   ██         ██    ██ ██    ██ ██ ██  ██ 
;; ██      ██    ██ ██      ██      ██         ██    ██ ██    ██ ██  ██ ██ 
;;  ██████  ██████  ███████ ███████  ██████    ██    ██  ██████  ██   ████ 

(use-package evil
  :straight t
  :defer t
  :hook
  (after-init . evil-mode)
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-u-delete t
        evil-want-fine-undo t)
  :config
  (evil-set-undo-system 'undo-fu)

  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))

  ;; Search
  (evil-define-key 'normal 'global (kbd "<leader> s f") 'consult-find)
  (evil-define-key 'normal 'global (kbd "<leader> s g") 'consult-grep)
  (evil-define-key 'normal 'global (kbd "<leader> s G") 'consult-git-grep)
  (evil-define-key 'normal 'global (kbd "<leader> s r") 'consult-ripgrep)
  (evil-define-key 'normal 'global (kbd "<leader> s h") 'consult-info)
  (evil-define-key 'normal 'global (kbd "<leader> /") 'consult-line)

  ;; Flymake
  (evil-define-key 'normal 'global (kbd "<leader> x x") 'consult-flymake)
  (evil-define-key 'normal 'global (kbd "] d") 'flymake-goto-next-error)
  (evil-define-key 'normal 'global (kbd "[ d") 'flymake-goto-prev-error)

  ;; Files
  (evil-define-key 'normal 'global (kbd "<leader> x d") 'dired)
  (evil-define-key 'normal 'global (kbd "<leader> x j") 'dired-jump)
  (evil-define-key 'normal 'global (kbd "<leader> x f") 'find-file)

  ;; Diff-HL
  (evil-define-key 'normal 'global (kbd "] c") 'diff-hl-next-hunk)
  (evil-define-key 'normal 'global (kbd "[ c") 'diff-hl-previous-hunk)

  ;; File explorer
  (evil-define-key 'normal 'global (kbd "<leader> e") 'treemacs)
  (evil-define-key 'normal 'global (kbd "<leader> d") 'dired-jump)

  ;; Magit
  (evil-define-key 'normal 'global (kbd "<leader> g g") 'magit-status)
  (evil-define-key 'normal 'global (kbd "<leader> g l") 'magit-log-current)
  (evil-define-key 'normal 'global (kbd "<leader> g d") 'magit-diff-buffer-file)
  (evil-define-key 'normal 'global (kbd "<leader> g D") 'diff-hl-show-hunk)
  (evil-define-key 'normal 'global (kbd "<leader> g b") 'vc-annotate)

  ;; Buffers
  (evil-define-key 'normal 'global (kbd "] b") 'switch-to-next-buffer)
  (evil-define-key 'normal 'global (kbd "[ b") 'switch-to-prev-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b i") 'consult-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b b") 'ibuffer)
  (evil-define-key 'normal 'global (kbd "<leader> b d") 'kill-current-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b k") 'kill-current-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b x") 'kill-current-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b s") 'save-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> b l") 'consult-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> SPC") 'consult-buffer)

  ;; Project
  (evil-define-key 'normal 'global (kbd "<leader> p b") 'consult-project-buffer)
  (evil-define-key 'normal 'global (kbd "<leader> p p") 'project-switch-project)
  (evil-define-key 'normal 'global (kbd "<leader> p f") 'project-find-file)
  (evil-define-key 'normal 'global (kbd "<leader> p g") 'project-find-regexp)
  (evil-define-key 'normal 'global (kbd "<leader> p k") 'project-kill-buffers)
  (evil-define-key 'normal 'global (kbd "<leader> p D") 'project-dired)

  ;; Yank
  (evil-define-key 'normal 'global (kbd "P") 'consult-yank-from-kill-ring)
  (evil-define-key 'normal 'global (kbd "<leader> P") 'consult-yank-from-kill-ring)

  ;; Embark
  (evil-define-key 'normal 'global (kbd "<leader> .") 'embark-act)

  ;; Undo
  (evil-define-key 'normal 'global (kbd "<leader> u") 'vundo)

  ;; Help
  (evil-define-key 'normal 'global (kbd "<leader> h m") 'describe-mode)
  (evil-define-key 'normal 'global (kbd "<leader> h f") 'describe-function)
  (evil-define-key 'normal 'global (kbd "<leader> h v") 'describe-variable)
  (evil-define-key 'normal 'global (kbd "<leader> h k") 'describe-key)

  ;; Tabs
  (evil-define-key 'normal 'global (kbd "] t") 'tab-next)
  (evil-define-key 'normal 'global (kbd "[ t") 'tab-previous)

  ;; Jump to definition (fara LSP)
  (evil-define-key 'normal 'global (kbd "gd") 'dumb-jump-go)
  (evil-define-key 'normal 'global (kbd "gb") 'dumb-jump-back))

  ;; Prettier


(use-package evil-collection
    :after evil
    :straight t
    :config
    (evil-collection-init))

(use-package which-key
    :straight t
    :config
    (which-key-mode 1))

(use-package goto-chg
    :straight t
    :bind
    (("C-." . goto-last-change)
    ("C-," . goto-last-change-reverse)))

(use-package evil-anzu
    :straight t
    :after (evil)
    :config
    (global-anzu-mode 1))

(use-package evil-goggles
    :straight t
    :after (evil)
    :config
    (evil-goggles-mode 1))

(use-package evil-args
    :straight t
    :after (evil))

(use-package evil-easymotion
    :ensure t
    :after (evil)e@
    :config
    (evil-easymotion-mode 1))   

(use-package avy
    :straight t)

(use-package evil-embrace
    :straight t
    :after (evil))

(use-package embrace
    :straight t)

(use-package expand-region
    :straight t)

(use-package evil-surround
    :straight t
    :after (evil)
    :config
    (evil-surround-mode 1))

(use-package evil-escape
    :straight t
    :after (evil)
    :config
    (evil-escape-mode 1))

(use-package evil-exchange
    :straight t
    :after (evil))

(use-package evil-indent-plus
    :straight t
    :after (evil))

(use-package evil-lion
    :straight t
    :after (evil))

(use-package evil-nerd-commenter
    :straight t
    :after (evil))

(use-package evil-numbers
    :straight t
    :after (evil))

(use-package shift-number
    :straight t)

(use-package evil-snipe
    :straight t
    :after (evil)
    :config
    (evil-snipe-mode 1))

(use-package evil-textobj-anyblock
    :straight t
    :after (evil))

(use-package evil-traces
    :straight t
    :after (evil)
    :config
    (evil-traces-mode 1))

(use-package evil-visualstar
    :straight t
    :after (evil)
    :config
    (global-evil-visualstar-mode))

(use-package exato
    :straight t
    :after (evil))

(use-package evil-quick-diff
    :straight (evil-quick-diff :type git :host github :repo "rgrinberg/evil-quick-diff")
    :after (evil)
    :config
    (evil-quick-diff-install))

(use-package evil-vimish-fold
    :straight t
    :after(evil))

(use-package vimish-fold
    :straight t)

;; ███    ███  █████   ██████  ██ ████████ 
;; ████  ████ ██   ██ ██       ██    ██    
;; ██ ████ ██ ███████ ██   ███ ██    ██    
;; ██  ██  ██ ██   ██ ██    ██ ██    ██    
;; ██      ██ ██   ██  ██████  ██    ██    


(use-package magit
    :straight t
    :bind ("C-x g" . magit-status)
    :commands (magit-status magit-blame magit-log))

(use-package diff-hl
    :straight t
    :config
    (global-diff-hl-mode 1))

(use-package git-timemachine
    :straight t
    :after (transient)
    :commands (git-timemachine))

(use-package git-modes
    :straight t)

(use-package browse-at-remote
    :straight t)

(use-package orgit
    :straight t
    :after (org magit))

(provide 'my-magivel)
