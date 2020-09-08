set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
language en

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
source $VIMRUNTIME/colors/desert.vim
behave mswin

:set showmatch
:set matchtime=2 
set nu!
set sw=4
set ts=4
set expandtab

set autoindent

"set guifont=新宋体:h20:cGB2312

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set guifont=Consolas:h16:cANSI
""""""""""""""""""""""""""""""""""""""""""""""
""omni completion 
""""""""""""""""""""""""""""""""""""""""""""""
set ofu=syntaxcomplete#Complete
imap <silent> ` <C-P>

syntax on

filetype indent on

:ab miaohead /************************************************************************************<Enter>FileName:<Enter>Creator:xy<Enter>Function:<Enter>Update:<Enter>*************************************************************************************/
:ab miaoanno /**********annotation**********<Enter>↓<Enter>********************/
:ab miaoannotcl #**********annotation**********<Enter>↓<Enter>********************
:ab miaopara  /*DECLARE PARAMETERS IN UPPERCASE*/<Enter>parameter DATA_WIDTH = 8;

:ab miaotime `timescale 1 ns/ 1 ps
:ab miaoalways always  @(posedge clk or negedge rst)<Enter>begin<Enter>if(!rst)<Enter> <Delete>begin<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace>else<Enter> <Delete>begin<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>end

:ab miaozuhe always  @(*)<Enter>    begin<Enter>end

:ab miaomodule module module_name(clk,rst,din0,din1,dout0,dout1,other0,other1);<Enter>input clk;<Enter>input rst,<Enter><Backspace><Backspace><Backspace><Backspace>/*input signals*/<Enter>input din0;<Enter>input [7:0] din1;<Enter>/*output signals*/<Enter>output dout0;<Enter>output reg [7:0] dout1;<Enter>/*other signals*/<Enter>input reg other0;<Enter>output reg other1;<Enter><Enter>/*define intermediate signals*/<Enter>reg signal1;<Enter>wire ;<Enter><Enter>/*link intermediate signals*/<Enter>assign ;<Enter><Enter><Enter><Enter>endmodule

:ab miaousemodule module_name module_instance_name(<Enter>.clk(clk_tb),<Enter>.rst(rst_tb),<Enter>.din0(din0_tb),<Enter>.din1(din1_tb),<Enter>.out0(out0_tb)<Enter>);<Enter> 
:ab miaoxiaozuhe always@(*)<Enter>    begin<Enter>end<Enter><Enter><Backspace><Backspace><Backspace><Backspace>

:ab miaotest `timescale 1 ns/1 ns<Enter><Enter>module testbench_name();<Enter><Enter><Tab>//clock & reset<Enter>reg clk  ;<Enter>reg rst;<Enter><Enter>//input signals TO DUT<Enter>reg[3:0]  din0  ;<Enter>reg       din1  ;<Enter><Enter><Enter>//ouput signals FROM DUT<Enter>wire      dout0;<Enter>wire[4:0] dout1;<Enter><Enter><Enter>//clock period<Enter>parameter CLK_PERIOD    = 20;<Enter><Enter>//reset time <Enter>parameter RST_TIME = 3 ;<Enter><Enter>//instance of DUT <Enter>module_name uut(<Enter>.clk          (clk     ), <Enter>.rst          (rst     ),<Enter>.din0         (din0    ),<Enter>.din1         (din1    ),<Enter>.dout0        (dout0   ),<Enter>.dout1        (dout1   )<Enter><Enter>);<Enter><Enter><Enter>//create clock 50M<Enter>initial<Enter>     begin<Enter>clk = 0;<Enter>forever<Enter>#(CLK_PERIOD/2)<Enter>clk=~clk;<Enter>end<Enter><Enter><Backspace><Backspace><Backspace><Backspace><Backspace>//set reset signal for first time<Enter>initial<Enter>     begin<Enter>rst = 1;<Enter>#2;<Enter>rst = 0;<Enter>#(CLK_PERIOD*RST_TIME);<Enter>rst = 1;<Enter>end<Enter><Enter><Backspace><Backspace><Backspace><Backspace><Backspace>//change of din0<Enter>initial<Enter>     begin<Enter>#1;<Enter>//set initial value of din0<Enter>din0 = 0;<Enter>#(10*CLK_PERIOD);<Enter>//din0 begin to change<Enter><Enter>end<Enter><Enter><Backspace><Backspace><Backspace><Backspace><Backspace>//change of din1<Enter>initial<Enter>     begin<Enter>#1;<Enter>//set initial value of din1<Enter>din1 = 0;<Enter>#(10*CLK_PERIOD);<Enter>//change of din1<Enter><Enter>end<Enter><Enter><Enter><Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>endmodule

:ab miaocase always@(posedge clk)<Enter>case({,,})<Enter>  3'b1xx : ;<Enter><Enter><Backspace><Backspace>endcase

:ab miaoztj    //四段式状态机<Enter><Enter>//第一段：同步时序always模块，格式化描述次态寄存器迁移到现态寄存器(不需更改）<Enter>always@(posedge clk or negedge rst)<Enter>    begin<Enter>if(!rst)<Enter>    begin<Enter>state_c <= IDLE;<Enter>end<Enter>else<Enter>     begin<Enter>state_c <= state_n;<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>end<Enter><Enter><Backspace><Backspace><Backspace><Backspace><Backspace>//第二段：组合逻辑always模块，描述状态转移条件判断<Enter>always@(*)<Enter>begin<Enter>    case(state_c)<Enter>IDLE:<Enter>    begin<Enter>if(idl2s1_start)<Enter>    begin<Enter>state_n = S1;<Enter>end<Enter>else<Enter>     begin<Enter>state_n = state_c;<Enter>end<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>S1:<Enter>    begin<Enter>if(s12s2_start)<Enter>    begin<Enter>state_n = S2;<Enter>end<Enter>else<Enter>     begin<Enter>state_n = state_c;<Enter>end<Enter>end<Enter>S2:    begin<Enter>if(s22s3_start)<Enter>    begin<Enter>state_n = S3;<Enter>end<Enter>else<Enter>     begin<Enter>state_n = state_c;<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>default:<Enter>begin<Enter>state_n = IDLE;<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace>endcase<Enter><Backspace><Backspace><Backspace><Backspace>end<Enter><Enter><Backspace>//第三段：设计转移条件<Enter>assign idl2s1_start  = state_c==IDLE && ;<Enter>assign s12s2_start = state_c==S1    && ;<Enter>assign s22s3_start  = state_c==S2    && ;<Enter><Enter>//第四段：同步时序always模块，格式化描述寄存器输出（可有多个输出）<Enter>always  @(posedge clk or negedge rst)<Enter>    begin<Enter>if(!rst)<Enter>    begin<Enter>out1 <=1'b0      //初始化<Enter>end<Enter>else if(state_c==S1)<Enter>    begin<Enter>out1 <= 1'b1;<Enter>end<Enter>else<Enter>     begin<Enter>out1 <= 1'b0;<Enter>end<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>end

:ab miaojsq    //接收器<Enter>always @(posedge clk or negedge rst)<Enter>    begin<Enter>if(!rst)<Enter>    begin<Enter>cnt <= 0;<Enter>end<Enter>else if(add_cnt)<Enter>    begin<Enter>if(end_cnt)<Enter>cnt <= 0;<Enter>else<Enter>cnt <= cnt + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt = ;       <Enter>assign end_cnt = add_cnt && cnt== ;   

:ab miaojsq2 //接收器<Enter>always @(posedge clk or negedge rst)<Enter>    begin<Enter>if(!rst)<Enter>    begin<Enter>cnt0 <= 0;<Enter>end<Enter>else if(add_cnt0)<Enter>    begin<Enter>if(end_cnt0)<Enter>cnt0 <= 0;<Enter>else<Enter>cnt0 <= cnt0 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt0 = ;<Enter>assign end_cnt0 = add_cnt0 && cnt0== ;<Enter><Enter>always @(posedge clk or negedge rst)<Enter>    begin <Enter>if(!rst)<Enter>    begin<Enter>cnt1 <= 0;<Enter>end<Enter>else if(add_cnt1)<Enter>    begin<Enter>if(end_cnt1)<Enter>cnt1 <= 0;<Enter>else<Enter>cnt1 <= cnt1 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt1 = end_cnt0;<Enter>assign end_cnt1 = add_cnt1 && cnt1== ;<Enter>

:ab miaojsq3 //接收器<Enter>always @(posedge clk or negedge rst)<Enter>    begin<Enter>if(!rst)<Enter>    begin<Enter>cnt0 <= 0;<Enter>end<Enter>else if(add_cnt0)<Enter>    begin<Enter>if(end_cnt0)<Enter>cnt0 <= 0;<Enter>else<Enter>cnt0 <= cnt0 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt0 = ;<Enter>assign end_cnt0 = add_cnt0 && cnt0== ;<Enter><Enter>always @(posedge clk or negedge rst)<Enter>    begin <Enter>if(!rst)<Enter>    begin<Enter>cnt1 <= 0;<Enter>end<Enter>else if(add_cnt1)<Enter>    begin<Enter>if(end_cnt1)<Enter>cnt1 <= 0;<Enter>else<Enter>cnt1 <= cnt1 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt1 = end_cnt0;<Enter>assign end_cnt1 = add_cnt1 && cnt1== ;<Enter><Enter>always @(posedge clk or negedge rst)<Enter>    begin<Enter>if(!rst)<Enter>    begin<Enter>cnt2 <= 0;<Enter>end<Enter>else if(add_cnt2)<Enter>    begin<Enter>if(end_cnt2)<Enter>cnt2 <= 0;<Enter>else<Enter>cnt2 <= cnt2 + 1;<Enter>end<Enter>end<Enter><Enter>assign add_cnt2 = end_cnt1;<Enter>assign end_cnt2 = add_cnt2 && cnt2== ;<Enter> 

:ab miaoop32 output[   31: 0]         ;
:ab miaoop16 output[   15: 0]         ;
:ab miaoop  output[    7: 0]         ;

:ab miaoip32 input [   31: 0]         ;
:ab miaoip16 input [   15: 0]         ;
:ab miaoip  input [    7: 0]         ;

:ab miaowire32 wire  [   31: 0]         ;
:ab miaowire16 wire  [   15: 0]         ;
:ab miaowire  wire  [    7: 0]         ;

:ab miaoreg32 reg   [   31: 0]         ;
:ab miaoreg16 reg   [   15: 0]         ;
:ab miaoreg  reg   [    7: 0]         ;

:ab miaoinitial initial<Enter>     begin<Enter>#1;<Enter>end

:ab miaocswitch switch (current_sweep_number)<Enter>    {<Enter><Backspace><Backspace><Backspace><Backspace>        case 0:<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>           {<Enter><Enter>}<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>     <Enter><Backspace><Backspace><Backspace>case 1:<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>           {<Enter><Enter>}<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>        case 2:<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>           {<Enter><Enter>}<Enter><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace><Backspace>    }

:ab miaocfor for(i = 0; i < 100; i++)<Enter>{<Enter> <Enter>}<Enter> 
:ab miaoprogram program programname;<Enter><Enter>endprogram
:ab miaotask ////task1////<Enter><Backspace><Backspace>task taskname();<Enter>begin<Enter>end<Enter>endtask
:ab miaofunction ////function1////<Enter><Backspace><Backspace>function return_type functionname();<Enter>begin<Enter><Enter>end<Enter>endfunction
:ab miaoclass /***class1***/<Enter>class classname;<Enter><Enter>////task1////<Enter><Backspace><Backspace>task taskname();<Enter>begin<Enter><Enter>end<Enter>endtask<Enter><Enter>////function1////<Enter><Backspace><Backspace>function return_type functionname();<Enter>begin<Enter><Enter>end<Enter>endfunction<Enter><Enter>endclass
:ab miaosvcase case(select_value)<Enter>0:   ;<Enter>1:   ;<Enter>endcase

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

