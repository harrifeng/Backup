;;设置.emacs.d为加载路径
(setq load-path(cons(expand-file-name "~/.emacs.d")
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
(set-face-attribute
  'default nil :font "Consolas-12")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "SimSun" :size 16)))
;;设置颜色搭配
(require 'color-theme)
;(load-file "~/.emacs.d/color-theme-irblack.el")
;(color-theme-irblack)
;(load-file "~/.emacs.d/color-theme-tango-2.el")
;(color-theme-tango-2)
(load-file "~/.emacs.d/color-theme-gruber-darker.el")
(color-theme-gruber-darker)

;; For my language code setting UTF-8
(setq current-language-environment "UTF-8")
(setq default-input-method "chinese-py")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;使用习惯配制
(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no
(setq default-fill-column 80);默认显示 xx列就换行
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
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(load "desktop") 
(desktop-load-default) 
(desktop-read)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;transparent
(set-frame-parameter (selected-frame) 'alpha (list 85 50))
(add-to-list 'default-frame-alist (cons 'alpha (list 85 50)))


;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;org-mode
(setq org-export-with-sub-superscripts nil) 

