kind=defined
names=escape
visibility=public

--- escape(string) -> string

string �� URL ���󥳡��ɤ���ʸ����򿷤����������֤��ޤ���

��:
        require "cgi"

        p CGI.escape('@##')   #=> "%40%23%23"

        url = "http://www.example.com/register?url=" + 
          CGI.escape('http://www.example.com/index.rss')
        p url
        #=> "http://www.example.com/register?url=http%3A%2F%2Fwww.example.com%2Findex.rss"

