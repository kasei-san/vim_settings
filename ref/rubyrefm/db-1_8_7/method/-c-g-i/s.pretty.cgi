kind=defined
names=pretty
visibility=public

--- pretty(string, shift = "  ") -> string

HTML ��ʹ֤˸��䤹���������ޤ���

�㡧
        require "cgi"

        print CGI.pretty("<HTML><BODY></BODY></HTML>")
          # <HTML>
          #   <BODY>
          #   </BODY>
          # </HTML>

        print CGI.pretty("<HTML><BODY></BODY></HTML>", "\t")
          # <HTML>
          #         <BODY>
          #         </BODY>
          # </HTML>

