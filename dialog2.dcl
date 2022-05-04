dcl_settings : default_dcl_settings { audit_level = 3; }
//---------------------------------------------------------------------------------------------------------
// MyFirst
//---------------------------------------------------------------------------------------------------------
MyFirst : dialog {
  label = " Hello World";
  spacer;
  : text {
    label = "This is my first dialog.";
    alignment = centered;
  }
  spacer;
  ok_only;
}//MyFirst