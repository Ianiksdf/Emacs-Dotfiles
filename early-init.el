;;; early-init.el -*- lexical-binding: t -*-

(setq auto-save-list-file-prefix "~/.cache/emacs/auto-save-list/.saves-")
(startup-redirect-eln-cache "~/.cache/emacs/eln-cache/")
(setq auto-save-default nil)   

(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024))
(setq package-enable-at-startup nil)
(setq auto-mode-case-fold nil)
(setq ad-redefinition-action 'accept)
(setq load-prefer-newer nil)
(setq frame-inhibit-implied-resize t)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message user-login-name)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(horizontal-scroll-bars) default-frame-alist)

(defvar my/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 80 1024 1024)
                  gc-cons-percentage 0.2
                  file-name-handler-alist my/file-name-handler-alist)
            (message "Emacs ready in %s with %d GCs."
                     (emacs-init-time) gcs-done)))
