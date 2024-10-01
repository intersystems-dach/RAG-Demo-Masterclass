Class Demo.Operations.Prompt.PromptRequest Extends (%Persistent, Ens.Request)
{

/// Input for the LLM
Property Prompt As %String(MAXLEN = "");

Property DocIds As %String(MAXLEN = "");

Storage Default
{
<Data name="PromptRequestDefaultData">
<Subscript>"PromptRequest"</Subscript>
<Value name="1">
<Value>Prompt</Value>
</Value>
<Value name="2">
<Value>DocIds</Value>
</Value>
<Value name="3">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Demo.Operati80EF.PromptRequestD</DataLocation>
<DefaultData>PromptRequestDefaultData</DefaultData>
<IdLocation>^Demo.Operati80EF.PromptRequestD</IdLocation>
<IndexLocation>^Demo.Operati80EF.PromptRequestI</IndexLocation>
<StreamLocation>^Demo.Operati80EF.PromptRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
