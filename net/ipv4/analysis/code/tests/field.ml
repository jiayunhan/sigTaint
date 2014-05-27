open Printf
open Cil
open Ptranal
(*let files = [ "../tcp_input.i" ;"../tcp.i"]*)
let ()=printf "Please input .i files separated with spaces \n"
let input_file=read_line() 
let files=Str.split(Str.regexp " ") input_file ;;
(* Function print funtion statement kind*)
let print_fun_stmt_kind stmt=
	match stmt.skind with
		|Instr inst_list->
			List.iter(fun instr ->
				match instr with
				|Set (lval,exp,_)->
					printf "Lval->Addr... ";	
					let expr=mkAddrOrStartOf lval in
					(match expr with
						|Lval _->()
						|AddrOf (Mem expr2,offset)->printf "AddrOf:";
							(**(match expr2 with	
							|Lval (Var varin,_)->printf "var= %s |" varin.vname
							|AddrOf _->printf "AddrOf :"
							|_->printf "else: "
							)**)
							(match offset with
							|NoOffset -> printf "NoOffset.|"
							|Field (fieldinfo,_)-> printf "Field: %s\n" fieldinfo.fname;
							|Index _-> printf "Index. |"
							)
						|_->printf " Else\n"
						);					
					(match lval with
						| (Var vinfo,_) ->  ()
						| (Mem exp,_)-> 
							(match exp with
							|Const _->printf "Const\n"
							|Lval lval->
								(match lval with
								| (Var vinfo,offset) ->
									(match offset with
									|NoOffset -> ()
									|Field _-> printf "Field.\n"
									|Index _-> printf "Index.\n"
									)
								|_ ->()
								)
							|SizeOf _->printf "Sizeof\n"
							|SizeOfE _->printf "SizeofE\n"
							|SizeOfStr _->printf "SizeofStr\n"
							|AlignOf _->printf "AlignOf\n"
							|AlignOfE _->printf "AlignOfE\n"
							|UnOp _->printf "UnOp\n"
							|BinOp _->printf "BinOp\n"
							|CastE _->printf "CastE\n"
							|AddrOf _->printf "AddrOf\n"
							|StartOf _->printf "StartOf\n"
							|_ -> printf "else..\n")
						);
                |Call _->()
                |Asm _->()
			)inst_list;
		|_->()
	
let () =
  (* Load each input file. *)
  let files =
    List.map (
      fun filename ->
	let f = Frontc.parse filename in
	f ()
    ) files in

  (* Merge them. *)
  let file = Mergecil.merge files "test" in

  (* Remove unused prototypes and variables. *)
  Rmtmps.removeUnusedTemps file;

  (* Do control-flow-graph analysis. *)
  Cfg.computeFileCFG file;

  (* Go over the internal CIL structure and print some facts. *)
  printf "CIL has loaded the files, merged them and removed unused code.\n\n";

  printf "Merged file has %d globals ...\n\n" (List.length file.globals);
  List.iter (
    function
    | GType _ -> ()			(* typedef *)
    | GCompTag _ -> ()			(* struct/union *)
    | GCompTagDecl _ -> ()		(* forward prototype of struct/union *)
    | GEnumTag _ -> ()			(* enum *)
    | GEnumTagDecl _ -> ()		(* forward prototype of enum *)
    | GVarDecl _ -> ()			(* variable/function prototype *)
    | GVar _ -> ()			(* variable definition *)
    | GFun (fundec, loc) ->	
        printf "function name: %s\n" fundec.svar.vname;
        List.iter(fun stmt->
			print_fun_stmt_kind stmt
        )fundec.sallstmts
    | GAsm _ -> ()			(* global asm statement *)
    | GPragma _ -> ()			(* toplevel #pragma *)
    | GText _ -> ()			(* verbatim text, comments *)
  ) file.globals;

