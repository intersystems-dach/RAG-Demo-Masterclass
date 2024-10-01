Class Demo.Operations.OpenAI.OpenAIResponse Extends (%Persistent, Demo.GenerateResponse)
{

Property Model As %String(%JSONFIELDNAME = "model", MAXLEN = 200);

Property Created As %Integer(%JSONFIELDNAME = "created");

Property Response As %String(%JSONFIELDNAME = "response", MAXLEN = "");

Property FinishReason As %String(%JSONFIELDNAME = "finish_reason", MAXLEN = "");

Property CompletionTokens As %Integer(%JSONFIELDNAME = "completion_tokens");

Property PromptTokens As %Integer(%JSONFIELDNAME = "prompt_tokens");

Property TotalTokens As %Integer(%JSONFIELDNAME = "total_tokens");

Storage Default
{
<Data name="OpenAIResponseDefaultData">
<Subscript>"OpenAIResponse"</Subscript>
<Value name="1">
<Value>Created</Value>
</Value>
<Value name="2">
<Value>FinishReason</Value>
</Value>
<Value name="3">
<Value>CompletionTokens</Value>
</Value>
<Value name="4">
<Value>PromptTokens</Value>
</Value>
<Value name="5">
<Value>TotalTokens</Value>
</Value>
<Value name="6">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="7">
<Value>Model</Value>
</Value>
<Value name="8">
<Value>Response</Value>
</Value>
</Data>
<DataLocation>^Demo.OperatB6B3.OpenAIResponseD</DataLocation>
<DefaultData>OpenAIResponseDefaultData</DefaultData>
<IdLocation>^Demo.OperatB6B3.OpenAIResponseD</IdLocation>
<IndexLocation>^Demo.OperatB6B3.OpenAIResponseI</IndexLocation>
<StreamLocation>^Demo.OperatB6B3.OpenAIResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
