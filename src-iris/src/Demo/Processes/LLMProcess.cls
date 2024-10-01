/// 
Class Demo.Processes.LLMProcess Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Demo.GenerateRequest' response='Demo.GenerateResponse' height='2000' width='2000' >
<context>
<property name='RAGOperation' type='Demo.Operations.RAG.RAGResponse' instantiate='0' />
<property name='PromptOperation' type='Demo.Operations.Prompt.PromptResponse' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<call name='Call RAG Operation' target='RAG Operation' async='0' xpos='200' ypos='250' >
<request type='Demo.GenerateRequest' >
<assign property="callrequest.Prompt" value="request.Prompt" action="set" languageOverride="" />
</request>
<response type='Demo.Operations.RAG.RAGResponse' >
<assign property="context.RAGOperation" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<call name='Call Prompt Operation' target='Prompt Operation' async='0' xpos='200' ypos='350' >
<request type='Demo.Operations.Prompt.PromptRequest' >
<assign property="callrequest.Prompt" value="request.Prompt" action="set" languageOverride="" />
<assign property="callrequest.DocIds" value="context.RAGOperation.DocIds" action="set" languageOverride="" />
</request>
<response type='Demo.Operations.Prompt.PromptResponse' >
<assign property="context.PromptOperation" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<call name='Call OpenAI Operation' target='OpenAI Operation' async='0' xpos='200' ypos='450' >
<request type='Demo.GenerateRequest' >
<assign property="callrequest.Prompt" value="context.PromptOperation.Prompt" action="set" languageOverride="" />
</request>
<response type='Demo.Operations.OpenAI.OpenAIResponse' >
<assign property="response.Response" value="callresponse.Response" action="set" languageOverride="" />
</response>
</call>
</sequence>
</process>
}

}
