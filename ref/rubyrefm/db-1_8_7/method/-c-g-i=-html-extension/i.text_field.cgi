kind=defined
names=text_field
visibility=public

--- text_field(name = "", value = nil, size = 40, maxlength = nil)
       
        �㡧
        text_field("name")
          # <INPUT TYPE="text" NAME="name" SIZE="40">

        text_field("name", "value")
          # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="40">

        text_field("name", "value", 80)
          # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80">

        text_field("name", "value", 80, 200)
          # <INPUT TYPE="text" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

        text_field({ "NAME" => "name", "VALUE" => "value" })
          # <INPUT TYPE="text" NAME="name" VALUE="value">

