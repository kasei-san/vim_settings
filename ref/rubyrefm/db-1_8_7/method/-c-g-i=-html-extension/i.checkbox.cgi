kind=defined
names=checkbox
visibility=public

--- checkbox(name = "", value = nil, checked = nil)
       
        �㡧
        checkbox("name")
          # = checkbox({ "NAME" => "name" })

        checkbox("name", "value")
          # = checkbox({ "NAME" => "name", "VALUE" => "value" })

        checkbox("name", "value", true)
          # = checkbox({ "NAME" => "name", "VALUE" => "value", "CHECKED" => true })

