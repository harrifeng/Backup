;; 个人信息
;(setq user-mail-address "haoran.feng@ni.com")
;(setq user-full-name    "Haoran Feng")
(setq user-mail-address "fenghaoran18@gmail.com")
(setq user-full-name    "harrifeng")

;; 在fringe上显示一个小箭头指示当前buffer的边界
;(setq-default indicate-buffer-boundaries 'left)

;; 用一个很大的kill ring. 这样防止我不小心删掉重要的东西
(setq kill-ring-max 200)

;;默认显示 xx列就换行,并打开自动换行
(setq default-fill-column 80)
(setq-default auto-fill-function 'do-auto-fill) 

;; 尽快显示按键序列
(setq echo-keystrokes 0.1)

(setq system-time-locale "C")

;; 不要滚动条
(customize-set-variable 'scroll-bar-mode nil)

;去掉工具栏
(tool-bar-mode -1)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)

;; 显示列号
(setq column-number-mode t)

;; emacs lock
(autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)

;; 启用以下功能
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; 不显示Emacs的开始画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; 不要总是没完没了的问yes or no, 为什么不能用y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 不要闪烁光标, 烦不烦啊
(blink-cursor-mode -1)

;; 防止页面滚动时跳动,scroll-margin 3可以在靠近屏幕边沿3行时就开始滚动,
;; 可以很好的看到上下文
;; 我其实就不想让他们抖,所以停止了这个feature
;(setq scroll-margin 0
      ;scroll-conservatively 10000)
(setq scroll-step 0 
      scroll-margin 0 
      scroll-conservatively 10000) 

;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)

;; 当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,
;; 此时加密显出你的密码
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; 可以保存你上次光标所在的位置
(require 'saveplace)
(setq-default save-place t)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;括号匹配时显示另外一边的括号，而不是跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 不保存连续的重复的kill
(setq kill-do-not-save-duplicates t)

;; 先格式化再补全
(setq tab-always-indent 'complete)

;; 在行首C-k时，同时删除该行
(setq-default kill-whole-line t)

;; common key binding 
(global-set-key "\C-w"          'backward-kill-word)
(global-set-key "\C-x\C-k"      'kill-region)
(global-set-key (kbd "C-x k")   'kill-region)

(global-set-key "\C-o"          'other-window)
(global-set-key [C-return]      'delete-other-windows)
(global-set-key (kbd"C-$")      'delete-window)
(global-set-key (kbd"C-#")      'split-window-horizontally)
;(global-set-key (kbd"C-@")      'split-window)
(global-set-key (kbd"C-!")      'delete-other-windows)

(global-set-key "\C-x\C-m"      'execute-extended-command)
(global-set-key "\C-c\C-m"      'execute-extended-command)
(global-set-key [C-f11]         'toggle-tool-bar-mode-from-frame)
(global-set-key [(meta ?/)]     'hippie-expand)
(global-set-key "\C-h"          'backward-delete-char-untabify) 
(global-set-key "\C-c\C-h"      'describe-key)


(defun backward-kill-line (arg) (interactive "p") (kill-line 0) ) 
; 组合键定义1：缺点是你要用C-u输入前置参数时，只能用 ESC 然后输入前置参数的方式了 
(global-set-key (kbd "C-u") 'backward-kill-line) 

;(load-file (concat my-emacs-lisps-path "themes/color-theme-molokai.el"))
;(color-theme-molokai)

(global-set-key [(control space)] nil)
(global-set-key [(control \,)] 'set-mark-command)

;;mac also use this mapping
(define-key global-map (kbd "C-,") 'set-mark-command)

;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

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

(require 'yasnippet)
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
(yas/global-mode 1)

;; if two snippet are collid
(setq yas/prompt-functions '(yas/dropdown-prompt yas/x-prompt))

(provide 'misc-settings)
