(* TEST
*)

let () =
  let tmpdir1 = ref "" in
  let tmpdir2 = ref "" in
  let passed = try
    tmpdir1 := Filename.temp_dir "morx" "fleem";
    assert (Sys.is_directory !tmpdir1);
    tmpdir2 := Filename.temp_dir "morx" "fleem" ;
    assert (Sys.is_directory !tmpdir2);
    assert (!tmpdir1 <> !tmpdir2);
    true
  with _ ->
    if !tmpdir1 <> "" then
      Sys.rmdir !tmpdir1
   else ();
    if !tmpdir2 <> "" then
      Sys.rmdir !tmpdir2
   else ();
  false
  in
  assert passed
