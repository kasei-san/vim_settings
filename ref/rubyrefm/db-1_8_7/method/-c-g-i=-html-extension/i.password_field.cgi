kind=defined
names=password_field
visibility=public

--- password_field(name = "", value = nil, size = 40, maxlength = nil)
       
        �㡧
        password_field("name")
          # <INPUT TYPE="password" NAME="name" SIZE="40">

        password_field("name", "value")
          # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="40">

        password_field("password", "value", 80, 200)
          # <INPUT TYPE="password" NAME="name" VALUE="value" SIZE="80" MAXLENGTH="200">

        password_field({ "NAME" => "name", "VALUE" => "value" })
          # <INPUT TYPE="password" NAME="name" VALUE="value">

