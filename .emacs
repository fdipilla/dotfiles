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

;;; Un error_log de php
(global-set-key "\C-x\p" "error_log(var_export(true));\M-b,\C-b")

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

;;; Seteo el identado en 4 para HTML
(add-hook 'html-mode-hook
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

;; Log diario
(defun fabri-buen-dia()
  (interactive)  
  (insert  (concat "* " (format-time-string "%d, %b, %Y")
                    "\n"
                    "** Detalle Horas" 
                    "\n"
                    (concat "   <" (format-time-string "%Y-%m-%d %a %H:%M") "> - Llego"))))

(global-set-key (kbd "C-c b") 'fabri-buen-dia)


(defun fabri-previous-window()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-c o") 'fabri-previous-window)

;; Para depurar PHP
(setq load-path (cons "~/geben-0.26" load-path))
(require 'geben)

;; Cargo mi theme
(load-theme 'tangotango)


;; Exportar a evernote
(defun fabri-exportar-a-evernote()
  (interactive)
  (setq archivo (replace-regexp-in-string "org" "html" (buffer-name)))
  (org-table-export (concat "~/evernote/" archivo) "orgtbl-to-html")
  (shell-command (concat "php -f ~/evernote/exportar.php -- " archivo " &")))

;; xdebug break
(global-set-key "\C-x\X" "xdebug_break();")

;; tabla semanal
(global-set-key "\C-c\T" "| Nombre | Fecha Inicio | Fecha Fin | Estado | Descripcion | Enlace |")

(defun lenny()
  (interactive)
  (insert "( ͡° ͜ʖ ͡°) "))

(defun kirbi()
 (interactive)
 (insert "(つ -‘ _ ‘- )つ"))
