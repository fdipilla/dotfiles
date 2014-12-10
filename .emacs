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