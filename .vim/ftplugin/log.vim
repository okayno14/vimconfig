let s:do_log = v:false

let s:log_label_list = [
    \ "ERROR",
    \ "WARN",
    \ "INFO",
    \ "TRACE",
    \ "DEBUG",
    \ "CONSOLE",
    \ "NOTICE",
    \ "WARNING",
    \ "ERR",
    \ "CRITICAL",
    \ "ALERT",
    \ "EMERGENCY",
\ ]

" Логи с длинной label + 4 строки
" Окно лучше оставлять маленьким
let s:window = 2

function s:log(msg, line = expand('<sflnum>'))
  if s:do_log
    call s:log_m(a:msg, a:line)
  endif
endfunction

function s:log_m(msg, line)
  let file = expand('<script>')
  echom printf("[%s:%s] %s", file, a:line, a:msg)
endfunction

" TODO почитать про кэш линий, возможно, что имеет смысл
function s:log_fold()
  let current_line = v:lnum
  " cache
  let has_log_current = s:has_log_label(getline(current_line))
  " однострочный лог
  if has_log_current && s:has_log_label(getline(current_line + 1))
    call s:log(current_line .. " oneline log -> nowrap")
    return "0"
  endif
  " cache
  let has_log_down = s:has_log_down(current_line)
  " начало длинного лога
  " Защита от логов, с label + (s:window + 1) строк
  if has_log_current && !s:has_log_down(current_line, s:window + 2)
    call s:log(current_line .. " long log label -> wrap begin")
    return ">1"
  endif
  " вторая строка
  " Защита от логов, с label + (s:window + 1) строк
  if s:has_log_label(getline(current_line - 1))
    \ && s:has_log_down(current_line, s:window + 1)
    call s:log(current_line .. " line after small log label -> nowrap")
    return "0"
  endif
  " тело длинного лога
  if !has_log_current && !has_log_down
    call s:log(current_line .. " long log body -> wrap")
    return "1"
  endif
  " последняя строка
  " Защита от логов, с label + (s:window + 1) строк
  if s:has_log_label(getline(current_line + 1))
    \ && s:has_log_up(current_line, s:window + 1)
    call s:log(current_line .. " end of small log -> nowrap")
    return "0"
  endif
  " конец длинного лога
  if !has_log_current && has_log_down && !s:has_log_up(current_line)
    call s:log(current_line .. " end of long log -> wrap")
    return "1"
  endif
  return "0"
endfunction

function s:has_log_up(current_line, window = s:window)
  let begin = a:current_line - 1
  let end = begin - a:window + 1
  let ret = indexof(
  \   range(begin, end, -1),
  \   {index, line -> s:has_log_label(getline(line))},
  \ )
  if ret == -1
    return v:false
  else
    return v:true
  endif
endfunction

function s:has_log_down(current_line, window = s:window)
  let begin = a:current_line + 1
  let end = begin + a:window - 1
  let ret = indexof(
  \   range(begin, end, 1),
  \   {index, line -> s:has_log_label(getline(line))},
  \ )
  if ret == -1
    return v:false
  else
    return v:true
  endif
endfunction

" TODO сделать log_label_list как переменную по умолчанию
function s:has_log_label(line)
  let ret = indexof(
  \   s:log_label_list,
  \   {index, log_label -> match(a:line, "\\c" .. "\\<" .. log_label .. "\\>") != -1},
  \ )
  if ret == -1
    return v:false
  else
    return v:true
  endif
endfunction

" Подразумевается замена, т.к. у других filetype возможна своя реализация
function! FoldSyntax()
  setlocal foldexpr=s:log_fold()
  setlocal foldmethod=expr
endfunction

set colorcolumn=0
