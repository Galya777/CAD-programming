InYan :dialog {
  key = "InYan";
  label = "Write InYan symbol!";
  spacer;
  :text {
    label = "This program is drawing the InYan symbol.";
    alignment = centered;
  }
  spacer;
  :row{
  :boxed_column
  {
  :edit_box{
  label ="Enter big radius: ";
  key = "bigOne";
  alignment = centered;
  edit_limit=3;
      edit_width = 6.42;
      fixed_width = true;
      value="";
  }
  :edit_box{
  label ="Enter small radius: ";
  key = "smallOne";
  alignment = centered;
   edit_limit=3;
      edit_width = 6.42;
      fixed_width = true;
      value="";
   }
  }
 }
 :image{
 key="im1";
 height=10;
 width=20;
  }
  :boxed_row{
  :button{
  key = "help";
  label = "Help";
is_default = true;
fixed_width = true;
alignment = centered;
  }
  :button{
  key = "accept";
label = "OK";
is_default = true;
fixed_width = true;
alignment = centered;
  }
  :button{
  key = "cancel";
label = "Cancel";
is_default = true;
fixed_width = true;
alignment = centered;
   }   
  }
}