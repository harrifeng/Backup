;;设置.emacs.d为加载路径
(setq load-path(cons(expand-file-name "~/.emacs.d")
load-path))
(setq load-path(cons(expand-file-name "/usr/local/share/emacs")
load-path))


(defun my-cc-mode()
  ;(c-toggle-auto-state)              ;自动换行
  ;(c-toggle-auto-hungry-state 1)
  (c-set-style "bsd"))
(add-hook 'c-mode-hook 'my-cc-mode)
(defun my-c++-mode()
  ;(c-toggle-auto-state)
  ;(c-toggle-auto-hungry-state 1)
  (c-set-style "stroustrup"))
(add-hook 'c++-mode-hook 'my-c++-mode)

;; Setting English Font
;(set-face-attribute
  ;'default nil :font "Monaco 17")
 
;;; Chinese Font
;(dolist (charset '(kana han symbol cjk-misc bopomofo))
    ;(set-fontset-font (frame-parameter nil 'font)
                      ;charset
                      ;(font-spec :family "Song" :size 12)))

(set-frame-font "Consolas-16")
(set-fontset-font "fontset-default" 'han '("STSong" . "unicode-bmp"))

;;设置颜色搭配
(require 'color-theme)
;(load-file "~/.emacs.d/color-theme-irblack.el")
;(color-theme-irblack)
;(load-file "~/.emacs.d/color-theme-tango-2.el")
;(color-theme-tango-2)
(load-file "~/.emacs.d/color-theme-gruber-darker.el")
(color-theme-gruber-darker)

(load-file "~/.emacs.d/graphviz-dot-mode.el")

;; For my language code setting UTF-8
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;使用习惯配制
(setq user-mail-address "fenghaoran18@gmail.com")
(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no
(setq default-fill-column 80);默认显示 xx列就换行
(setq-default auto-fill-function 'do-auto-fill) ; 打开自动换行
(column-number-mode t);显示列号
(show-paren-mode t);显示括号匹配
(setq show-paren-style 'parentheses);括号匹配时显示另外一边的括号，而不是跳到另一个括号
;(display-time-mode 1);显示时间，格式如下
;(setq display-time-24hr-format t)
;(setq display-time-day-and-date t)
(tool-bar-mode -1);去掉工具栏
(transient-mark-mode t);高亮显示要拷贝的区域
(setq frame-title-format "%b");在标题栏提示buffer名
(setq-default make-backup-files nil);不要生成临时文件
(setq visible-bell t);关闭烦人的出错时的提示声
(setq inhibit-startup-message t);关闭起动时的那个“开机画面”
(setq kill-ring-max 64);undo number

; set mark instead of ctr + space
(global-set-key [(control space)] nil)
(global-set-key [(control \,)] 'set-mark-command)

(global-set-key [f5] 'recentf-open-files); 最近打开的文件
(global-set-key [f6] 'recentf-open-more-files) ; 最近打开的文件(更多)
(global-set-key [f7]        'shell);F1进入Shell 

(global-set-key [C-f12]     'toggle-tool-bar-mode-from-frame)
(global-set-key [C-return]  'delete-window); C-return 关闭当前window
(global-set-key "\C-o"      'other-window);
(global-set-key "\C-x\C-m"  'execute-extended-command)
(global-set-key "\C-c\C-m"  'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; TAB & space;; 缩进
(setq default-tab-width 4);;    设置tab为4个空格的宽度
(setq tab-width 4)
(setq-default indent-tabs-mode nil);; 输入tab就会自动转化为空格

;; save before exit
;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)

(load "desktop") 
(desktop-load-default) 
(desktop-read)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;org-mode
(setq org-export-with-sub-superscripts nil) 

;(load-file "path/alpha-window.el") 
;; 
;; you can define your alpha-list to set the transform combine 
;; bind key with below code: 
;; 
(global-set-key [(f4)] 'loop-alpha) 
(setq alpha-list '((100 100) (95 65) (85 55))) 
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

;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;;绑定按键 
(global-set-key [(meta ?/)] 'hippie-expand)

(setq hippie-expand-try-functions-list 
'(try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name-partially
try-complete-file-name
try-expand-all-abbrevs
try-expand-list
try-expand-line
try-complete-lisp-symbol-partially
try-complete-lisp-symbol))


(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)


;; org-mode conflict with the yasnippet, use following to resolve
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

