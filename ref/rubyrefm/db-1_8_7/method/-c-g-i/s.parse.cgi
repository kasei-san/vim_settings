kind=defined
names=parse
visibility=public

--- parse(query) -> object

QUERY_STRING ��ѡ������ޤ���

�㡧
        require "cgi"

        params = CGI.parse("query_string")
          # {"name1" => ["value1", "value2", ...],
          #  "name2" => ["value1", "value2", ...], ... }

