open Cil
open Printf

let run_taint fmt debug info globals = 
	let module P = TaintPrinter.Printer(struct
										let fmt = fmt
										let debug = debug
										let info = info
					end) in
	let computed_function_envs = ref (Inthash.create 1024) in
	let func_hash = Hashtbl.create 1024 in
	let lib_func_hash = Inthash.create 1024 in
	let func_constr_hash = Inthash.create 1024 in
	List.iter
	(fun global -> 
		match global with
		|GFun (funcdec,_)-> Hashtbl.add func_hash funcdec.svar.vname funcdec
		| _-> ignore() 
	)globals;
	let print_function_count() =
		ignore()
	in
	printf "ss";;

	
let run fmt =
	let files_input = ["test_case/test_field.i"] in
	let files = 
		List.map (
			fun filename ->
			let f = Frontc.parse filename in
			f()
		)files_input in
	let file =Mergecil.merge files "test" in
	Rmtmps.removeUnusedTemps file;
	Cfg.computeFileCFG file;
	let globals = file.globals in
	run_taint fmt true true globals
