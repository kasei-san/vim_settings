kind=defined
names=form
visibility=public

--- form(method = "post", action = nil, enctype = "application/x-www-form-urlencoded")
       
        �㡧
        form{ "string" }
          # <FORM METHOD="post" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

        form("get"){ "string" }
          # <FORM METHOD="get" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

        form("get", "url"){ "string" }
          # <FORM METHOD="get" ACTION="url" ENCTYPE="application/x-www-form-urlencoded">string</FORM>

        form({"METHOD" => "post", ENCTYPE => "enctype"}){ "string" }
          # <FORM METHOD="post" ENCTYPE="enctype">string</FORM>

