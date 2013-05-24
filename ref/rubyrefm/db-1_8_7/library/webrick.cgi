methods=
sublibraries=
requires=webrick.httpstatus,webrick.httprequest,webrick.htmlutils,webrick.cookie,webrick.httputils,webrick.httpresponse,webrick.httpversion,webrick.log,webrick.utils,webrick.config
classes=WEBrick=CGI,WEBrick=CGI=CGIError
is_sublibrary=true

���̤� CGI �Ķ��� [[lib:webrick]] �饤�֥��Υ����֥�åȤ�Ʊ���褦�� CGI ������ץȤ�񤯤����
�饤�֥��Ǥ��������Ф� WEBrick �Ǥʤ��Ƥ�Ȥ����Ȥ�����ޤ���

=== �Ȥ���

WEBrick �Υ����֥�åȤ��������Τ�Ʊ���褦�ˡ�[[c:WEBrick::CGI]] �Υ��֥��饹�ǥ᥽�å�
do_GET �� do_POST ��������뤳�Ȥˤ�ä� CGI ������ץȤ�񤭤ޤ���

������ץȤκǸ�� [[m:WEBrick::CGI#start]] �᥽�åɤ�Ƥ�ɬ�פ�����ޤ���
WEBrick::CGI#start �᥽�åɤ� service �᥽�åɤ�ƤӽФ���service �᥽�åɤϥꥯ�����Ȥ˱�����
do_XXX �᥽�åɤ�ƤӽФ��ޤ������Τ褦�ˤ��ƥ�����ץȤϼ¹Ԥ���ޤ���

��:

 #!/usr/local/bin/ruby
 require 'webrick/cgi'

 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     res["content-type"] = "text/plain"
     ret = "hoge\n"
     res.body = ret
   end
 end
 
 MyCGI.new.start()

==== �ե�����ե�����ɤ��ͤ�����

�ե�����ե�����ɤ��ͤ� [[m:WEBrick::HTTPRequest#query]] �᥽�åɤ��֤� Hash ���֥������Ȥ�
��Ǽ����Ƥ��ޤ���

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.query               #=> Hash ���֤��ޤ���
     req.query['q']          
     req.query['num']       
   end
 end
 MyCGI.new.start()

Ʊ��̾���Υե�����ɤ�ʣ�������硢list �᥽�åɤ� each_data �᥽�åɤ�Ȥ��ޤ���

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.query['q'].list     #=> �ե�������ͤ��ݻ�����ʸ�����������֤��ޤ���
   end
 end
 MyCGI.new.start()

query �᥽�åɤ��֤� Hash ���֥������ȤΥ������ͤΤ����ͤ� [[c:WEBrick::HTTPUtils::FormData]] ���饹��
���󥹥��󥹤ˤʤ�ޤ���FormData ���饹�� String ���饹�Υ��֥��饹�Ǥ���


==== �ޥ���ѡ��ȥե�����ɤ��ͤ��������ʥե�����������

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     d = req.query['field_name']   #=> FormData ���饹�Υ��󥹥���
     d.name                        #=> "field_name"
     d.filename                    #=> �⤷����Хե�����̾���֤���
     d['content-type']             #=> �إå����ͤ� [] �᥽�åɤǼ�������
     d                             #=> �����Ƥ����ե���������
   end
 end
 MyCGI.new.start()


==== ���饤����Ȥ˥��å������Ϥ�

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     c1 = WEBrick::Cookie.new("name1", "val1")
     c1.expires = Time.now + 30
     res.cookies << c1
     
     c2 = WEBrick::Cookie.new("name2", "val2")
     c2.expires = Time.now + 30
     res.cookies << c2
   end
 end
 MyCGI.new.start()

==== ���饤����Ȥ��饯�å���������

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.cookies                                   #=> WEBrick::Cookie ���֥������Ȥ�����
     c = req.cookies.find{|c| c.name == "name1" }  #=> WEBrick::Cookie ���֥�������
   end
 end
 MyCGI.new.start()


==== CGI �˴�Ϣ����Ķ��ѿ����ͤ��������

CGI �˴�Ϣ����Ķ��ѿ����ͤ�ľ�� ENV ��������¾�ˡ�
WEBrick::HTTPRequest ���֥������Ȥγƥ᥽�åɤ������뤳�Ȥ��Ǥ��ޤ���

 require "webrick/cgi"
 class MyCGI < WEBrick::CGI
   def do_GET(req, res)
     req.content_length
     req.content_type
     req.path_info
     req.query_string
     req.peeraddr
     req.host
     req.user
     req.request_method
     req.script_name
     req.port
   end
 end
 MyCGI.new.start()

=== ���

 * [[rfc:3875]]
