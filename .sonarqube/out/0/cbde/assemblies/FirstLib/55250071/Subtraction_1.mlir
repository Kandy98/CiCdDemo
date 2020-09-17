func @_FirstLib.Subtraction.calculate$$() -> none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :15 :8) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :17 :19) // this (ThisExpression)
%1 = cbde.unknown : none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :17 :19) // this.a (SimpleMemberAccessExpression)
%2 = cbde.unknown : none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :17 :28) // this (ThisExpression)
%3 = cbde.unknown : none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :17 :28) // this.b (SimpleMemberAccessExpression)
%4 = cbde.unknown : none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :17 :19) // Binary expression on unsupported types this.a - this.b
return %4 : none loc("C:\\Users\\satvats2\\Documents\\Projects\\Pipeline\\FirstLib\\Subtraction.cs" :17 :12)

^1: // ExitBlock
cbde.unreachable

}
