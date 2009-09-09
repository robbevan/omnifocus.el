; To send tasks from Emacs to OmniFocus using Control-C Control-O,
; drop this script in your emacs load path and add lines like these to
; your .emacs:
;
; (autoload 'send-region-to-omnifocus-quickentry "omnifocus" "Send the selected region to OmniFocus's Quick Entry window" t)
; (global-set-key "\C-c\C-o" 'send-region-to-omnifocus-quickentry)

(defun send-region-to-omnifocus-quickentry (beg end)
  "Send the selected region to OmniFocus's Quick Entry window"
  (interactive "r")
  (do-applescript (concat
    "tell front document of application \"OmniFocus\"
      tell quick entry
        make new inbox task with properties {name:\""(buffer-substring beg end)"\"}
        select {inbox task 1}
      end tell
      open quick entry
    end tell")
  ))