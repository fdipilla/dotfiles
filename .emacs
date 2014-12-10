;;; Muestra el numero de linea y columna
(line-number-mode 1)
(column-number-mode 1)

;;; Resalta los corchetes, parentesis y llaves
(show-paren-mode 1)

;;; Cambia el beep de alerta por una alerta visual
(setq visible-bell t)

;;; Con M-i hago un duplicar linea
(global-set-key "\M-i" "\C-a\C- \C-n\M-w\C-y")

;;; Con M-p hago un printf de C
(global-set-key "\M-p" "printf(\"\\n%s\",);") 

;;; Imprimo la hora y los minutos en formato [HH:MM]
(global-set-key "\C-c\h" "\[\C-u\M-! date +\"%H:%M\"\]")


;;; Imprimo la apertura de una caja
(global-set-key (kbd "<f5>") "|---┐")

;;; Imprimo el cierre de una caja
(global-set-key (kbd "<f6>") "|---┘")

;;; Imprimo espacios en vez de tabs
(setq-default indent-tabs-mode nil)

;;; Seteo el identado a 4 espacios
(setq-default c-basic-offset 4)

;;; Seteo el identado en 4 para HTML                                                                                  (add-hook 'html-mode-hook
    (lambda ()
        (set (make-local-variable 'sgml-basic-offset) 4)))


;;; Configuraciones de org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-include-diary t)
(setq org-agenda-files (quote ("/usr/share/calendar/calendar.*")))


(setq org-agenda-files (list "~/horas" "~/todo-git.org"))


(setq org-todo-keywords
      '((sequence "TODO"
                  "ALTA"
                  "MEDIA"
                  "BAJA"
                  "DONE"
                  )))

(setq org-todo-keyword-faces
      '(
        ("ALTA" :background "red" :foreground "white" )
        ("MEDIA" :background "yellow" :foreground "white" )
        ("BAJA" :background "green" :foreground "white" )
        ))



;; que se incluya mi diary
(setq org-agenda-include-diary t)


;; Uso Shift y las flechas para moverme en los panes
(windmove-default-keybindings)