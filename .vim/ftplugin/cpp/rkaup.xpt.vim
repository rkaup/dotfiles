XPTemplate priority=personal+

XPTvar $BRif ' '
XPTvar $BRel \n
XPTvar $BRloop ' '
XPTvar $BRstc ' '
XPTvar $BRfun ''
XPTvar $SParg ''
" Save this file as ~/.vim/ftplugin/c/hello.xpt.vim(or
" ~/vimfiles/ftplugin/c/hello.xpt.vim).
" Then you can use it in C language file:
"     vim xpt.c
" And type:
"     helloxpt<C-\>
"
XPT t
true

XPT f
false

XPT u
unsigned 

XPT fun
`void^ `name^(``params?^)
{
    `cursor^
}
..XPT

XPT class
struct `name^ {
  public://constructors and destructor
    `name^();
    ~`name^();
  public://methods
  private://members
};
..XPT

XPT fori
for (`unsigned int^ `i^ = 0; `i^ < `max^; ++`i^) {
    `cursor^
}
..XPT

XPT for:
for (`auto^ `i^ : `container^) {
    `cursor^
}
..XPT

XPT forr
for (`auto^ `it^ = `begin^; `it^ != `end^; ++`it^) {
    `cursor^
}
..XPT

XPT destr
`class^::~`class^()
{
    `cursor^
}
..XPT

XPT constr
`class^::`class^(``params?^)
{
    `cursor^
}
..XPT

XPT guard
#ifndef `guard^
#define `guard^

`cursor^

#endif // `guard^

..XPT


