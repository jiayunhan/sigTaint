
open Printf
open Cil

(*let files = [ "../tcp_input.i" ;"../tcp.i"]*)
let ()=printf "Please input .i files separated with spaces \n"
let input_file=read_line() 
let files=Str.split(Str.regexp " ") input_file ;;
let () =
  (* Load each input file. *)
  let files =
    List.map (
      fun filename ->
	(* Why does parse return a continuation? *)
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
    | GFun (fundec, loc) ->		(* function definition *)
      (*printf "%s:%d: %s has %d arg(s)\n"
	  loc.file loc.line fundec.svar.vname (List.length fundec.sformals);
       *)
      if fundec.svar.vname = "tcp_rcv_established" then
        Cfg.printCfgFilename (fundec.svar.vname ^ ".dot") fundec

    | GAsm _ -> ()			(* global asm statement *)
    | GPragma _ -> ()			(* toplevel #pragma *)
    | GText _ -> ()			(* verbatim text, comments *)
  ) file.globals;
