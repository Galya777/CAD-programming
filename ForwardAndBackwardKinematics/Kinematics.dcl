Kinematics : dialog {
  key = "Title";
  label = "";//Title$ from lsp file
  spacer;

  : boxed_row {
 label = "Parameters"; 
 : column {
 :row{
 : edit_box {
      key = "a1";//Edit1$ from lsp file
      edit_width = 6.42;
      fixed_width = true;
      label = "a1= [mm]";
    }
    : edit_box {
      key = "titha1";//Edit1$ from lsp file
      edit_width = 6.42;
      fixed_width = true;
      label = "titha1= [rad]";
    }
   :edit_box {
      key = "titha1max";//Edit1$ from lsp file
      edit_width = 6.42;
      fixed_width = true;
      label = "titha1max= [rad]";
    }
   }
   :row{
 : edit_box {
      key = "a2";//Edit1$ from lsp file
      edit_width = 6.42;
      fixed_width = true;
      label = "a2= [mm]";
    }
    : edit_box {
      key = "titha2";//Edit1$ from lsp file
      edit_width = 6.42;
      fixed_width = true;
      label = "titha2= [rad]";
    }
    :edit_box {
      key = "titha2max";//Edit1$ from lsp file
      edit_width = 6.42;
      fixed_width = true;
      label = "titha2max= [rad]";
    }
    
   }
 }
}
: boxed_radio_row {
    key = "Radio1";
    label = "Point";
    width = 34.26;
    fixed_width = true;
    : radio_button {
      key = "A";
      label = "WWww";
    }
    : radio_button {
      key = "B";
      label = "Line";
    }
    : radio_button {
      key = "C";
      label = "C-Size";
    }
  

  spacer;
   //image
: image_button {
      key = "Slide1";
      width = 17.26;
      height = 5.28;
      aspect_ratio = 1;
            color = 6;
    }
//end image
}

  spacer;
  ok_cancel;
}//MyRadios