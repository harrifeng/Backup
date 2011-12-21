;;设置.emacs.d为加载路径 Set .emacs.d as load directory
(setq load-path(cons(expand-file-name "~/.emacs.d")
load-path))

;;org-mode
(setq org-export-with-sub-superscripts nil) 

;(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no
(setq default-fill-column 80);默认显示 xx列就换行
;(setq-default make-backup-files nil);不要生成临时文件
;(setq-default make-backup-files nil);不要生成临时文件

;; TAB & space;; 缩进
(setq default-tab-width 4);;    设置tab为4个空格的宽度
(setq tab-width 4)
(setq-default indent-tabs-mode nil);; 输入tab就会自动转化为空格
(defun my-cc-mode()
  ;(c-toggle-auto-state)              ;自动换行
  ;(c-toggle-auto-hungry-state 1)
  (c-set-style "stroustrup"))
(add-hook 'c-mode-hook 'my-cc-mode)
(defun my-c++-mode()
  ;(c-toggle-auto-state)
  ;(c-toggle-auto-hungry-state 1)
  (c-set-style "stroustrup"))
(add-hook 'c++-mode-hook 'my-c++-mode)

(global-set-key [f1] 'org-edit-src-code)
(global-set-key [f2] 'org-edit-src-exit)
(global-set-key [A-return] 'org-meta-return)

(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)

;;transparent setting
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
 ;(set-frame-parameter (selected-frame) 'alpha '(100 80))
 ;(add-to-list 'default-frame-alist '(alpha 100 80))

;;set color scheme
(require 'color-theme)
(load-file "~/.emacs.d/color-theme-irblack.el")
(color-theme-irblack)
;(load-file "~/.emacs.d/color-theme-tango-2.el")
;(color-theme-tango-2)
;(load-file "~/.emacs.d/color-theme-gruber-darker.el")
;(color-theme-gruber-darker)

