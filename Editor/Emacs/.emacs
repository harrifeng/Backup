;;=====Basic Setting, no plugins are needed=======;;
;;Self information
(setq user-mail-address "harrifeng@gmail.com")
(setq user-full-name    "harrifeng")

;;Remove Start-up Display
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;Remove scroll bar
(customize-set-variable 'scroll-bar-mode nil)

;;Remove tool bar
(tool-bar-mode -1)

;;No bell and flash
(setq ring-bell-function 'ignore)
(blink-cursor-mode -1)

;;When on one parentheses, move to the other one
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;use y and n instead of yes and no
(fset 'yes-or-no-p 'y-or-n-p)

;;use minibuffer recusively
(setq enable-recursive-minibuffers t)

;;Save the cursor's previous position
(require 'saveplace)
(setq-default save-place t)

;;Delete the CR and the end of the line when Ctrl+k at beginning
(setq-default kill-whole-line t)

;;Big king ring
(setq kill-ring-max 200)

;; show column number
(setq column-number-mode t)

;;80 is the column limit
(setq default-fill-column 80)
(setq-default auto-fill-function 'do-auto-fill) 

;;if kill content are the same, ignore them.
(setq kill-do-not-save-duplicates t)

;;Stop scroll-bar
(setq scroll-step 0 
      scroll-margin 0 
      scroll-conservatively 10000) 

;;Cmd is used for meta for MAC 
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;;=====Key Binding=======;;
(global-set-key "\C-w"          'backward-kill-word)
(global-set-key "\C-x\C-k"      'kill-region)
(global-set-key "\C-o"          'other-window)
(global-set-key [C-return]      'delete-other-windows)
(global-set-key [C-f11]         'toggle-tool-bar-mode-from-frame)
(global-set-key [(meta ?/)]     'hippie-expand)
(global-set-key "\C-x\C-m"      'execute-extended-command)
(global-set-key "\C-c\C-m"      'execute-extended-command)

;;Same behavior with BASH
(global-set-key "\C-h"          'backward-delete-char-untabify) 
(defun backward-kill-line (arg) (interactive "p") (kill-line 0) ) 
;; if you have to use Ctrl+U, you have to use ESC instead 
(global-set-key (kbd "C-u") 'backward-kill-line) 

;;ctrl space is for sogou input method
(global-set-key [(control space)] nil)
(global-set-key [(control \,)] 'set-mark-command)

;;mac also use this mapping
(define-key global-map (kbd "C-,") 'set-mark-command)

;;set transparent and use f4 to control it
(global-set-key [(f4)] 'loop-alpha) 
(setq alpha-list '((100 100) (95 65) (70 55)))
(defun loop-alpha () 
  (interactive) 
  (let ((h (car alpha-list)))                ;; head value will set to 
    ((lambda (a ab) 
       (set-frame-parameter (selected-frame) 'alpha (list a ab)) 
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab))) 
       ) (car h) (car (cdr h))) 
    (setq alpha-list (cdr (append alpha-list (list h)))) 
    ) 
) 

;;Font-setting
(cond
  ((eq system-type 'darwin)
    (set-face-attribute 'default nil :height 150)
    ;; Use consolas for latin-3 charset.
    (set-fontset-font "fontset-default" 'iso-8859-3 "-apple-Monaco-medium-normal-normal-*-14-*-*-*-*-m-0-iso10646-1")
    ;; Chinese fontset.
    ;(set-fontset-font "fontset-default" 'unicode "-outline-微软雅黑-normal-normal-normal-sans-16-*-*-*-p-*-iso8859-1")
    (set-fontset-font "fontset-default" 'han "-apple-STSong-medium-normal-normal-*-16-*-*-*-*-p-0-iso10646-1"))

   ((eq system-type 'windows-nt) 
    (set-face-attribute
      'default nil :font "Consolas 11")
    ;; Chinese Font
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font)
                          charset
                          (font-spec :family "SimSun" :size 16)))))
    

;;=====Advanced part, need additional plugins=======;;
;;
(cond
  ((eq system-type 'darwin)
    (defconst my-emacs-path "/Users/fenghaoran18/github/Editor/Emacs/"))
  ((eq system-type 'windows-nt)
    (defconst my-emacs-path "c:/github/Editor/Emacs/")
    (setenv "HOME" my-emacs-path)))

;; change the home folder
(defconst my-emacs-lisps-path (concat my-emacs-path "mylisps/"))

;(setq load-path(cons(expand-file-name "c:/github/Editor/Emacs/mylisps")
;load-path))
(setq load-path(cons(expand-file-name my-emacs-lisps-path)
load-path))

;use only for emacs24
;(load-theme 'tango-dark)

;;Open Recent File History
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;Maximum Emacs when Open
(cond
   ((eq system-type 'windows-nt) 
    (run-with-idle-timer 1 nil 'w32-send-sys-command 61488))

  ((eq system-type 'darwin)
    (defun my-max-window()
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
    '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
    '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
    )
    (run-with-idle-timer 1 nil 'my-max-window)))

