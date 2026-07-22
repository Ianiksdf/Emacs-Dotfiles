;;; --- my-funcs.el -*- lexical-binding: t; -*-

(defun scaffolding ()
  "Acces specific directorys"
  (interactive)
  (let ((consult-dir-sources
         (list
          '(:name "📁 Learning"
            :category file
            :face consult-file
            :items (("Learncpp.com"           . "~/Learning/Lcdcom")
                    ("SQL Stuff"        . "~/Learning/Sql")))

          '(:name "⚙️ Configurari"
            :category file
            :face consult-file
            :items (("Emacs Config"     . "~/.config/emacs")
                    ("Neovim"           . "~/.config/nvim")
                    ("Bash Scripts"     . "~/.bashrc.d"))
                    

))))
    (consult-dir)))


(defun org-scaffolding ()
  "Acces specific org directorys"
  (interactive)
  (let ((consult-dir-sources
         (list
          '(:name "📁 Games"
            :category file
            :face consult-file
            :items (("Lcdcom"           . "~/Learning/Lcdcom")
                    ("SQL Stuff"        . "~/Learning/Sql")))

          '(:name "⚙️ Configurari"
            :category file
            :face consult-file
            :items (("Emacs Config"     . "~/.config/emacs")
                    ("Neovim"           . "~/.config/nvim")
                    ("Bash Scripts"     . "~/.bashrc.d"))
                    
    
))))
    (consult-dir)))

(defun change-scaffolding ()
"Changes saved herarhic directorys"
(interactive)
(find-file "~/.config/emacs/lisp/my-funcs.el"))
(provide 'my-funcs)

;;; my-funcs.el ends here 
