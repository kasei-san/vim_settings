kind=defined
names=scrolling_list
visibility=public

--- scrolling_list(name = "", *values)
       
        �㡧

        scrolling_list({"NAME" => "name", "SIZE" => 2, "MULTIPLE" => true,
                        "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })
          # <SELECT NAME="name" MULTIPLE SIZE="2">
          #   <OPTION VALUE="1">Foo</OPTION>
          #   <OPTION SELECTED VALUE="2">Bar</OPTION>
          #   <OPTION VALUE="Baz">Baz</OPTION>
          # </SELECT>

