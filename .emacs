;; .emacs
;;
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
)

(add-to-list 'load-path "~/.emacs.d/lisp/emacs-color-theme-solarized")
(require 'color-theme-solarized)
(color-theme-solarized)
;;(load-theme 'solarized t)


;; Enable magit
(require 'magit)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode) ;; undo tree, one of the favorite

;; Edit server from Chrome
(require 'edit-server)
(edit-server-start)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; disable autosave
(setq auto-save-default nil)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(menu-bar-mode nil)
 '(nxml-char-ref-display-glyph-flag t)
 '(nxml-heading-element-name-regexp "title\\|head\\|card\\|steps\\|step")
 '(nxml-section-element-name-regexp
   "article\\|\\(sub\\)*section\\|chapter\\|div\\|appendix\\|part\\|preface\\|reference\\|simplesect\\|bibliography\\|bibliodiv\\|glossary\\|glossdiv\\|addressBook\\|testsuite\\|testcase")
 '(nxml-sexp-element-flag nil)
 '(nxml-slash-auto-complete-flag t)
 '(ruby-indent-level 2)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Key defination
(global-set-key [f1] 'shell);F1进入Shell
;; (global-set-key [f2] 'tcl-mode);F2进入Tcl Mode
(global-set-key [f6] 'other-window);F6窗口间跳转
;;(global-set-key [f10] 'split-window-vertically);F10分割窗口
(global-set-key [f11] 'delete-other-windows);F11 关闭其它窗口
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)
(global-set-key [f5] 'switch-to-previous-buffer)


;普通设置
(setq inhibit-startup-message t);关闭起动时闪屏
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no
(column-number-mode t);显示列号
(show-paren-mode t);显示括号匹配
(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
;;(scroll-bar-mode nil);去掉滚动条
;tab config
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;;color theme 
;; (require 'color-theme)
;; (color-theme-initialize)
;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (set-variable 'color-theme-is-global nil)
;;             (select-frame frame)
;;             (if window-system
;;                 (color-theme-dark-solarized-light)
;;                 (color-theme-comidia))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "grey30" :foreground "gainsboro" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "Droid Sans")))))

;; Emacs shell
(setq shell-file-name "/bin/bash") 
(global-set-key (kbd "C-c z") 'shell) 
(global-set-key (kbd "<f10>") 'rename-buffer) 
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 

;; Tramp support
(setq tramp-default-method "scp")
(setq tramp-auto-save-directory "~/emacs/tramp")
(setq auto-save-file-name-transforms
       '(("\\`/[^/]*:\\(.+/\\)*\\(.*\\)" "/tmp/\\2")))
(setq tramp-chunksize 328)
(require 'ange-ftp)
(require 'tramp)

;; Eshell prompt
(setq eshell-prompt-function (lambda nil
   (concat
   (propertize (eshell/pwd) 'face `(:foreground "blue"))
   (propertize " $ " 'face `(:foreground "green")))))
(setq eshell-highlight-prompt nil)

;;(windmove-default-keybindings 'shift) 
(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)

;; w3m
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-cookies t)
;;(add-to-list 'load-path "~/.emacs.d/emacs-testlink/")
;;(require 'testlink)
;;(push "/home/aizhang/Downloads/all_testsuites.xml" rng-schema-locating-files-default)
;;(push (cons (concat "\\." (regexp-opt '("svg" "x3d") t)
;;                    "\\'") 'nxml-mode) auto-mode-alist)

;; Change word synax tabel
(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

;; ;; Git support
;; (add-to-list 'load-path "~/.emacs.d/egg/")
;; (require 'egg)

;; Have recently used files how up as an option under "File"
(recentf-mode 1)
(put 'set-goal-column 'disabled nil)

;; Auto fill
(setq-default fill-column 78)
(setq auto-fill-mode 1)

;; Enable ido-mode
(ido-mode t)
;; Insert timestamp after TODO job is done
(setq org-log-done 'time)

;; Go-to last changed buffer
(require 'goto-last-change)
(global-set-key "\C-x\C-\\" 'goto-last-change)

;; -----------------------------------------------------
;; Hooks below
;; -----------------------------------------------------
;; (require 'whitespace)
;; ;;(setq whitespace-style '(face tabs))
;; ;;(setq whitespace-style '(face empty tabs lines-tail trailing))
;; (setq whitespace-style '(face tabs))
;; (global-whitespace-mode t)

;; ;全屏
;; (defun my-fullscreen ()
;;  (interactive)
;;  (x-send-client-message
;;   nil 0 nil "_NET_WM_STATE" 32
;;   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

;; ;最大化
;; (defun my-maximized-horz ()
;;  (interactive)
;;  (x-send-client-message
;;   nil 0 nil "_NET_WM_STATE" 32
;;   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
;; (defun my-maximized-vert ()
;;  (interactive)
;;  (x-send-client-message
;;   nil 0 nil "_NET_WM_STATE" 32
;;   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;; (defun my-maximized ()
;;  (interactive)
;;  (x-send-client-message
;;   nil 0 nil "_NET_WM_STATE" 32
;;   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;  (interactive)
;;  (x-send-client-message
;;   nil 0 nil "_NET_WM_STATE" 32
;;   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;; (my-maximized)
;;
;; (autoload 'geben "geben" "PHP Debugger on Emacs" t)
;; (add-to-list 'load-path "~/.emacs.d")
;; (require 'etags-select)

;; Replace+
;; (eval-after-load "replace" '(progn (require 'replace+)))


;; Icicles 
;;(add-to-list 'load-path "~/.emacs.d/icicles")
;;(require 'icicles)

;; Auto complete
(require 'auto-complete)
(require 'auto-complete-config)
;;(require 'auto-complete-etags)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;(setq tags-file-name "/home/aizhang/auto-user/src/ceaa/TAGS")
;;(setq-default ac-delay 0.0)
;;(setq-default ac-auto-show-menu -1.0)
;;(setq-default ac-sources (append '(ac-source-etags) ac-sources))
;;(setq tags-table-list '("/home/aizhang/auto-user/src/ceaa/TAGS"))
;;(setq tags-file-name "/home/aizhang/auto-user/src/ceaa/TAGS")

(defun set-newline-and-indent ()
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'tcl-mode-hook 'set-newline-and-indent)

(defun my-tcl-mode-common-hook-func ()
  (interactive)
  "Function to be called when entering into tcl-mode."
  (when (and (require 'auto-complete nil t) (require 'auto-complete-config nil t))
    (load-file "~/.emacs.d/tcl-aizhang.el")
    (require 'tcl-inferior)
    (auto-complete-mode t)
    (make-local-variable 'ac-sources)
    (setq ac-auto-start 2)
    (define-key ac-completing-map "\t" 'ac-complete)
    (define-key ac-completing-map "\r" nil)
    (define-key tcl-mode-map "\C-c\C-a" 'tcl-eval-file)
    (define-key tcl-mode-map "\C-c\C-d" 'tcl-eval-region-wdebug)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
                       ac-source-filename
                       ac-source-functions
                       ac-source-yasnippet
                       ac-source-variables
                       ac-source-symbols
                       ac-source-features
                       ac-source-abbrev
                       ac-source-dictionary))
    (when (require 'auto-complete-etags nil t)
      (add-to-list 'ac-sources 'ac-source-etags)
      ;;(setq ac-etags-use-document t)
      ;;(setq tags-table-list '("/home/aizhang/auto-user/src/ceaa/TAGS"))
      (setq tags-file-name "/Users/aaronzhang/Vmware/Mozy/QA/cneptune-qa-auto/TAGS"))))
(add-hook 'tcl-mode-hook 'my-tcl-mode-common-hook-func)
(add-hook 'inferior-tcl-mode-hook 'my-tcl-mode-common-hook-func)
;; (add-hook 'tcl-mode-hook 'flyspell-prog-mode)

;; Hightlight error inferior tcl mode
(add-hook 'inferior-tcl-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(ERROR\\)" 1 font-lock-warning-face t)))))
;; C++ and C mode...
(defun my-c-mode-common-hook-func ()
    (make-local-variable 'ac-sources)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
                                               ac-source-dictionary))
    (setq tags-file-name "/home/aizhang/Study/C/TAGS")
    (add-to-list 'ac-sources 'ac-source-etags))
(add-hook 'c-mode-hook 'my-c-mode-common-hook-func)

(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4))

(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
              c-indent-level 4         ; A TAB is equivilent to four spaces
              c-argdecl-indent 0       ; Do not indent argument decl's extra
              c-tab-always-indent t
              backward-delete-function nil) ; DO NOT expand tabs when deleting
(c-add-style "my-c-style" '((c-continued-statement-offset 4))) ; If a statement continues on the next line, indent the continuation by 4

;; Enable CEDET
;; (load-file "~/.emacs.d/cedet-1.0pre7/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;; (global-srecode-minor-mode 1)            ; Enable template insertion menu
;; (global-ede-mode 1)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)
;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semanticdb-minor-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-mru-bookmark-mode))
;; (global-semantic-highlight-edits-mode (if window-system 1 -1))
;; (global-semantic-show-unmatched-syntax-mode 1)
;; (global-semantic-show-parser-state-mode 1)

(defun my-c-mode-hook ()
  ;; auto-complete
  (when (and (require 'auto-complete nil t) (require 'auto-complete-config nil t))
    (auto-complete-mode t)
    (make-local-variable 'ac-sources)
    (setq ac-auto-start 2)
    (define-key ac-completing-map "\t" 'ac-complete)
    (define-key ac-completing-map "\r" nil)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
                       ac-source-filename
                       ac-source-functions
                       ac-source-yasnippet
                       ac-source-variables
                       ac-source-symbols
                       ac-source-features
                       ac-source-abbrev
                       ac-source-semantic
                       ac-source-dictionary))
    (when (require 'auto-complete-etags nil t)
      (add-to-list 'ac-sources 'ac-source-etags)
      (setq ac-etags-use-document t)))
      ;;(setq tags-table-list '("/home/aizhang/auto-user/src/ceaa/TAGS"))
      ;;(setq tags-file-name "/home/aizhang/auto-user/src/ceaa/TAGS")))
  (c-set-style "my-c-style")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)

  ;; semantic to jump
  (global-set-key [f12] 'semantic-ia-fast-jump)
  ;; (add-to-list 'load-path "~/.emacs.d/cedet-1.0pre7/common")
  ;; (require 'cedet)
  ;; (semantic-load-enable-code-helpers)
  ;; Enable EDE (Project Management) features
  ;; (global-ede-mode 1)
  ;; (semantic-load-enable-excessive-code-helpers)
  ;; (semantic-load-enable-semantic-debugging-helpers)
  ;; ;; Enable SRecode (Template management) minor-mode.
  ;; (global-srecode-minor-mode 1)
  ;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
  ;;                                   global-semanticdb-minor-mode
  ;;                                   global-semantic-idle-summary-mode
  ;;                                   global-semantic-mru-bookmark-mode))
  ;; (global-semantic-highlight-edits-mode (if window-system 1 -1))
  ;; (global-semantic-show-unmatched-syntax-mode 1)
  ;; (global-semantic-show-parser-state-mode 1)

  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+)       ; indent case labels by c-indent-level, too
  (define-key c-mode-base-map (kbd "RET") 'newline-and-indent))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-common-hook
'(lambda ()
   (require 'xcscope)
   (cscope-minor-mode t))) 

;; Python mode
(defun my-python-mode-hook ()
  (require 'auto-complete)
  (require 'auto-complete-config)
  (global-auto-complete-mode t)
  (setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
  (add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
  (set-face-background 'ac-candidate-face "lightgray")
  (set-face-underline 'ac-candidate-face "darkgray")
  (set-face-background 'ac-selection-face "steelblue") ;;; 
  (define-key ac-completing-map "\M-n" 'ac-next)  ;;; M-n
  (define-key ac-completing-map "\M-p" 'ac-previous)
  (setq ac-auto-start 2)
  (setq ac-dwim t)
  (define-key ac-mode-map (kbd "M-,") 'auto-complete)

    ;; C-h S to view package
  (require 'pydoc-info)

  ;; pymacs
  (add-to-list 'load-path "~/.emacs.d/lisp/Pymacs")
  (add-to-list 'load-path "~/.emacs.d/lisp/ropemacs")
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  (autoload 'python-mode "python-mode" "Python Mode." t)
  (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
  (add-to-list 'interpreter-mode-alist '("python" . python-mode))
  (require 'python-mode)
  (autoload 'pymacs-apply "pymacs")
  (autoload 'pymacs-call "pymacs")
  (autoload 'pymacs-eval "pymacs" nil t)
  (autoload 'pymacs-exec "pymacs" nil t)
  (autoload 'pymacs-load "pymacs" nil t)

  ;; iPython
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
      "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

  ;; pylint and flymake
  (setq pylint "/usr/local/bin/epylint")
  (when (load "flymake" t)
    (defun flymake-pylint-init ()
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list (expand-file-name pylint "") (list local-file))))
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.py\\'" flymake-pylint-init)))

  ;; Configure to wait a bit longer after edits before starting
  (setq-default flymake-no-changes-timeout '3)

  ;; To avoid having to mouse hover for the error message, these functions make flymake error messages
  ;; appear in the minibuffer
  (defun show-fly-err-at-point ()
    "If the cursor is sitting on a flymake error, display the message in the minibuffer"
    (require 'cl)
    (interactive)
    (let ((line-no (line-number-at-pos)))
      (dolist (elem flymake-err-info)
        (if (eq (car elem) line-no)
            (let ((err (car (second elem))))
              (message "%s" (flymake-ler-text err)))))))
  (add-hook 'post-command-hook 'show-fly-err-at-point))

;; Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; Keymaps to navigate to the errors
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cn" 'flymake-goto-next-error)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cp" 'flymake-goto-prev-error)))

(add-hook 'python-mode-hook 'my-python-mode-hook)
;;(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist(cons '("python" . python-mode)
                                 interpreter-mode-alist))

;; Perl mode
(defun my-perl-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (setq perl-indent-level 4)
  (setq perl-continued-statement-offset 4))

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (add-to-list 'load-path "~/.emacs.d/pde/")
  (load "pde-load")
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace 0)
  ;;(set-face-background 'cperl-array-face "wheat")
  ;;(set-face-background 'cperl-hash-face "wheat")
  )
;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
(add-hook 'perl-mode-hook 'my-perl-mode-hook)



(defun my-ruby-mode-common-hook-func ()
  (interactive)
  "Function to be called when entering into tcl-mode."
  (when (and (require 'auto-complete nil t) (require 'auto-complete-config nil t))
    (auto-complete-mode t)
    (make-local-variable 'ac-sources)
    (setq ac-auto-start 2)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
                       ac-source-filename
                       ac-source-functions
                       ac-source-yasnippet
                       ac-source-variables
                       ac-source-symbols
                       ac-source-features
                       ac-source-abbrev
                       ac-source-dictionary))
    (add-to-list 'ac-sources 'ac-source-etags)
    (require 'inf-ruby)
;;    (require 'ruby-electric)
    (when (require 'auto-complete-etags nil t)
      (add-to-list 'ac-sources 'ac-source-etags)
      ;;(setq ac-etags-use-document t)
      ;;(setq tags-table-list '("/home/aizhang/auto-user/src/ceaa/TAGS"))
      (setq tags-file-name "/home/aizhang/triton-test/trogdor/TAGS"))))

    ;; (require 'auto-complete-etags)
    ;; (setq tags-table-list 
    ;;       '("../"))))
    ;; (setq tags-file-name "/home/aizhang/triton-test/trogdor/TAGS")))
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-hook 'ruby-mode-hook 'my-ruby-mode-common-hook-func)
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
