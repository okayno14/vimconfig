call TurnOffAutoComments()

" позволяет переставить throws после спеки перед ней. Команда нужна, т.к.
" в коде полно таких мест из-за старого сниппета
function MoveThrowsUp()
    normal "zdd?%% @end"zp/%% @throws
endfunction

command MoveThrows call MoveThrowsUp()

" snippets trailing space in declaration is neccessary, cause vim syntax
ab func 
\%%--------------------------------------------------------------------<cr>
\%% @doc<cr>
\%% @end<cr>
\%% @throws<cr>
\-spec :func_name(:args_spec) -><cr>
    \<c-t>ok.<cr>
\<c-d>%%--------------------------------------------------------------------<cr>
\:func_name(:args) -><cr>
    \<c-t>ok.<cr>
\<c-d>%%--------------------------------------------------------------------

ab receive 
    \receive<cr>
        \<c-t>_M -><cr>
            \<c-t>ok<cr>
    \<c-d><c-d>after<cr>
        \<c-t>0 -><cr>
            \<c-t>ok<cr>
    \<c-d><c-d>end<cr>

ab case 
 \case :var of<cr>
    \<c-t>:case1 -><cr>
        \<c-t>ok<cr>
 \<c-d><c-d>end

ab try 
 \try :var of<cr>
    \<c-t>:case1 -><cr>
        \<c-t>ok<cr>
 \<c-d><c-d>catch<cr>
     \<c-t>ExceptionType:Reason -><cr>
        \<c-t>ok<cr>
 \<c-d><c-d>end

