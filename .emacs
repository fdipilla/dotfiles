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
      ("ALTA" :background "#1e1c1c" :foreground "red" :weight bold)
      ("MEDIA" :background "#1e1c1c" :foreground "yellow" :weight bold)
      ("BAJA" :background "#1e1c1c" :foreground "green" :weight bold)))



;; que se incluya mi diary
(setq org-agenda-include-diary t)


;; Uso Shift y las flechas para moverme en los panes
(windmove-default-keybindings)

;; Log diario
(defun fabri-buen-dia()
  (interactive)
  (insert  (concat "* " (format-time-string "%d, %b, %Y")
                    "\n"
                    "** Llego"
                    "\n"
                    (concat "   <" (format-time-string "%Y-%m-%d %a %H:%M") ">"))))

(global-set-key (kbd "C-c b") 'fabri-buen-dia)


(defun fabri-previous-window()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-c o") 'fabri-previous-window)

;; Para depurar PHP
(setq load-path (cons "~/geben-0.26" load-path))
(require 'geben)

(defun xdebug-break-clear()
  (interactive)
  (beginning-of-buffer)
  (delete-matching-lines "xdebug_break()" )
  (pop-global-mark))

(defun var-dump-clear()
  (interactive)
  (beginning-of-buffer)
  (delete-matching-lines "var_dump" )
  (pop-global-mark))

(defun clear-debug()
  (interactive)
  (var-dump-clear)
  (xdebug-break-clear))

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

;; para los archivos gpg
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

(setq load-path (cons "~/.emacs.d" load-path))
(require 'fill-column-indicator)

(setq fci-rule-column 80)
(setq fci-rule-character ?‸)
(setq fci-rule-color "red")

;; from https://gist.github.com/dbrady/846766
(defun camelcase-region (start end)
  "Changes region from snake_case to camelCase"
  (interactive "r")
  (save-restriction (narrow-to-region start end)
                    (goto-char (point-min))
                    (while (re-search-forward "_\\(.\\)" nil t)
                      (replace-match (upcase (match-string 1))))))

(require 'ido)
(ido-mode t)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(ido-mode 1)

(defun tirate-un-query(p1 p2)
  (interactive "r")
  (setq query (buffer-substring p1 p2))
  (switch-to-buffer-other-window "*SQL-testing-resultado*")
  (org-mode)
  (beginning-of-buffer)
  (insert (shell-command-to-string
           (concat "php ~/.emacs.d/sql_test.php \""
                   (replace-regexp-in-string "\"" "'" query) " \"")))
  (beginning-of-buffer)
  (org-table-align)
  (beginning-of-buffer)
  (newline)
  (newline)
  (beginning-of-buffer)
    (other-window -1))


(defun mi-sql-mode-custom ()
  (local-set-key (kbd "C-c C-c") 'tirate-un-query))

(add-hook 'sql-mode-hook 'mi-sql-mode-custom)


(global-hl-line-mode 1)
(set-face-background 'hl-line "#333333")


(defun procedure()
  (interactive)
  (insert "select definition from sys.sql_modules where definition like '%%'")
  (backward-char)
  (backward-char))


;; cambio el color de los paren match
(set-face-background 'show-paren-match "#73e2e5")

;; agrego fuzzy-find para archivos
(require 'fiplr) 

;; bindeo C-x y al fuzzy find
(global-set-key "\C-x\y" 'fiplr-find-file) 
