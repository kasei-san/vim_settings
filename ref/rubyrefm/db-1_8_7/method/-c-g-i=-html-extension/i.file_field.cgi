kind=defined
names=file_field
visibility=public

--- file_field(name = "", size = 20, maxlength = nil)
       
        �㡧
        file_field("name")
          # <INPUT TYPE="file" NAME="name" SIZE="20">

        file_field("name", 40)
          # <INPUT TYPE="file" NAME="name" SIZE="40">

        file_field("name", 40, 100)
          # <INPUT TYPE="file" NAME="name" SIZE="40" MAXLENGTH="100">

        file_field({ "NAME" => "name", "SIZE" => 40 })
          # <INPUT TYPE="file" NAME="name" SIZE="40">

