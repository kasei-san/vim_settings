kind=defined
names=radio_button
visibility=public

--- radio_button(name = "", value = nil, checked = nil)
       
        �㡧
        radio_button("name", "value")
          # <INPUT TYPE="radio" NAME="name" VALUE="value">

        radio_button("name", "value", true)
          # <INPUT TYPE="radio" NAME="name" VALUE="value" CHECKED>

        radio_button({ "NAME" => "name", "VALUE" => "value", "ID" => "foo" })
          # <INPUT TYPE="radio" NAME="name" VALUE="value" ID="foo">

