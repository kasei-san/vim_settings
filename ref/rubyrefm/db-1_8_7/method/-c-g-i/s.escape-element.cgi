kind=defined
names=escapeElement
visibility=public

--- escapeElement(string, *elements) -> string

elements �˻��ꤷ��������ȤΥ�����������λ��Ȥ��ִ����ޤ���

�㡧
        require "cgi"

        p CGI.escapeElement('<BR><A HREF="url"></A>', "A", "IMG")
             # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"

        p CGI.escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"])
             # => "<BR>&lt;A HREF="url"&gt;&lt;/A&gt"

