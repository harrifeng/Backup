;;=============================================================================
;; Basic Setting, no plugins are need.
;;=============================================================================

(cond
 ((eq system-type 'windows-nt)
    (defconst my-emacs-path "c:/Editor/Emacs/")
    ;; change the home folder
    (setenv "HOME" my-emacs-path)

    (defconst my-emacs-bin (concat my-emacs-path "bin/"))
    ;; append emacs/bin to the emacs environment variable PATH
    ;; plink.exe can be stored in bin folder
    (setenv "PATH" (concat (getenv "PATH") my-emacs-bin)))

 ((eq system-type 'darwin)
    (defconst my-emacs-path "/Users/fenghaoran18/github/Editor/Emacs/"))

 ((eq system-type 'gnu/linux)
    (defconst my-emacs-path "/home/hfeng/github/Editor/Emacs/"))

 ((eq system-type 'linux)
    (defconst my-emacs-path "/home/hfeng/github/Editor/Emacs/"))

 ((eq system-type 'cygwin)
    (defconst my-emacs-path "/cygdrive/c/Editor/Emacs/")))


;;third-party lisp
(defconst my-emacs-lisps-path (concat my-emacs-path "lisps/"))
;;self-write lisp
(defconst my-emacs-my-lisps-path  (concat my-emacs-path "my-lisps/"))

;; 把`my-emacs-lisps-path'的所有子目录都加到`load-path'里面
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)


(require 'util)

;; 字体配置
(require 'font-settings)

;; 编码设置
(require 'coding-settings)

;; 一些基本的小函数
(require 'ahei-misc)

;; 一些Emacs的小设置
(require 'misc-settings)

;; 鼠标配置
(require 'mouse-settings)

;; `mode-line'显示格式
(require 'mode-line-settings)

;; Emacs's nerdtree
(require 'dirtree-setting)

;; 最近打开的文件
(require 'recentf-settings)

;; 所有关于buffer方面的配置
(require 'all-buffer-settings)

;;; 图片mode
;(require 'image-mode-settings)


;; 方便的在kill-ring里寻找需要的东西
(require 'browse-kill-ring-settings)

;; Emacs超强的增量搜索Isearch配置
(require 'isearch-settings)

;;;; Emacs可以做为一个server, 然后用emacsclient连接这个server,
;;;; 无需再打开两个Emacs
;;(require 'emacs-server-settings)

;; 增加更丰富的高亮
(require 'generic-x)

;; grep
(require 'grep-settings)

;; intent setting for development language
(require 'dev-settings)

;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

;; org是一个非常强大的GTD工具
(require 'org-settings)

;; backup is pre-test configure file
;(require 'backup-settings)
