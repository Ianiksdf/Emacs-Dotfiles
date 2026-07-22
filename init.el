; _______   _____ ______   ________  ________  ________           ________  ________  ________  _______      
;|\  ___ \ |\   _ \  _   \|\   __  \|\   ____\|\   ____\         |\   ____\|\   __  \|\   __  \|\  ___ \     
;\ \   __/|\ \  \\\__\ \  \ \  \|\  \ \  \___|\ \  \___|_        \ \  \___|\ \  \|\  \ \  \|\  \ \   __/|    
; \ \  \_|/_\ \  \\|__| \  \ \   __  \ \  \    \ \_____  \        \ \  \    \ \  \\\  \ \   _  _\ \  \_|/__  
;  \ \  \_|\ \ \  \    \ \  \ \  \ \  \ \  \____\|____|\  \        \ \  \____\ \  \\\  \ \  \\  \\ \  \_|\ \ 
;   \ \_______\ \__\    \ \__\ \__\ \__\ \_______\____\_\  \        \ \_______\ \_______\ \__\\ _\\ \_______\
;    \|_______|\|__|     \|__|\|__|\|__|\|_______|\_________\        \|_______|\|_______|\|__|\|__|\|_______|
;                                                \|_________|                                                
 
;   _____ __             _       __    __     ____      _ __  _       ___             __  _
;  / ___// /__________ _(_)___ _/ /_  / /_   /  _/___  (_) /_(_)___ _/ (_)___  ____ _/ /_(_)___  ____
;  \__ \/ __/ ___/ __ `/ / __ `/ __ \/ __/   / // __ \/ / __/ / __ `/ / /_  / / __ `/ __/ / __ \/ __ \
; ___/ / /_/ /  / /_/ / / /_/ / / / / /_   _/ // / / / / /_/ / /_/ / / / / /_/ /_/ / /_/ / /_/ / / / /
;/____/\__/_/   \__,_/_/\__, /_/ /_/\__/  /___/_/ /_/_/\__/_/\__,_/_/_/ /___/\__,_/\__/_/\____/_/ /_/
;                   /____/




(push '(fullscreen . maximized) default-frame-alist)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(setq use-package-always-ensure t)

(use-package straight
  :custom
  ;; add project and flymake to the pseudo-packages variable so straight.el doesn't download a separate version than what eglot downloads.
  (straight-built-in-pseudo-packages '(emacs nadvice python image-mode project flymake))
  (straight-use-package-by-default t))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'my-coding)
(require 'my-core)
(require 'my-magivel)
(require 'my-productivity)
(require 'my-ui)
(require 'my-navigator)
(require 'my-funcs)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/home/v/.config/emacs/bookmarks"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
