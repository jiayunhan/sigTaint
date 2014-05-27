open Cil
open TaintGamma
open Format
class print func_envs = object(self)
    inherit defaultCilPrinterClass as super
    val mutable current_function = None

    method private in_current_function vi =
        assert(current_function = None);
        current_function <- Some vi
    method private out_current_function =
        assert(current_function <> None);
        current_function <- None
    method current_function = current_function

    method private getDifferences stmt_envs env s =
        let old_envs = 
            List.map
                (fun pred -> Inthash.find stmt_envs pred.sid)
                s.preds in
        let result_env = 
            Gamma.get_differences env old_envs in
        (Gamma.env_length result_env > 0, result_env)

    method private pDifferences fmt env stmt=
        ignore(super#pGlobal fmt (GText ""));
        ignore(super#pGlobal fmt (GText (Format.sprintf "/*sid:%d*/" stmt.sid)));
        Gamma.env_iter
            (fun vid taint ->
                let str_taint = Gamma.pretty_string_taint vid taint in
                ignore(super#pGlobal fmt (GText (Format.sprintf "/*%s*/" str_taint))))
            env

    method private annotatedStmt (next:stmt) fmt (s:stmt) = 
        Gamma.fprintfList ~sep:"@\n" (fun fmt l -> ignore(super#pLabel () l)) fmt s.labels;
        if s.labels <> [] then fprintf fmt "@\n";
        ignore(super#pStmtKind next () s.skind);

    method pAnnotatedStmt next fmt s =
        let current_func_vinfo = self#current_function in
        match current_func_vinfo with
            | None ->
                assert(false)
            | Some vinfo ->
                try 
			        let (_, stmt_envs) = Inthash.find func_envs vinfo.vid in
	                let env = Inthash.find stmt_envs s.sid in
	                let (has_diff, result_env) = self#getDifferences stmt_envs env s in
                    ignore(super#pGlobal () (GText (Format.sprintf "/*sid:%d*/" s.sid))); 
	                match has_diff with
	                    | true ->
	                        self#annotatedStmt next fmt s;
	                        self#pDifferences () result_env s
	                    | false ->
	                        self#annotatedStmt next fmt s
                with
                    | Not_found ->
                        (* TODO: check what happens with extern variables *)
                        ignore(super#pGlobal () (GText "/* TODO: CHECK TAINT */"));
                        self#annotatedStmt next fmt s
    	
end