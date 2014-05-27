open Cil
type taintValue = T | U | G of varinfo list
type taintMetaValue = M_T | M_U |M_G of string list
(* [To be decided], taintConstraint is used to detect vulnerability *)
type taintConstraint = string * taintMetaValue
type taintConstraints = taintConstraint list

(*The environment is a mapping between symbol ids and taint values*)
type environment = bool *((int,taintValue) Hashtbl.t)
type statementsEnvironment = environment Inthash.t
type environmentStack = environment list

(*Function environment is a mapping between a function id and its computed environment *)
type functionEnvironment = (environment * statementsEnvironment) Inthash.t
type taintStack = Same | Push of int * taintValue | Pop

(*Gamma mapping*)
module Gamma = struct
	let create_env () = 
		(false,Hashtbl.create 1024)
	(*Returns the taint value or the delayed taint value if found, raises Not_found otherwise *)

	let get_taint env varinfo_h = 
		let env = match env with (_,_env)-> _env in 
		Hashtbl.find env varinfo_h

	let set_taint env varinfo_h taint = 
		let env = match env with (_,_env)-> _env in
		(try
			ignore (Hashtbl.find env varinfo_h);
		with Not_found->
			ignore());
		Hashtbl.add env varinfo_h taint

	let compare_taint t1 t2 =
		match (t1,t2) with
			|(T,T) -> true
			|(U,U) -> true
			|((G g1),(G g2)) ->
				List.for_all
				(fun vinfo1 ->
					List.mem vinfo1 g2
				)g1 &&
				List.for_all
				(fun vinfo2 ->
					List.mem vinfo2 g1
				)g2
			| _->false

	(*compare two environment. Return true if envs are equal.*)
	let compare env1 env2 =
		let env1 = match env1 with (_,_env) -> _env in 
		let env2 = match env2 with (_,_env) -> _env in 
		Hashtbl.fold
		(
			fun id t1 eq ->
				match eq with
				| false -> false
				| _ -> 
					let t2 = Hashtbl.find env2 id in 
					compare_taint t1 t2)
		env1
		true   

	let get_difference env env_list =
		match List.length env_list with
		| 0 -> env
		| _ -> 
		let result_env = create_env () in 

		let do_get_difference _env _old=
			Hashtbl.iter
			(fun varinfo_h taint ->
				let old_taint = get_taint _old varinfo_h in
				match compare_taint taint old_taint with
				 | true -> ignore()
				 | false->
				 	try
				 		ignore(get_taint result_env varinfo_h)
				 	with Not_found ->
				 		set_taint result_env varinfo_h taint
			)
			_env
		in

		let env = match env with (_,_env) -> _env in 
		List.iter
		(
			fun old_env->
				do_get_difference env old_env
		)env_list;
		result_env

	let get_possible_tainted_count (_,env) = 
		let count = ref 0 in 
		Hashtbl.iter
			(fun varinfo_h taint->
				if compare_taint U taint =false then count := !count+1
			)env;
		!count

	let count_dependencies (_,env) var_list = 
		let count = ref 0 in 
		Hashtbl.iter
			(fun varinfo_h taint ->
				match taint with 
				|U 
				|T -> ignore()
				|G g->
					List.iter
					(fun var_info->
						List.iter
						(fun vinfo->
							if vinfo.vname = var_info.vname then 
								count := !count+1 
						)g
					)var_list

			)env;
		!count

	let env_iter f env =
		let env = match env with (_,_env) -> _env in 
		Hashtbl.iter
		(
			fun varinfo_h taint -> f varinfo_h taint 
		)env

	let env_length env =
		let env = match env with (_,_env)-> _env in 
		Hashtbl.length env 

	let copy env =
		match env with (visited,_env) -> (visited,Hashtbl.copy _env)

	(*Function for pretty printing an environment.*)
	let pretty_print fmt env  =
		let (visited,env) = match env with (_vis,_env)->(_vis,_env) in 
		let pretty_print_taint taint =
			(match taint with
			|T -> Format.fprintf fmt "%s\n" "Tainted"
			|U -> Format.fprintf fmt "%s\n" "Untainted"
			|(G g) ->  
				Format.fprintf fmt "%s" "Generic: ";
				List.iter
					(fun el -> Format.fprintf fmt "Gamma(%s)" el.vname
					)g;
				Format.fprintf fmt "%s" "\n";)
		in 
		Format.fprintf fmt "%s\n" "===================================";
		Hashtbl.iter
		(fun varinfo_h taint ->
			(*let vid = if vid >=0 then vid else (-vid) in 
			Problem need to be solved.*)
			(*let vinfo = varinfo_from_vid vid in *)
			Format.fprintf fmt "\tSymname: %s = " varinfo_h.vname;
			pretty_print_taint taint
		)env;
		Format.fprintf fmt "%s\n" "==================================="

	let pretty_print_taint fmt taint =
		match taint with
		| T -> Format.fprintf fmt "%s" "Tainted\n"
		| U -> Format.fprintf fmt "%s" "Untainted\n"
		|(G g) ->
			Format.fprintf fmt "%s" "Generic: ";
			List.iter
				(fun el -> Format.fprintf fmt "Gamma(%s)," el.vname)
				g;
			Format.fprintf fmt "%s" "\n"

	let pretty_string_taint varinfo_h taint = 
		(*let vid = if vid >=0 then vid else (-vid) in 
		Problem need to be solved.*)
		(*let vinfo = varinfo_from_vid vid in *)
		let vinfo = varinfo_h in
		let taint_str =
			match taint with 
			|T -> Format.sprintf "%s" "T"
			|U -> Format.sprintf "%s" "U"
			|(G g)->
				let len = List.length g in 
				match
					(List.fold_left
						(fun (str,idx) el ->
							if idx<len-1 then 
								(Format.sprintf "%sG(%s) + " str el.vname, idx+1)
							else
								(Format.sprintf "%sG(%s)" str el.vname, idx+1) 
						)
						("",0)
					g) 
				with (str,_)->str
					in
		Format.sprintf "T(%s) = %s" vinfo.vname taint_str

	let pretty_print_taint_list fmt l =
		let rec print_taint_list fmt l =
			match l with
			| [] -> ignore()
			| ((hsid,htaint)::tl) -> 
				pretty_print_taint fmt htaint;
				Format.fprintf fmt "%s" ",";
				print_taint_list fmt tl
		in 
		print_taint_list fmt l;
		Format.fprintf fmt "%s" "\n"
 end














