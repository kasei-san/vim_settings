kind=defined
names=submit
visibility=public

--- submit(value = nil, name = nil)
       
        �㡧
        submit
          # <INPUT TYPE="submit">

        submit("ok")
          # <INPUT TYPE="submit" VALUE="ok">

        submit("ok", "button1")
          # <INPUT TYPE="submit" VALUE="ok" NAME="button1">

        submit({ "VALUE" => "ok", "NAME" => "button1", "ID" => "foo" })
          # <INPUT TYPE="submit" VALUE="ok" NAME="button1" ID="foo">

