// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
  @SCREEN // スクリーンのいちばん左上を指すアドレス
  D=A
  @R0
  M=D
  @KBD // Keycode,何も押されてなければ0
  D=M
  @white
  D;JEQ
  @color
  M=-1 // 1111111111111111
  @fill
  0;JMP
(white)
  @color
  M=0
(fill)
  @color
  D=M
  @R0
  A=M
  M=D
  @1
  D=A
  @R0
  M=D+M
  D=M
  @24575 // スクリーンのいちばん右下を指すアドレス
  D=D-A
  @LOOP
  D;JGT
  @fill
  0;JMP

