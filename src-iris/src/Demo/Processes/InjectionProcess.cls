/// Set starting key index to 1
Class Demo.Processes.InjectionProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='DocId' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='NextKeyIndex' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='450' >
<assign name="NextKeyIndex = 1" property="context.NextKeyIndex" value="1" action="set" languageOverride="" xpos='200' ypos='250' />
<until name='Get PDFs Loop' condition='context.NextKeyIndex=0' xpos='200' ypos='350' xend='200' yend='450' >
<call name='Call Pdf Operation' target='PDF Operation' async='0' xpos='200' ypos='250' >
<request type='Demo.Operations.PDF.PDFRequest' >
<assign property="callrequest.KeyIndex" value="context.NextKeyIndex" action="set" languageOverride="" />
</request>
<response type='Demo.Operations.PDF.PDFResponse' >
<assign property="context.DocId" value="callresponse.PdfId" action="set" languageOverride="" />
<assign property="context.NextKeyIndex" value="callresponse.NextKeyIndex" action="set" languageOverride="" />
</response>
</call>
<call name='Call Embedding Operation' target='Embedding Operation' async='0' xpos='200' ypos='350' >
<request type='Demo.Operations.Embedding.EmbeddingRequest' >
<assign property="callrequest.Pdf" value="context.DocId" action="set" languageOverride="" />
</request>
<response type='Demo.Operations.Embedding.EmbeddingResponse' />
</call>
</until>
</sequence>
</process>
}

}
