open Cil
open TaintGamma
open Pretty
class print func_envs = object(self)
    inherit defaultCilPrinterClass as super

    method private stmtLabels fmt s=
        (*print the labels*)
    begin 
        let is_simple = function  
            | Instr(Set  _ | Call  _ ) -> true
            | _ -> false
        in 
        match s.labels with 
        | [] -> ()
        |  [l] when is_simple s.skind -> self#pLabel fmt l
        | _ -> List.iter (fprintf fmt "%a@ " self#pLabel) s.labels
    end

    method private annotatedStmt (next:stmt) fmt (s:stmt) = 
        self#stmtLabels fmt s;
        (* print the statement*)
        if is_skip s.skind && not s.ghost then
          (if verbose || s.labels <> [] then fprintf fmt ";")
        else
            begin
                if s.ghost then Pretty_utils.pp_open_block fmt "/*@@ ghost ";
                (*self#pStmtKind next fmt s.skind ;*)
                if s.ghost then Pretty_utils.pp_close_block fmt "*/" ;
            end
    method private getDifferences stmt_envs env s =
        let old_envs = 
            List.map
                (fun pred -> Inthash.find stmt_envs pred.sid)
                s.preds in
        let result_env = 
            Gamma.get_differences env old_envs in
        (Gamma.env_length result_env > 0, result_env)

    method private pDifferences fmt env stmt=
        super#pGlobal fmt (GText "");
        super#pGlobal fmt (GText (Format.sprintf "/*sid:%d*/" stmt.sid));
        Gamma.env_iter
            (fun varinfo taint ->
                fprint stdout 100 (super#pGlobal fmt (GText (Format.sprintf "/*%s*/" (Gamma.pretty_string_taint varinfo taint))))
            )env



    method pAnnotatedStmt next fmt s =
        let current_func_vinfo = self#current_function in
        match current_func_vinfo with
            | None ->
                assert(false)
            | Some vinfo ->
                try 
			        let (_, stmt_envs) = Inthash.find func_envs vinfo in
	                let env = Inthash.find stmt_envs s.sid in
	                let (has_diff, result_env) = self#getDifferences stmt_envs env s in
                    super#pGlobal fmt (GText (Format.sprintf "/*sid:%d*/" s.sid)); 
	                match has_diff with
	                    | true ->
	                        self#pAnnotatedStmt next fmt s;
	                        self#pDifferences fmt result_env s
	                    | false ->
	                        self#pAnnotatedStmt next fmt s
                with
                    | Not_found ->
                        (* TODO: check what happens with extern variables *)
                        super#pGlobal fmt (GText "/* TODO: CHECK TAINT */");
                        self#pAnnotatedStmt next fmt s
    	
end