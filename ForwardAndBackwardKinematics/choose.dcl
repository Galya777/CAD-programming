Choose : dialog {
  key = "Title1";
  label = "choose";//Title$ from lsp file
  spacer;

  : boxed_radio_row {
  key="Opition1";
 label = "";
 :radio_button{
key="1";
label="Forward";
 }
  :radio_button{
key="2";
label="Backward";
 }
 }

  spacer;
  ok_cancel;
}//MyRadios