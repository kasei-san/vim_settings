kind=defined
names=checkbox_group
visibility=public

--- checkbox_group(name = "", *values)
       
        �㡧
        checkbox_group("name", "foo", "bar", "baz")
          # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
          # <INPUT TYPE="checkbox" NAME="name" VALUE="bar">bar
          # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

        checkbox_group("name", ["foo"], ["bar", true], "baz")
          # <INPUT TYPE="checkbox" NAME="name" VALUE="foo">foo
          # <INPUT TYPE="checkbox" SELECTED NAME="name" VALUE="bar">bar
          # <INPUT TYPE="checkbox" NAME="name" VALUE="baz">baz

        checkbox_group("name", ["1", "Foo"], ["2", "Bar", true], "Baz")
          # <INPUT TYPE="checkbox" NAME="name" VALUE="1">Foo
          # <INPUT TYPE="checkbox" SELECTED NAME="name" VALUE="2">Bar
          # <INPUT TYPE="checkbox" NAME="name" VALUE="Baz">Baz

        checkbox_group({ "NAME" => "name",
                         "VALUES" => ["foo", "bar", "baz"] })

        checkbox_group({ "NAME" => "name",
                         "VALUES" => [["foo"], ["bar", true], "baz"] })

        checkbox_group({ "NAME" => "name",
                         "VALUES" => [["1", "Foo"], ["2", "Bar", true], "Baz"] })

