kind=defined
names=hidden
visibility=public

--- hidden(name = "", value = nil)
       
        �㡧
        hidden("name")
          # <INPUT TYPE="hidden" NAME="name">

        hidden("name", "value")
          # <INPUT TYPE="hidden" NAME="name" VALUE="value">

        hidden({ "NAME" => "name", "VALUE" => "reset", "ID" => "foo" })
          # <INPUT TYPE="hidden" NAME="name" VALUE="value" ID="foo">

